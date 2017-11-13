require 'open-uri'

class ApurationsController < ApplicationController
  def index
  end

  def count
    response = ''
    created = 0
    not_created = 0
    uev = Uev.where('uevs.token = ?', params[:id]).to_a
    server = uev.first.uev_server
    id = uev.first.id
    open(server) do |http|
      response = http.read
    end
    @json = JSON.parse(response)

    @json.first['votes'].each do |vote|
      voter = Voter.where('voters.cpf = ?', vote['cpf']).to_a.first.id
      election = Election.where('elections.code = ?', @json.first['election_code']).to_a.first.id
      if vote['nulo'].present?
        position = Position.where('positions.name = ?', vote['nulo']).to_a.first.id
        candidate = Candidate.where('candidates.position_id = ? AND candidates.number = 0', position).to_a.first.id
        datetime = DateTime.parse(vote['timestamp'])
        validate_vote = Vote.where('votes.timestamp = ? AND votes.candidate_id = ? ', datetime, candidate).present?
      elsif vote['branco'].present?
        position = Position.where('positions.name = ?', vote['branco']).to_a.first.id
        candidate = Candidate.where('candidates.position_id = ? AND candidates.number = 1', position).to_a.first.id
        datetime = DateTime.parse(vote['timestamp'])
        validate_vote = Vote.where('votes.timestamp = ? AND votes.candidate_id = ? ', datetime, candidate).present?
      else
        candidate = Candidate.where('candidates.number = ?', vote['number']).to_a.first.id
        validate_vote = Vote.where('votes.voter_id = ? AND votes.candidate_id = ? AND votes.election_id = ? ', voter, candidate, election).present?
      end

      unless validate_vote
        @new = Vote.create(uev_id: id, timestamp: vote['timestamp'], voter_id: voter, candidate_id: candidate, election_id: election)
        created = created + 1
      else
        not_created = not_created + 1
      end
    end
    redirect_to votes_path, notice:"#{created} vote(s) created and #{not_created} vote(s) was not created"
  end
end
