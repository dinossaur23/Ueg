require 'open-uri'

class ApurationsController < ApplicationController
  # def index
  #   response = ''
  #   open('http://localhost:3002/votes') do |http|
  #     response = http.read
  #   end
  #   @json = JSON.parse(response)
  # end

  # def index
  #   response = ''
  #   uev = Uev.where('uevs.token = ?', params[:id]).to_a
  #   server = uev.first.uev_server
  #   open(server) do |http|
  #     response = http.read
  #   end
  #   @json = JSON.parse(response)
  # end

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
      voter = Voter.where('voters.cpf == ?', vote['cpf']).to_a.first.id
      candidate = Candidate.where('candidates.number == ?', vote['number']).to_a.first.id
      validate_vote = Vote.where('votes.voter_id == ? AND votes.candidate_id == ? ', voter, candidate).present?

      unless validate_vote
        @new = Vote.create(uev_id: id, timestamp: vote['timestamp'], voter_id: voter, candidate_id: candidate)
        created = created + 1
      else
        not_created = not_created + 1
      end
    end
    redirect_to votes_path, notice:"#{created} vote(s) created and #{not_created} vote(s) was not created"
  end
end
