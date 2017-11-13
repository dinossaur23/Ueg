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

  Voter.create(name: 'Maria da Silva', cpf: '64682187x', date_of_birth: '1964-11-06', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Gabriela Pereira', cpf: '362719233', date_of_birth: '1996-07-30', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Larissa de Souza', cpf: '2378237482', date_of_birth: '1990-02-12', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Julia Rodrigues', cpf: '743678192', date_of_birth: '1999-10-25', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Iara Oliveira', cpf: '63791203', date_of_birth: '1983-06-19', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Carolina Domingues', cpf: '8762678434', date_of_birth: '1987-01-05', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Amanda Souto Pereira', cpf: '646821878', date_of_birth: '1963-05-28', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Roberta Martins', cpf: '23847722', date_of_birth: '1979-08-23', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Fernanda Alves', cpf: '48829133', date_of_birth: '1993-09-29', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Juliana Pereira', cpf: '84892932', date_of_birth: '1996-12-27', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Barbara Castro', cpf: '81393994x', date_of_birth: '1969-02-15', gender: 'F', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Bernardo Fernandes', cpf: '93991943', date_of_birth: '1964-11-06', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Marcos Silva', cpf: '39193402', date_of_birth: '1994-04-18', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Lucas Arantes', cpf: '3890343', date_of_birth: '1982-10-12', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Gabriel Lima', cpf: '42030328', date_of_birth: '1998-08-20', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Mateus Bastos', cpf: '737349823', date_of_birth: '1989-12-05', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Pedro Sodre', cpf: '293994342', date_of_birth: '1996-07-15', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Paulo Vascos', cpf: '8738927363', date_of_birth: '1978-01-07', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Cuca Beludo', cpf: '617627883', date_of_birth: '1954-06-22', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Fernando Gomes', cpf: '39949393', date_of_birth: '1986-02-08', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Cesar Sousa', cpf: '92903013', date_of_birth: '1997-10-03', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Vitor Silva', cpf: '7389420028', date_of_birth: '1989-03-01', gender: 'M', uev_id: uev.id, election_id: election.id)
  Voter.create(name: 'Ricardo Kobashigawa', cpf: '283823242', date_of_birth: '1993-08-14', gender: 'M', uev_id: uev.id, election_id: election.id)
end
