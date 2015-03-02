class Competition < ActiveRecord::Base

	searchkick text_start: [:name,:collegename],autocomplete: ['name','collegename']
=begin
	def self.facets_search(params)
	  query = params[:query].presence || "*"
	  conditions = {}
	  conditions[:year] = params[:year] if params[:year].present?

	  movies = Movie.search query, where: conditions, 
	    facets: [:year], 
	    smart_facets: true, page: params[:page], suggest: true, highlight: true,
	    per_page: 10
	  movies
	end
=end
	geocoded_by :location
	after_validation :geocode, :if => :location_changed?

	def self.facets_search(params)
		query = params[:query].presence || "*"
		conditions = {}
		conditions[:category] = params[:category] if params[:category].present?

		competitions = Competition.search(query, order: {name: :asc},where: conditions, facets: [:category],smart_facets: true, page: params[:page], per_page: 40)
		competitions
	end


	validates :name,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true, length: { maximum: 50 }
	validates :startDateText,  presence: true
	validates :category,  presence: true

	belongs_to :user 
	has_many :meetings, class_name:  "Meeting", foreign_key: "attending_competition_id"
	has_many :participants, through: :meetings,:source => :participant


end
