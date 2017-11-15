require 'open-uri'

class ApurationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def count
    response = ''
    created = 0
    not_created = 0
    uev = Uev.where('uevs.token = ?', params[:id]).to_a
    id = uev.first.id

    information = request.raw_post
    @json = JSON.parse(information)

    find_election = Election.where('elections.code = ?', @json.first['election_code']).to_a
    return head :bad_request if find_election.empty?

    election = find_election.first.id

    @json.first['votes'].each do |vote|
      find_voter = Voter.where('voters.cpf = ?', vote['cpf']).to_a
      return head :bad_request if find_voter.empty?

      voter = find_voter.first.id
      if vote['nulo'].present?
        find_position = Position.where('positions.name = ?', vote['nulo']).to_a
        return head :bad_request if find_position.empty?

        position = find_position.first.id
        find_candidate = Candidate.where('candidates.position_id = ? AND candidates.number = 0', position).to_a
        return head :bad_request if find_candidate.empty?

        candidate = find_candidate.first.id
        datetime = DateTime.parse(vote['timestamp'])
        validate_vote = Vote.where('votes.timestamp = ? AND votes.candidate_id = ? ', datetime, candidate).present?
      elsif vote['branco'].present?
        find_position = Position.where('positions.name = ?', vote['branco']).to_a
        return head :bad_request if find_position.empty?

        position = find_position.first.id
        find_candidate = Candidate.where('candidates.position_id = ? AND candidates.number = 0', position).to_a
        return head :bad_request if find_candidate.empty?

        candidate = find_candidate.first.id
        datetime = DateTime.parse(vote['timestamp'])
        validate_vote = Vote.where('votes.timestamp = ? AND votes.candidate_id = ? ', datetime, candidate).present?
      else
        find_candidate = Candidate.where('candidates.number = ?', vote['number']).to_a
        return head :bad_request if find_candidate.empty?

        candidate = find_candidate.first.id
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
