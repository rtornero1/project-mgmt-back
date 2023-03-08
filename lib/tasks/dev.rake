task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    Comment.destroy_all #destroy children objects first
    Task.destroy_all #destroy children objects first
    User.destroy_all
  end

  usernames = Array.new
  
  usernames << Faker::Name.first_name
  usernames << Faker::Name.first_name

  usernames << "alice"
  usernames << "bob"

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
    )
  end
  p "#{User.count} users have been created."
  
  users = User.all
  
  users.each do |user|
    p "#{user.username} was created."
    rand(5).times do

      task = user.own_tasks.create(
        caption: Faker::Quote.jack_handey,
        status: Task.statuses.keys.sample
      )
      
      tasks = Task.all

      tasks.each do |task|
        if rand < 0.2
          task.comments.create(
            body: Faker::Quote.jack_handey,
            author: user
          )
        end
      end

    end
  end

  ending = Time.now

  p "#{Task.count} tasks have been created."
  p "#{Comment.count} comments have been created."
end
