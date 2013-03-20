namespace :proposal do
  desc "Archive active proposals"
  task :archive => :environment do
    Proposal.update_all("archived = true")
  end

  desc "Generate voting email for active proposals"
  task :vote_prep => :environment do
    proposals = Proposal.active.order(:title)
    mailer = ProposalMailer.all_proposals(proposals)
    mailer.deliver!

    puts

    proposals.each do |proposal|
      puts "#{proposal.title} - #{proposal.speaker_name}"
    end
  end

  desc "Process scraped voting results"
  task :process_votes do
    html = IO.read("/Users/subelsky/Desktop/Inbox/survey.html")
    rows = Nokogiri::HTML(html).css("tr.notranslate").collect { |r| r.children.to_a.values_at(0,3).collect(&:content) }.sort_by(&:last).reverse.collect { |r| "#{r.first} - #{r.last}" }
    rows.each { |r| puts r }
  end

  desc "Get email addresses of active proposals"
  task :emails => :environment do
    puts Proposal.active.map(&:email)
  end

  desc "Show proposal title with email"
  task :titles_with_email => :environment do
    Proposal.active.order(:title).each {|p| puts "#{p.title} - #{p.email}" }
  end

  desc "Show proposal title with name and bio"
  task :program_info => :environment do
    Proposal.active.selected.each {|p| puts "#{p.title} * #{p.speaker_name} * #{p.bio}"}
  end

  desc "Generate html for website"
  task :website => :environment do
    puts "<ul>"
    Proposal.active.selected.each do |p|
      speaker = if p.website?
                  "<a href='#{p.website}'>#{p.speaker_name}</a>"
                else
                  p.speaker_name
                end
      puts "<li>#{p.title} &bull; #{speaker}</li>"
    end
    puts "</ul>"
  end

  desc "Generate upload URLs"
  task :urls => :environment do
    Proposal.active.selected.each do |p|
      puts "#{p.email}  -  http://speak.ignitebaltimore.com/proposals/#{p.hash_code}"
    end ; nil
  end
end

#lines = <<-LINES
##
#LINES

#lines = lines.split(/\n/)
#names = lines.map { |l| l.split(/ - /)[1] }

#names.each_with_index do |name,index|
## TODO make this only look at new proposals, not archived ones
#p = Proposal.find_by_speaker_name(name)

#raise "could not find speaker name #{name}, quitting" unless p
#p.position = index
#p.selected = true
#p.save!
#end
