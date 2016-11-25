
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
ongoing_bet1.choices.create(
  title: "Sylvain sera en avance (avant 9h)",
  winning: false
)
ongoing_bet1.choices.create(
  title: "Sylvain sera à l'heure pile poils",
  winning: false
)
ongoing_bet1.choices.create(
  title: "Sylvain sera en retard (comme d'hab)",
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
ongoing_bet2.choices.create(
  title: "Fillon",
  winning: false
)
ongoing_bet2.choices.create(
  title: "Juppé",
  winning: false
)
ongoing_bet2.choices.create(
  title: "MLP",
  winning: false
)
ongoing_bet2.choices.create(
  title: "Mélenchon",
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
ongoing_bet3.choices.create(
  title: "Oui",
  winning: false
)
ongoing_bet3.choices.create(
  title: "Non",
  winning: false
)
ongoing_bet3.choices.create(
  title: "Il est bi !",
  winning: false
)
ongoing_bet3.save


ongoing_bet4 = Bet.new(
  title: "Ronaldo va-t-il gagner le Ballon d'or ?",
  user: users.sample,
  category: Category.where(name: "Sports").first,
  finish_at: DateTime.new(2017,9,1,19,0,0)
)
ongoing_bet4.choices.create(
  title: "Oui",
  winning: false
)
ongoing_bet4.choices.create(
  title: "Non",
  winning: false
)


ongoing_bet5 = Bet.new(
  title: "Yvon va-t-il se battre avec un Bulgare avant la fin de la formation ?",
  user: users.sample,
  category: Category.where(name: "Privé").first,
  finish_at: DateTime.new(2016,12,2,19,0,0),
  #proof: "",
  #challenge_title: "",
  #challenge: ""
)
ongoing_bet5.choices.create(
  title: "Oui",
  winning: false
)
ongoing_bet5.choices.create(
  title: "Non",
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
ongoing_bet6.choices.create(
  title: "Oui",
  winning: false
)
ongoing_bet6.choices.create(
  title: "Non",
  winning: false
)

ongoing_bet7 = Bet.new(
  title: "Brad Pitt va-t-il se taper Marion Cotillard avant 2017 ?",
  user: users.sample,
  category: Category.where(name: "Stars").first,
  finish_at: DateTime.new(2017,1,1,0,0,0)
)
ongoing_bet7.choices.create(
  title: "Oui",
  winning: false
)
ongoing_bet7.choices.create(
  title: "Non",
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
played_bet1.choices.create(
  title: "Hillary",
  bet: played_bets[0],
  winning: false
  )
played_bet1.choices.create(
  title: "Donald",
  bet: played_bets[0],
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
played_bet2.choices.create(
  title: "Juppé",
  winning: true
  )
played_bet2.choices.create(
  title: "Sarko",
  winning: true
  )
played_bet2.choices.create(
  title: "Fillon",
  winning: true
  )
played_bet2.choices.create(
  title: "Le Maire",
  winning: true
  )
played_bet2.choices.create(
  title: "Coppé",
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
  choice: choices_of_bet1.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet2.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet3.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet4.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet5.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet6.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet7.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet8.sample
  )

  user.user_choices << uc
end
users.each do |user|
  uc = UserChoice.create!(
  user: user,
  choice: choices_of_bet9.sample
  )

  user.user_choices << uc
end
# users.each do |user|
#   uc = UserChoice.create!(
#   user: user,
#   choice: choices_of_bet10.sample
#   )

#   user.user_choices << uc
# end

