namespace :proposal do
  desc "Generate voting email"
  task :vote_prep => :environment do
    proposals = Proposal.order(:title)
    mailer = ProposalMailer.all_proposals(proposals)
    mailer.deliver!

    puts

    proposals.each do |proposal|
      puts "#{proposal.title} - #{proposal.speaker_name}"
    end
  end
end
#5 New Philosophers You Would Love to Know About! - Ron Spencer
#How I won $2.4 million from the Pepsi Refresh Everything contest - Brandon Silverman
#How to travel the world for free (and use tech to your advantage)   - Nathaniel Weiner
#The Case Against Happily Ever After Dependency - Porscha Lyrik Coleman
#Money for good - Jim Kucher
#Influencing the World from Your Basement - Eli the Computer Guy
#Making a left turn - Bryan Liles
#Why we're ready for the four day work week - J.R. Maroney
#local material challenge - Inna Alesina
#Bridging the Digital Divide in Baltimore - Jess Gartner
#The Vision: What will Baltimore BE in 2020? - Mel Brennan
#Open is the End of Cool - Neal McDonald
#Highway to Hell: How highway subsidies destroy America's Cities - Wally Pinkard
#Cuckoo clocks to Conflict;why humanitarian work needs to be redefined! - Killian
#Seize the Days: How Cancer Patients Add Life to Their Days - Evan J. Lipson, MD
#kids support - streams of life
#Community & Coworking Changed My Life - Andy Stratton
#Draw Your Thoughts - Brandon Schmittling
#"Public Property" exhibition at the Walters Museum - Dylan Kinnett
#Fashion Kills/Saves the World - Neal McDonald
#Collaborative Consumption: The Rise of the Sharing Economy - Nick Miller
#Final Cut Schmo: 21st Century Challenges in Media Education - Christopher Llewellyn Reed
#Get Known! - Laura Meck
#Engineering Your Metabolism - Melanie Blatt
#Art Can Create Change - Kalima Young
#Cutting Through the Bullshit - Justin Kownacki
#STEMizens Need Art Too (& Vice Versa) - Ron McCandless
#Vernacular Principles and their application today - Kristian Bjornard
#The Wal-mart Effect Writ Large - How unintended consequences can destroy (or save) the world as we know it - Jason Hardebeck
#Hamburgers, "off the grill" - anisha jagtap
#3D Imaging Our Cultural Artifacts:  We should because we can. - Michael Raphael
#Over 50 Million Children Need A Family - Stacey A. Rebbert
#Elev8me: Transcending Problems, and Transforming Lives. What Lessons learned from 2 years of NO Television.  - Dominic Sessa
#Your Passion is in Your Purse!  - Quinn Conyerd
#I talk to dead people - Umar Hameed
#Calorie Counting is So Last Season - Lyndsay Braswell
#Finding Organization in Your Life - Mary Cate Claudias, Owner of Charm City Organizers, LLC
#OnWord and UpWord. - Katie Palencsar
#Where the embryos come in: stem cells in medicine - Rebecca L. Frederick, Ph.D.
#Why it's so hard to change the world, and what we can do to make it easier - John Cutonilli
#Honey, I shrunk the lab! - Saurabh Paliwal
#Hunter/Getherers and Digital Natives - Elin Whitney-Smith
#Building Humanist Communities in Baltimore - Emil Volcheck
#Objects Without Commodity and Valued Experiences - Tommy P. Doyle and Will Pierce
#11 Inches -- A Love Story - Joshua Hershkovitz
