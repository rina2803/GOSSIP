require 'faker'

User.destroy_all
Gossip.destroy_all
City.destroy_all
Comment.destroy_all


10.times do
    tag = Tag.create(title: "##{Faker::Verb.base}")

end

  10.times do
    city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
 end
10.times do
  #create user
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10, supplemental: true), email: Faker::Internet.email, age: rand(18..80), city_id: City.all.sample.id)
  #assign city to user
 
end
10.times do

  gossip = Gossip.create(title: Faker::Game.title, content: Faker::Lorem.sentence(word_count: 120, supplemental: true), user_id: User.all.sample.id)
 end

50.times do
	comment = Comment.create(content: Faker::Lorem.sentence(word_count: 10, supplemental: true), user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id )
 end

20.times do
	goss= GossipToTag.create(gossip_id: Gossip.all.sample.id , tag_id: Tag.all.sample.id)
end