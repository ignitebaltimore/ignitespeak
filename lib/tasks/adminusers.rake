include Rails.application.routes.url_helpers

namespace :admin do
  task :adduser => :environment do
    puts "Please choose one of the option below (1 or 2) to allow the authenticated app user to be an admin:"
    puts " 1 Twitter"
    puts " 2 Google"
    option = STDIN.gets
  
    if option.strip == "1"
      puts "================================================================================================="      

      puts "Twitter nickname should be exactly as the Twitter app account you want to authorize."
      puts "Enter Twitter nickname:"
      nickname = STDIN.gets
      nickname = nickname.strip
      provider = "Twitter"     
      uid = "Manual" 
      email = nickname + "@twitter.com"
    elsif option.strip == "2"
      puts "================================================================================================="      

      puts "Google nickname should be exactly as the Google app account you want to authorize."
      puts "Enter Google email:"

      email = STDIN.gets
      email = email.strip
      nickname = ""
      uid = "Manual"
      provider = "Google"
    else 
      return
    end
   
     
    puts "Enter a secure password:"
    password = STDIN.gets
    password = password.strip
    puts "================================================================================================="      
    puts "........................Creating an admin user for an authenticated user........................."

    if (email.present? or nickname.present?) and password.present?
      if Admin.create!(:uid => uid, :email => email, :nickname => nickname, :password => password, :provider => provider)
        puts "Admin user created!" 
      else
        puts "Failed to create user"
      end
    end
  end
end
