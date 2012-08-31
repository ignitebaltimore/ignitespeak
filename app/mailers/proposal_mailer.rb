class ProposalMailer < ActionMailer::Base
  speak_addr = "Ignite Baltimore <speak@ignitebaltimore.com>"
  default from: speak_addr
  default "reply-to" => speak_addr

  def confirmed_email(proposal)
    @proposal = proposal
    @url = proposal_url(proposal)
    mail(to: proposal.email, subject: "Thank you for your Ignite Baltimore proposal")
  end

  def all_proposals(html)
    @html = html
    mail(to: "mike@subelsky.com", subject: "All Ignite Proposals")
  end
end
