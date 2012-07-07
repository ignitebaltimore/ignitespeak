atom_feed do |feed|
  feed.title("Ignite Proposals")
  feed.updated(proposals[-1].created_at) if proposals.length > 0

  proposals.each do |proposal|
    feed.entry(proposal) do |entry|
      entry.title("#{proposal.title} - #{proposal.speaker_name}")
      entry.content(proposal.description, type: 'html')

      entry.author do |author|
        author.name(proposal.speaker_name)
      end
    end
  end
end
