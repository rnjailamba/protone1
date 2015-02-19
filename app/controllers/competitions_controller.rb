class CompetitionsController < ApplicationController
  after_filter :store_location
  before_action :set_competition, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :correct_user, only: [:edit, :update, :destroy]
  respond_to :html, :json 

  def autocomplete
    render json: Competition.search(params[:query],autocomplete: true, limit: 10).map(&:name)
  end

  def index
    @compFacet = Competition.facets_search(params)
    #@block_facets = Block.facets_default(params)

    if params[:query].present?
      @competitions = Competition.search(params[:query],fields: [:name, :collegename,:location], facets: [:category] ,page: params[:page])
         
    else
      @competitions = Competition.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
      #Nothing there @users = User.search "*",limit: 200
      
    end
    respond_with(@competitions)
  end

  def show
    respond_with(@competition)
  end

  def new

      @competition = current_user.competitions.build
      respond_with(@competition)
    
  end

  def edit
    @competition = Competition.find(params[:id])

  end

  def create
    @competition = current_user.competitions.new(competition_params)
    @competition.save
    respond_with(@competition)
  end

  def update
    @competition.update(competition_params)
    respond_with(@competition)
  end

  def destroy
    @competition.destroy
    respond_with(@competition)
  end

  def participants
    @title = "Following"
    @comp  = Competition.find(params[:id])
  end

  def follow(other_comp)
    meetings.create(attending_competition: other_comp.id)
  end

  private

    def set_competition
      @competition = Competition.find(params[:id])
    end

    

    def correct_user
        @competition = current_user.competitions.find_by(id: params[:id])
        redirect_to competitions_path, notice: "Not authorized to edit this pin" if @competition.nil?

    end

    def competition_params
      params.require(:competition).permit(:name,:category, :description, :collegename, 
        :money, :onOff,:location,:startDate,:endDate,:organizedBy,:linkWebsite,:linkWebsite,:linkFb,:startDateText,:endDateText)
    end
end
