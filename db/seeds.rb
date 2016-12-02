
User.destroy_all
Category.destroy_all
Bet.destroy_all
Choice.destroy_all
UserChoice.destroy_all


Faker::Config.locale = 'fr'

users = []
10.times do
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.user_name,
    password:  Faker::Internet.password,
    email: Faker::Internet.email,
    birthdate: Faker::Date.between(60.years.ago, Date.today),
    rank: 0,
    starting_amount: 100
  )
end


categories_names = [
  "Politique",
  "Sports",
  "Stars",
  "Séries/Films",
  "Technologie",
  "Autre",
  "Privé"
]

categories_names.each do |category|
  Category.create!(name: category)
end


ongoing_bet1 = Bet.new(
  title: "Le PSG va-t-il être champion de Ligue 1 cette saison ?",
  user: users.sample,
  category: Category.where(name: "Sports").first,
  finish_at: DateTime.new(2017,5,20,23,0,0)
  #proof: ""
)
choice_1a = ongoing_bet1.choices.new(
  title: "Oui",
  bet: ongoing_bet1,
  winning: false
)
choice_1b = ongoing_bet1.choices.new(
  title: "Non",
  bet: ongoing_bet1,
  winning: false
)
ongoing_bet1.save
choice_1a.save
choice_1b.save


ongoing_bet2 = Bet.new(
  title: "Qui gagnera les présidentielles 2017 ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2017,5,7,22,30,0),
  challenge_title: "Il va y avoir des larmes...",
  challenge: "...Tu dois croquer dans un oignon !"
)
choice_2a = ongoing_bet2.choices.new(
  title: "Fillon",
  bet: ongoing_bet2,
  winning: false
)
choice_2b = ongoing_bet2.choices.new(
  title: "Juppé",
  bet: ongoing_bet2,
  winning: false
)
choice_2c = ongoing_bet2.choices.new(
  title: "MLP",
  bet: ongoing_bet2,
  winning: false
)
choice_2d = ongoing_bet2.choices.new(
  title: "Mélenchon",
  bet: ongoing_bet2,
  winning: false
)
ongoing_bet2.save
choice_2a.save
choice_2b.save
choice_2c.save
choice_2d.save


ongoing_bet3 = Bet.new(
  title: "Neigera-t-il le jour de Noël ?",
  user: users.sample,
  category: Category.where(name: "Autre").first,
  finish_at: DateTime.new(2016,12,25,23,59,59),
  #proof: "",
  )
choice_3a = ongoing_bet3.choices.new(
  title: "Oui",
  bet: ongoing_bet3,
  winning: false
)
choice_3b = ongoing_bet3.choices.new(
  title: "Non",
  bet: ongoing_bet3,
  winning: false
)
ongoing_bet3.save
choice_3a.save
choice_3b.save


ongoing_bet4 = Bet.new(
  title: "Ronaldo va-t-il gagner le Ballon d'or ?",
  user: users.sample,
  category: Category.where(name: "Sports").first,
  finish_at: DateTime.new(2017,9,1,19,0,0)
)
choice_4a = ongoing_bet4.choices.new(
  title: "Oui",
  bet: ongoing_bet4,
  winning: false
)
choice_4b = ongoing_bet4.choices.new(
  title: "Non",
  bet: ongoing_bet4,
  winning: false
)
ongoing_bet4.save
choice_4a.save
choice_4b.save


ongoing_bet5 = Bet.new(
  title: "Yvon va-t-il se battre avec un Bulgare avant la fin de la formation ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2016,12,2,19,0,0)
  #proof: "",
  #challenge_title: "",
  #challenge: ""
)
choice_5a = ongoing_bet5.choices.new(
  title: "Oui",
  bet: ongoing_bet5,
  winning: false
)
choice_5b = ongoing_bet5.choices.new(
  title: "Non",
  bet: ongoing_bet5,
  winning: false
)
ongoing_bet5.save
choice_5a.save
choice_5b.save


ongoing_bet6 = Bet.new(
  title: "Vais-je tenir 100 jours sans manger ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2017,3,12,12,0,0),
  #proof: "",
  challenge_title: "Passage de tondeuse",
  challenge: "S'il ne tient pas les 100 jours, il devra se faire la boule à zéro mais s'il tient, c'est toi qui deviendra chauve !!"
)
choice_6a = ongoing_bet6.choices.new(
  title: "Oui",
  bet: ongoing_bet6,
  winning: false
)
choice_6b = ongoing_bet6.choices.new(
  title: "Non",
  bet: ongoing_bet6,
  winning: false
)
ongoing_bet6.save
choice_6a.save
choice_6b.save


ongoing_bet7 = Bet.new(
  title: "Brad Pitt va-t-il sortir avec Marion Cotillard avant 2017 ?",
  user: users.sample,
  category: Category.where(name: "Stars").first,
  finish_at: DateTime.new(2017,1,1,0,0,0)
)
choice_7a = ongoing_bet7.choices.new(
  title: "Oui",
  bet: ongoing_bet7,
  winning: false
)
choice_7b = ongoing_bet7.choices.new(
  title: "Non",
  bet: ongoing_bet7,
  winning: false
)
ongoing_bet7.save
choice_7a.save
choice_7b.save


ongoing_bet8 = Bet.new(
  title: "Berlusconi va-t-il refaire une soirée Bunga Bunga avant la fin de l'année ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2017,1,1,0,0,0)
)
choice_8a = ongoing_bet8.choices.new(
  title: "Oui",
  bet: ongoing_bet8,
  winning: false
)
choice_8b = ongoing_bet8.choices.new(
  title: "Non",
  bet: ongoing_bet8,
  winning: false
)
ongoing_bet8.save
choice_8a.save
choice_8b.save


ongoing_bet9 = Bet.new(
  title: "Qui de 2Pac et Michael Jackson va refaire son apparition en 2017 ?",
  user: users.sample,
  category: Category.where(name: "Stars").first,
  finish_at: DateTime.new(2018,1,1,0,0,0)
)
choice_9a = ongoing_bet9.choices.new(
  title: "2Pac",
  bet: ongoing_bet9,
  winning: false
)
choice_9b = ongoing_bet9.choices.new(
  title: "Michael Jackson",
  bet: ongoing_bet9,
  winning: false
)
choice_9c = ongoing_bet9.choices.new(
  title: "Aucun des deux",
  bet: ongoing_bet9,
  winning: false
)
ongoing_bet9.save
choice_9a.save
choice_9b.save
choice_9c.save


ongoing_bet10 = Bet.new(
  title: "Combien vaudra un pain au chocolat en 2017 ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2017,5,7,22,30,0)
)
choice_10a = ongoing_bet10.choices.new(
  title: "Entre 0 et 15 cents",
  bet: ongoing_bet7,
  winning: false
)
choice_10b = ongoing_bet10.choices.new(
  title: "Entre 15 cents et 1,50€",
  bet: ongoing_bet10,
  winning: false
)
choice_10b = ongoing_bet10.choices.new(
  title: "Entre 1,50€ et 2€",
  bet: ongoing_bet10,
  winning: false
)
ongoing_bet10.save
choice_10a.save
choice_10b.save


ongoing_bet11 = Bet.new(
  title: "L'entreprise Samsung va-t-elle faire faillite après les téléphones explosés ?",
  user: users.sample,
  category: Category.where(name: "Technologie").first,
  finish_at: DateTime.new(2017,3,3,0,0,0)
)
choice_11a = ongoing_bet11.choices.new(
  title: "Oui",
  bet: ongoing_bet11,
  winning: false
)
choice_11b = ongoing_bet11.choices.new(
  title: "Non",
  bet: ongoing_bet11,
  winning: false
)
ongoing_bet11.save
choice_11a.save
choice_11b.save


ongoing_bet12 = Bet.new(
  title: "Quand l'Homme fera-t-il son premier pas sur Mars ?",
  user: users.sample,
  category: Category.where(name: "Technologie").first,
  finish_at: DateTime.new(2030,1,1,0,0,0)
)
choice_12a = ongoing_bet12.choices.new(
  title: "Avant 2025",
  bet: ongoing_bet12,
  winning: false
)
choice_12b = ongoing_bet12.choices.new(
  title: "Entre 2025 et 2030",
  bet: ongoing_bet12,
  winning: false
)
choice_12c = ongoing_bet12.choices.new(
  title: "Après 2030",
  bet: ongoing_bet12,
  winning: false
)
ongoing_bet12.save
choice_12a.save
choice_12b.save
choice_12c.save


ongoing_bet13 = Bet.new(
  title: "Kanye West va-t-il sortir de l'asile avant 2017 ?",
  user: users.sample,
  category: Category.where(name: "Stars").first,
  finish_at: DateTime.new(2017,1,1,0,0,0)
)
choice_13a = ongoing_bet13.choices.new(
  title: "Oui",
  bet: ongoing_bet13,
  winning: false
)
choice_13b = ongoing_bet13.choices.new(
  title: "Non",
  bet: ongoing_bet13,
  winning: false
)
ongoing_bet13.save
choice_13a.save
choice_13b.save


ongoing_bets = [
  ongoing_bet1,
  ongoing_bet2,
  ongoing_bet3,
  ongoing_bet4,
  ongoing_bet5,
  ongoing_bet6,
  ongoing_bet7,
  ongoing_bet8,
  ongoing_bet9,
  ongoing_bet10,
  ongoing_bet11,
  ongoing_bet12,
  ongoing_bet13
]


played_bet1 = Bet.new(
  title: "Qui gagnera les élections US 2016 ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2016,11,9,1,54,3)
  #proof: ""
  )
played_choice_1a = played_bet1.choices.new(
  title: "Hillary",
  bet: played_bet1,
  winning: false
  )
played_choice_1b = played_bet1.choices.new(
  title: "Donald",
  bet: played_bet1,
  winning: true
  )
played_bet1.save
played_choice_1a.save
played_choice_1b.save


played_bet2 = Bet.new(
  title: "Qui passera au 2nd tour des primaires de la droite ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2016,11,20,20,55,18)
  #proof: ""
  )
played_choice_2a = played_bet2.choices.new(
  title: "Juppé",
  bet: played_bet2,
  winning: true
  )
played_choice_2b = played_bet2.choices.new(
  title: "Sarko",
  bet: played_bet2,
  winning: true
  )
played_choice_2c = played_bet2.choices.new(
  title: "Fillon",
  bet: played_bet2,
  winning: true
  )
played_choice_2d = played_bet2.choices.new(
  title: "Le Maire",
  bet: played_bet2,
  winning: true
  )
played_choice_2e = played_bet2.choices.new(
  title: "Coppé",
  bet: played_bet2,
  winning: true
  )
played_bet2.save
played_choice_2a.save
played_choice_2b.save
played_choice_2c.save
played_choice_2d.save
played_choice_2e.save


played_bet3 = Bet.new(
  title: "A quelle heure arrivera Alex le matin du Demo Day ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2016,12,2,12,0,0)
  #proof: ""
)
played_choice_3a = played_bet3.choices.new(
  title: "En avance (avant 9h)",
  bet: played_bet3,
  winning: false
)
played_choice_3b = played_bet3.choices.new(
  title: "A l'heure pile poils",
  bet: played_bet3,
  winning: false
)
played_choice_3c = played_bet3.choices.new(
  title: "En retard (comme d'hab)",
  bet: played_bet3,
  winning: false
)
played_bet3.save
played_choice_3a.save
played_choice_3b.save
played_choice_3c.save


played_bets = [
  played_bet1,
  played_bet2,
  played_bet3
]



users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet1.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet2.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet3.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet4.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet5.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet6.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet7.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet8.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet9.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet10.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet11.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet12.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet13.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: played_bet1.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: played_bet2.choices.sample,
  bet_amount: 10
  )
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: played_bet3.choices.sample,
  bet_amount: 10
  )
end
