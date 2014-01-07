# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

cat_guy = User.find_or_initialize_by(email: "crazycatguy@launchacademy.co") do |user|
  user.password = "w0lfd3n123"
  user.password_confirmation = "w0lfd3n123"
  user.save!
end

# file.open(file.join(rails.root, '/spec/support/fixtures/cats/sleeping_cat.jpeg'))

Dir.glob("#{Rails.root}/spec/support/fixtures/cats/*.jpeg") do |picture|
  cat_guy.posts.create(image: File.open(File.join(picture)))
end
