include Rails.application.routes.url_helpers

namespace :admin do
  task :adduser => :environment do
    puts "Email address should be as your google app or twitter app account. If you would login using Twitter, you would need to provide your twitter nickname"
    puts "============================"
    puts "Enter Google email address:"
    email = STDIN.gets
    puts "============================"
    puts "Enter Twitter nickname:"
    nickname = STDIN.gets
    puts "============================"
    puts "Enter a secure password:"
    password = STDIN.gets

    # remove white spaces
    password = password.strip!
    email = email.strip!
    nickname = nickname.strip!
    if (email.present? or nickname.present?) and password.present?
      if Admin.create!(:email => email, :nickname => nickname, :password => password)
        puts "Admin user created!" 
      else
        puts "Failed to create user"
      end
    end
    puts "=============END============="
  end
end
