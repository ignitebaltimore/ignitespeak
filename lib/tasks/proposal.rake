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

  desc "Process scraped voting results"
  task :process_votes do
    html = IO.read("/Users/subelsky/Desktop/Inbox/survey.html")
    rows = Nokogiri::HTML(html).css("tr.notranslate").collect { |r| r.children.to_a.values_at(0,3).collect(&:content) }.sort_by(&:last).reverse.collect { |r| "#{r.first} - #{r.last}" }
    rows.each { |r| puts r }
  end

  desc "Get email addresses of active proposals"
  task :emails => :environment do
    puts Proposal.all.map(&:email)
  end
end
