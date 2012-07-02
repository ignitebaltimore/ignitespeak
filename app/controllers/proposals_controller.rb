class ProposalsController < ApplicationController
  before_filter :find_proposal, only: :show

  helper_method :proposal

  def new
    @title = "New Ignite Speaking Proposal"
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.create(params[:proposal])
    if @proposal.valid?
      flash[:success] = "We have received your proposal. Check #{@proposal.email} for further instructions."
      redirect_to proposal_url(id: proposal.hash_code)
    else
      head :ok
      #flash.now[:error] = "We could not save your proposal. Please try again."
      #render :new
    end
  end

  def show
    @title = proposal.title
  end

  private

  attr_reader :proposal

  def find_proposal
    @proposal = Proposal.find_by_hash_code(params[:id])

    if @proposal.nil?
      flash[:error] = "We could not find that proposal"
      redirect_to root_url
    end
  end
end
