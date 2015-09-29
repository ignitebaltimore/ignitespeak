namespace :view do
  PROPOSAL_ATTRIBUTES = %w(speaker_name title).freeze
  INTERMISSION_AFTER_TALK_NUM = 8 # default

  desc "Download show running list as JSON for use with igniteview"
  task :download, [:save_dir] => :environment do |t,args|
    save_dir = args[:save_dir] || abort("Must specify save_dir")

    proposals = Proposal.selected.active.order(:position)

    puts "Saving JSON talk data for #{proposals.size} talks"

    talk_data = []
    save_commands = []

    save_path = Pathname(save_dir).tap(&:mkpath)

    proposals.each do |proposal|
      talk = proposal.attributes.slice(*PROPOSAL_ATTRIBUTES)
      talk["animate"] = true

      if proposal.filepicker_url.blank?
        warn "#{proposal.nice_title} is missing a file"
      else
        num = format "%02d", proposal.position
        file_name = num + "_" + proposal.speaker_name.underscore.gsub(/\s+/,"_") + ".pdf"

        file_path = save_path.join(file_name)
        talk["file_path"] = file_path
        command = "curl -k -o #{file_path} #{proposal.filepicker_url}"

        save_commands << command
      end

      talk_data << talk
    end

    talk_data.insert(INTERMISSION_AFTER_TALK_NUM,{
      title: "IGNITION GRANT UPDATE",
      animate: false
    })

    talk_data.insert(INTERMISSION_AFTER_TALK_NUM + 1,{
      title: "Gather Baltimore",
      speaker_name: "gatherbaltimore.org",
      animate: false
    })

    talk_data.insert(INTERMISSION_AFTER_TALK_NUM + 2,{
      title: "INTERMISSION",
      animate: false
    })

    talk_data.push({
      title: "THANK YOU!",
      speaker_name: "ignitebaltimore.com",
      animate: false
    })

    show_data = {
      title: "Ignite Baltimore ###",
      talks: talk_data
    }

    data_path = save_path.join("talks.json")

    data_path.open("w") do |io|
      io.puts(JSON.pretty_generate(show_data))
    end

    puts "Saved data to '#{data_path}'"

    puts save_commands.join(" && ")
  end

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
      puts "#{p.speaker_name} -  http://speak.ignitebaltimore.com/proposals/#{p.hash_code}"
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
