class ProposalMailer < ActionMailer::Base
  default from: "speak@ignitebaltimore.com"

  def confirmed_email(proposal)
    @proposal = proposal
    @url = proposal_url(proposal)
    mail(to: proposal.email, subject: "Thank you for your Ignite Baltimore proposal")
  end
end
