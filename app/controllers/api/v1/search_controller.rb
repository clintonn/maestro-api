class Api::V1::SearchController < Api::V1::ApplicationController

  def trails
    @query = params[:query].downcase
    @results = Trail.where('lower(title) like ?', "%#{@query}%")
    render json: @results
  end

  def featured_trails
     @results = Trail.order(votes_count: :desc).limit(9)
     render json: @results
  end

end
