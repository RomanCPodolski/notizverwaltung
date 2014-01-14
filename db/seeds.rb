# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 	users = User.create([{name: 'Roman', 	password: 'SHA(letmeinplz)'},
#					 {name: 'Dominik',	password: 'SHA(letmeinplz)'},
#					 {name: 'Janek', 	password: 'SHA(letmeinplz)'}]);

# ----- SEEDS UNBEDINGT CHECKEN!!! SONST DOPPELTE EINTRÄGE!!!!! ------ #
Status.create({"name"=>"Neu"})
Status.create({"name"=>"In Bearbeitung"})
Status.create({"name"=>"Dringend"})
#Status.create({"name"=>"Unterhose"})
Status.create({"name"=>"Erledigt"})

Category.create({"name"=>"Arbeit"})
Category.create({"name"=>"Sonstiges"})