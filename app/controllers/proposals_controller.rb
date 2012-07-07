class ProposalsController < ApplicationController
  before_filter :find_proposal, only: [:show,:destroy,:edit,:update]

  helper_method :proposal, :proposals

  def index
    redirect_to new_proposal_url unless params[:auth] == AppContainer.auth_code
    @proposals = Proposal.all
  end

  def new
    @title = "New Ignite Speaking Proposal"
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.create(params[:proposal])
    if @proposal.valid?
      flash[:success] = "We have received your proposal. Check #{@proposal.email} for further instructions."
      ProposalMailer.confirmed_email(@proposal).deliver
      redirect_to proposal
    else
      flash.now[:error] = "We could not save your proposal. Please try again."
      render :new
    end
  end

  def show
    @title = proposal.title
  end

  def edit
    @title = "Edit #{proposal.title}"
  end

  def update
    proposal.update_attributes(params[:proposal])
    if proposal.valid?
      flash[:success] = "Your proposal was updated."
      redirect_to proposal
    else
      flash[:error] = "We could not save your changes."
      render :edit
    end
  end

  def destroy
    proposal.destroy
    flash[:success] = "Your proposal has been deleted."
    redirect_to root_url
  end

  private

  attr_reader :proposal, :proposals

  def find_proposal
    @proposal = Proposal.find_by_hash_code(params[:id])

    if @proposal.nil?
      flash[:error] = "We could not find that proposal"
      redirect_to root_url
    end
  end
end
