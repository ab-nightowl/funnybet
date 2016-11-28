
User.destroy_all
Category.destroy_all
Bet.destroy_all
Choice.destroy_all
UserChoice.destroy_all


Faker::Config.locale = 'fr'

users = []
4.times do
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
  title: "Qui gagnera les élections US 2016 ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2016,11,9,1,54,3)
  #proof: ""
)
choice_1a = ongoing_bet1.choices.new(
  title: "Sylvain sera en avance (avant 9h)",
  bet: ongoing_bet1,
  winning: false
)
choice_1b = ongoing_bet1.choices.new(
  title: "Sylvain sera à l'heure pile poils",
  bet: ongoing_bet1,
  winning: false
)
choice_1c = ongoing_bet1.choices.new(
  title: "Sylvain sera en retard (comme d'hab)",
  bet: ongoing_bet1,
  winning: false
)
ongoing_bet1.save
choice_1a.save
choice_1b.save
choice_1c.save


ongoing_bet2 = Bet.new(
  title: "Qui gagnera les présidentielles 2017 ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2017,5,7,22,30,0)
  #proof: ""
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
  title: "Julien est-il un black gay ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2016,12,2,19,0,0),
  #proof: "",
  challenge_title: "Kiss kiss !",
  challenge: "Si tu te trompes, tu devras embrasser Julien sur la bouche (dans n'importe quel cas) !"
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
choice_3c = ongoing_bet3.choices.new(
  title: "Il est bi !",
  bet: ongoing_bet3,
  winning: false
)
ongoing_bet3.save
choice_3a.save
choice_3b.save
choice_3c.save


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
  title: "Brad Pitt va-t-il se taper Marion Cotillard avant 2017 ?",
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


ongoing_bets = [
  ongoing_bet1,
  ongoing_bet2,
  ongoing_bet3,
  ongoing_bet4,
  ongoing_bet5,
  ongoing_bet6,
  ongoing_bet7
]


played_bet1 = Bet.new(
  title: "Qui gagnera les élections US 2016 ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2016,11,9,1,54,3)
  #proof: ""
  )
choice_8a = played_bet1.choices.new(
  title: "Hillary",
  bet: played_bet1,
  winning: false
  )
choice_8b = played_bet1.choices.new(
  title: "Donald",
  bet: played_bet1,
  winning: true
  )
played_bet1.save
choice_8a.save
choice_8b.save


played_bet2 = Bet.new(
  title: "Qui passera au 2nd tour des primaires de la droite ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2016,11,20,20,55,18)
  #proof: ""
  )
choice_9a = played_bet2.choices.new(
  title: "Juppé",
  bet: played_bet2,
  winning: true
  )
choice_9b = played_bet2.choices.new(
  title: "Sarko",
  bet: played_bet2,
  winning: true
  )
choice_9c = played_bet2.choices.new(
  title: "Fillon",
  bet: played_bet2,
  winning: true
  )
choice_9d = played_bet2.choices.new(
  title: "Le Maire",
  bet: played_bet2,
  winning: true
  )
choice_9e = played_bet2.choices.new(
  title: "Coppé",
  bet: played_bet2,
  winning: true
  )
played_bet2.save
choice_9a.save
choice_9b.save
choice_9c.save
choice_9d.save
choice_9e.save


played_bets = [
  played_bet1,
  played_bet2
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
