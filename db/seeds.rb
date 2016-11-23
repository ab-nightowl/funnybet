
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


ongoing_bets = [
  Bet.create!(
    title: "A quelle heure arrivera Sylvain le matin du Demo Day ?",
    description: "Comme notre maître Ruby aime bien arriver après ses éleves, sera-t-il à l'heure le dernier jour pour le Demo Day",
    user: users.sample,
    category: Category.where(name: "Privé").first,
    finish_at: DateTime.new(2016,12,2,9,0,1),
    #proof: "",
    challenge_title: "Le roux blond !",
    challenge: "Si Sylvain arrive en retard (après 9h pétantes), il devra se teindre en blond"
  ),
  Bet.create!(
    title: "Qui gagnera les présidentielles 2017 ?",
    user: users.sample,
    category: Category.where(name: "Politique").first,
    finish_at: DateTime.new(2017,5,7,22,30,0)
    #proof: ""
  ),
  Bet.create!(
    title: "Julien est-il un black gay ?",
    user: users.sample,
    category: Category.where(name: "Privé").first,
    finish_at: DateTime.new(2016,12,2,19,0,0),
    #proof: "",
    challenge_title: "Kiss kiss !",
    challenge: "Si tu te trompes, tu devras embrasser Julien sur la bouche (dans n'importe quel cas) !"
  ),
  Bet.create!(
    title: "Ronaldo va-t-il gagner le Ballon d'or ?",
    user: users.sample,
    category: Category.where(name: "Sports").first,
    finish_at: DateTime.new(2017,9,1,19,0,0)
  ),
  Bet.create!(
    title: "Yvon va-t-il se battre avec un Bulgare avant la fin de la formation ?",
    user: users.sample,
    category: Category.where(name: "Privé").first,
    finish_at: DateTime.new(2016,12,2,19,0,0),
    #proof: "",
    #challenge_title: "",
    #challenge: ""
  ),
  Bet.create!(
    title: "Vais-je tenir 100 jours sans manger ?",
    user: users.sample,
    category: Category.where(name: "Privé").first,
    finish_at: DateTime.new(2017,3,12,12,0,0),
    #proof: "",
    challenge_title: "Passage de tondeuse",
    challenge: "S'il ne tient pas les 100 jours, il devra se faire la boule à zéro mais s'il tient, c'est toi qui deviendra chauve !!"
  ),
  Bet.create!(
    title: "Brad Pitt va-t-il se taper Marion Cotillard avant 2017 ?",
    user: users.sample,
    category: Category.where(name: "Stars").first,
    finish_at: DateTime.new(2017,1,1,0,0,0)
  )
]


played_bets = [
  Bet.create!(
    title: "Qui gagnera les élections US 2016 ?",
    user: users.sample,
    category: Category.where(name: "Politique").first,
    finish_at: DateTime.new(2016,11,9,1,54,3)
    #proof: ""
  ),
  Bet.create!(
    title: "Qui passera au 2nd tour des primaires de la droite ?",
    user: users.sample,
    category: Category.where(name: "Politique").first,
    finish_at: DateTime.new(2016,11,20,20,55,18)
    #proof: ""
  )
  # Bet.create!(
  #   title: ,
  #   description: ,
  #   user: users.sample,
  #   category: Category.where(name: "category").first,
  #   finish_at: Faker::Time.between(1.day.ago, 7.days.ago),
  #   proof: "",
  #   challenge_title: "",
  #   challenge: ""
  # )
]


choices_of_bet1 = [
  Choice.create!(
    title: "Sylvain sera en avance (avant 9h)",
    bet: ongoing_bets[0],
    winning: false
    ),
  Choice.create!(
    title: "Sylvain sera à l'heure pile poils",
    bet: ongoing_bets[0],
    winning: false
    ),
  Choice.create!(
    title: "Sylvain sera en retard (comme d'hab)",
    bet: ongoing_bets[0],
    winning: false
    )
]
choices_of_bet2 = [
  Choice.create!(
    title: "Fillon",
    bet: ongoing_bets[1],
    winning: false
    ),
  Choice.create!(
    title: "Juppé",
    bet: ongoing_bets[1],
    winning: false
    ),
  Choice.create!(
    title: "MLP",
    bet: ongoing_bets[1],
    winning: false
    ),
  Choice.create!(
    title: "Mélenchon",
    bet: ongoing_bets[1],
    winning: false
    )
]
choices_of_bet3 = [
  Choice.create!(
    title: "Oui",
    bet: ongoing_bets[2],
    winning: false
    ),
  Choice.create!(
    title: "Non",
    bet: ongoing_bets[2],
    winning: false
    ),
  Choice.create!(
    title: "Il est bi !",
    bet: ongoing_bets[2],
    winning: false
    )
]
choices_of_bet4 = [
  Choice.create!(
    title: "Oui",
    bet: ongoing_bets[3],
    winning: false
    ),
  Choice.create!(
    title: "Non",
    bet: ongoing_bets[3],
    winning: false
    )
]
choices_of_bet5 = [
  Choice.create!(
    title: "Oui",
    bet: ongoing_bets[4],
    winning: false
    ),
  Choice.create!(
    title: "Non",
    bet: ongoing_bets[4],
    winning: false
    )
]
choices_of_bet6 = [
  Choice.create!(
    title: "Oui",
    bet: ongoing_bets[5],
    winning: false
    ),
  Choice.create!(
    title: "Non",
    bet: ongoing_bets[5],
    winning: false
    )
]
choices_of_bet7 = [
  Choice.create!(
    title: "Oui",
    bet: ongoing_bets[6],
    winning: false
    ),
  Choice.create!(
    title: "Non",
    bet: ongoing_bets[6],
    winning: false
    )
]
choices_of_bet8 = [
  Choice.create!(
    title: "Hillary",
    bet: played_bets[0],
    winning: false
    ),
  Choice.create!(
    title: "Donald",
    bet: played_bets[0],
    winning: true
    )
]
choices_of_bet9 = [
  Choice.create!(
    title: "Juppé",
    bet: played_bets[1],
    winning: true
    ),
  Choice.create!(
    title: "Sarko",
    bet: played_bets[1],
    winning: false
    ),
  Choice.create!(
    title: "Fillon",
    bet: played_bets[1],
    winning: true
    ),
  Choice.create!(
    title: "Le Maire",
    bet: played_bets[1],
    winning: false
    ),
  Choice.create!(
    title: "Coppé",
    bet: played_bets[1],
    winning: false
    )
]
# choices_of_bet10 = [
#   Choice.create!(
#     title: ,
#     bet: played_bets[2],
#     winning: winning_status.sample
#     ),
#   Choice.create!(
#     title: ,
#     bet: played_bets[2],
#     winning: winning_status.sample
#     ),
#   Choice.create!(
#     title: ,
#     bet: played_bets[2],
#     winning: winning_status.sample
#     )
# ]


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

