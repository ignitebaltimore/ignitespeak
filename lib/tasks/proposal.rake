namespace :proposal do
  desc "Generate voting email"
  task :report => :environment do
    html = Proposal.order(:title).map do |proposal|
      fragment = <<-HTML
      <h1>#{proposal.title}</h1>
      <h2>Submitted by #{proposal.speaker_name}</h2>
      <h3>Description</h3>
      <p>#{proposal.description}</p>
      <h3>Speaker Bio</h3>
      <p>#{proposal.bio}</p>
      HTML

      if proposal.website?
        fragment << "<p>Speaker website: <a href='#{proposal.website}'>#{proposal.website}</a></p>"
      end

      ERB.new(fragment.strip_heredoc).result
    end

    ProposalMailer.all_proposals(html.join("\n")).deliver!
  end
end
