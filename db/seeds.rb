# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

species_names = ["Acara", "Aisha", "Blumaroo", "Bori", "Bruce", "Buzz", "Chia", "Chomby", "Cybunny", "Draik", "Elephante", "Eyrie", "Flotsam", "Gelert", "Gnorbu", "Grarrl", "Grundo", "Hissi", "Ixi", "Jetsam", "Jubjub", "Kacheek", "Kau", "Kiko", "Koi", "Korbat", "Kougra", "Krawk", "Kyrii", "Lenny", "Lupe", "Lutari", "Meerca", "Moehog", "Mynci", "Nimmo", "Ogrin", "Peophin", "Poogle", "Pteri", "Quiggle", "Ruki", "Scorchio", "Shoyru", "Skeith", "Techo", "Tonu", "Tuskaninny", "Uni", "Usul", "Wocky", "Xweetok", "Yurble", "Zafara", "Vandagyre"]
species_names.each do |name|
  Species.find_or_create_by name: name
end

color_names =  ["Alien", "Apple", "Asparagus", "Aubergine", "Avocado", "Baby", "Biscuit", "Blue", "Blueberry", "Brown", "Camouflage", "Carrot", "Checkered", "Chocolate", "Chokato", "Christmas", "Clay", "Cloud", "Coconut", "Custard", "Darigan", "Desert", "Disco", "Durian", "Electric", "Faerie", "Fire", "Garlic", "Ghost", "Glowing", "Gold", "Gooseberry", "Grape", "Green", "Grey", "Halloween", "Ice", "Invisible", "Island", "Jelly", "Lemon", "Lime", "Mallow", "Maraquan", "Msp", "Mutant", "Orange", "Pea", "Peach", "Pear", "Pepper", "Pineapple", "Pink", "Pirate", "Plum", "Plushie", "Purple", "Quiguki Boy", "Quiguki Girl", "Rainbow", "Red", "Robot", "Royal Boy", "Royal Girl", "Shadow", "Silver", "Sketch", "Skunk", "Snot", "Snow", "Speckled", "Split", "Sponge", "Spotted", "Starry", "Strawberry", "Striped", "Thornberry", "Tomato", "Tyrannian", "Usuki Boy", "Usuki Girl", "White", "Yellow", "Zombie", "Onion", "Magma", "Relic", "Woodland", "Transparent", "Maractite", "8-bit", "Swamp Gas", "Water", "Wraith", "Eventide", "Elderly Boy", "Elderly Girl", "Stealthy", "Dimensional", "Agueena", "Pastel", "Ummagine", "Polka Dot", "Candy", "Marble", "Steampunk", "Toy", "Origami"]
color_names.each do |name|
  Color.find_or_create_by name: name
end

name_quality = NameQuality.find_or_initialize_by(abbreviation: 'VWN')
name_quality.update(sort_idx: 0, description: 'Pronounceable, 4-7 letters in length, containing only letters, with only the first letter of the name capitalized (e.g. Xxxxxxx)')

name_quality = NameQuality.find_or_initialize_by(abbreviation: 'WN')
name_quality.update(sort_idx: 1, description: 'Pronounceable, of any length, containing only letters, with only the first letter of the name capitalized (e.g. Xxxxxxxxx)')

name_quality = NameQuality.find_or_initialize_by(abbreviation: 'WN(uncapped)')
name_quality.update(sort_idx: 2, description: 'Pronounceable, of any length, containing only letters, with either no capital letters or logical capitalization (e.g. xxxxxx or XxxxXxx)')

name_quality = NameQuality.find_or_initialize_by(abbreviation: 'DN')
name_quality.update(sort_idx: 3, description: 'Pronounceable, of any length, containing mostly letters, with any capitalization pattern (e.g. XxXxXxx, Xxxxxxx, Xxxx##, Xxxxx )')

name_quality = NameQuality.find_or_initialize_by(abbreviation: 'AN')
name_quality.update(sort_idx: 4, description: 'Any format is acceptable')

conversion_state_names = ['Converted', 'Unconverted']
conversion_state_names.each do |name|
  ConversionState.find_or_create_by(name: name)
end
