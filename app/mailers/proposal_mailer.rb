class ProposalMailer < ActionMailer::Base
  speak_addr = "Ignite Baltimore <speak@ignitebaltimore.com>"
  default from: speak_addr
  default "reply-to" => speak_addr

  def confirmed_email(proposal)
    @proposal = proposal
    @url = proposal_url(proposal)
    mail(to: proposal.email, subject: "Thank you for your Ignite Baltimore proposal")
  end
end
