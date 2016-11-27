
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
ongoing_bet1.choices.new(
  title: "Sylvain sera en avance (avant 9h)",
  bet: ongoing_bet1,
  winning: false
)
ongoing_bet1.choices.new(
  title: "Sylvain sera à l'heure pile poils",
  bet: ongoing_bet1,
  winning: false
)
ongoing_bet1.choices.new(
  title: "Sylvain sera en retard (comme d'hab)",
  bet: ongoing_bet1,
  winning: false
)
ongoing_bet1.save


ongoing_bet2 = Bet.new(
  title: "Qui gagnera les présidentielles 2017 ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2017,5,7,22,30,0)
  #proof: ""
)
ongoing_bet2.choices.new(
  title: "Fillon",
  bet: ongoing_bet2,
  winning: false
)
ongoing_bet2.choices.new(
  title: "Juppé",
  bet: ongoing_bet2,
  winning: false
)
ongoing_bet2.choices.new(
  title: "MLP",
  bet: ongoing_bet2,
  winning: false
)
ongoing_bet2.choices.new(
  title: "Mélenchon",
  bet: ongoing_bet2,
  winning: false
)
ongoing_bet2.save


ongoing_bet3 = Bet.new(
  title: "Julien est-il un black gay ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2016,12,2,19,0,0),
  #proof: "",
  challenge_title: "Kiss kiss !",
  challenge: "Si tu te trompes, tu devras embrasser Julien sur la bouche (dans n'importe quel cas) !"
)
ongoing_bet3.choices.new(
  title: "Oui",
  bet: ongoing_bet3,
  winning: false
)
ongoing_bet3.choices.new(
  title: "Non",
  bet: ongoing_bet3,
  winning: false
)
ongoing_bet3.choices.new(
  title: "Il est bi !",
  bet: ongoing_bet3,
  winning: false
)
ongoing_bet3.save


ongoing_bet4 = Bet.new(
  title: "Ronaldo va-t-il gagner le Ballon d'or ?",
  user: users.sample,
  category: Category.where(name: "Sports").first,
  finish_at: DateTime.new(2017,9,1,19,0,0)
)
ongoing_bet4.choices.new(
  title: "Oui",
  bet: ongoing_bet4,
  winning: false
)
ongoing_bet4.choices.new(
  title: "Non",
  bet: ongoing_bet4,
  winning: false
)


ongoing_bet5 = Bet.new(
  title: "Yvon va-t-il se battre avec un Bulgare avant la fin de la formation ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2016,12,2,19,0,0)
  #proof: "",
  #challenge_title: "",
  #challenge: ""
)
ongoing_bet5.choices.new(
  title: "Oui",
  bet: ongoing_bet5,
  winning: false
)
ongoing_bet5.choices.new(
  title: "Non",
  bet: ongoing_bet5,
  winning: false
)


ongoing_bet6 = Bet.new(
  title: "Vais-je tenir 100 jours sans manger ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2017,3,12,12,0,0),
  #proof: "",
  challenge_title: "Passage de tondeuse",
  challenge: "S'il ne tient pas les 100 jours, il devra se faire la boule à zéro mais s'il tient, c'est toi qui deviendra chauve !!"
)
ongoing_bet6.choices.new(
  title: "Oui",
  bet: ongoing_bet6,
  winning: false
)
ongoing_bet6.choices.new(
  title: "Non",
  bet: ongoing_bet6,
  winning: false
)


ongoing_bet7 = Bet.new(
  title: "Brad Pitt va-t-il se taper Marion Cotillard avant 2017 ?",
  user: users.sample,
  category: Category.where(name: "Stars").first,
  finish_at: DateTime.new(2017,1,1,0,0,0)
)
ongoing_bet7.choices.new(
  title: "Oui",
  bet: ongoing_bet7,
  winning: false
)
ongoing_bet7.choices.new(
  title: "Non",
  bet: ongoing_bet7,
  winning: false
)


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
played_bet1.choices.new(
  title: "Hillary",
  bet: played_bet1,
  winning: false
  )
played_bet1.choices.new(
  title: "Donald",
  bet: played_bet1,
  winning: true
  )
played_bet1.save


played_bet2 = Bet.new(
  title: "Qui passera au 2nd tour des primaires de la droite ?",
  user: users.sample,
  category: Category.where(name: "Politique").first,
  finish_at: DateTime.new(2016,11,20,20,55,18)
  #proof: ""
  )
played_bet2.choices.new(
  title: "Juppé",
  bet: played_bet2,
  winning: true
  )
played_bet2.choices.new(
  title: "Sarko",
  bet: played_bet2,
  winning: true
  )
played_bet2.choices.new(
  title: "Fillon",
  bet: played_bet2,
  winning: true
  )
played_bet2.choices.new(
  title: "Le Maire",
  bet: played_bet2,
  winning: true
  )
played_bet2.choices.new(
  title: "Coppé",
  bet: played_bet2,
  winning: true
  )
played_bet2.save


played_bets = [
  played_bet1,
  played_bet2
]



users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet1.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet2.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet3.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet4.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet5.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet6.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: ongoing_bet7.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: played_bet1.choices.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: played_bet2.choices.sample
  )

  user.user_choices << uc
end

