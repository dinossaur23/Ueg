# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
positions = Position.create([{ name: 'Presidente' }, { name: 'Governador' }, { name: 'Prefeito' }, { name: 'Deputado Federal' }, { name: 'Senador' }, { name: 'Deputado Estadual' }, { name: 'Vereador' }, { name: 'Nulo' }, { name: 'Branco' }])

election = Election.create(code: '2018', init: '13/11/2017 05:00:00', finish: '13/11/2017 18:30:00')

primeira = Uev.create(token: 'primeira', uev_server: 'uev.herokuapp.com/votes')
quatro = Uev.create(token: 'quatro')
cinco = Uev.create(token: 'cinco')
oito = Uev.create(token: 'oito')
doze = Uev.create(token: 'doze')
quinze = Uev.create(token: 'quinze')

Uev.all.each do |uev|
  Position.all.each do |position|
    Candidate.create(name: 'Nulo', number: 0, position_id: position.id, uev_id: uev.id, election_id: election.id)
    Candidate.create(name: 'Branco', number: 1, position_id: position.id, uev_id: uev.id, election_id: election.id)
  end

  Candidate.create(name: 'Francisco Everardo Oliveira Silva', nickname: 'Tiririca', number: 2222, position_id: 4, uev_id: uev.id, election_id: election.id)
  Candidate.create(name: 'Enéas Ferreira Carneiro', nickname: 'Eneias', number: 5656, position_id: 4, uev_id: uev.id, election_id: election.id)
  Candidate.create(name: 'Arthur Curry', nickname: 'Aquaman', number: 8819, position_id: 4, uev_id: uev.id, election_id: election.id)
  Candidate.create(name: 'Lex Luthor', nickname: 'Lex', number: 1000, position_id: 4, uev_id: uev.id, election_id: election.id)
  Candidate.create(name: 'Diana Prince Rockwell Trevor', nickname: 'WonderWoman', number: 8819, position_id: 4, uev_id: uev.id, election_id: election.id)
  Candidate.create(name: 'Bruce Wayne', nickname: 'Batman', number: 99, position_id: 1, uev_id: uev.id, election_id: election.id)
  Candidate.create(name: 'Clark Kent', nickname: 'SuperMan', number: 12, position_id: 1, uev_id: uev.id, election_id: election.id)
end
