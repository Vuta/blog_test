# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
insert_user = "INSERT INTO users (username, email, created_at, updated_at) VALUES "
insert_post = "INSERT INTO posts (title, content, user_id, created_at, updated_at) VALUES "

puts "Inserting data, this may take a while..."
1000.times do |i|
  # replace ".", "_" character with space and format name
  name = Faker::Internet.unique.user_name(8..15).gsub(/[._]/, " ").titleize
  email = Faker::Internet.email(name)

  rand_time = Time.now - rand(1..100).days
  insert_user << "(\'#{name}\', \'#{email}\', \'#{rand_time}\', \'#{rand_time}\'), "

  50.times do
    post_title = Faker::Lorem.sentence
    post_content = Faker::Lorem.paragraphs(20).join("\n")

    insert_post << "(\'#{post_title}\', \'#{post_content}\', \'#{i + 1}\', \'#{Time.now}\', \'#{Time.now}\'), "
  end
end

insert_user.chop!.chop! << ";" # remove the ", " at the end of query and add ";"
insert_post.chop!.chop! << ";" # remove the ", " at the end of query and add ";"

puts "Creating users..."
ActiveRecord::Base.connection.execute(insert_user)
puts "Done."

puts "Creating posts..."
ActiveRecord::Base.connection.execute(insert_post)
puts "Done."

# Update users password
password = Devise::Encryptor.digest(User, '123456')
User.update_all(encrypted_password: password)
