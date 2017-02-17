class Api::V1::SearchController < Api::V1::ApplicationController

  def trails
    @query = params[:query].downcase
    @results = Trail.where('lower(title) like ?', "%#{@query}%")
    render json: @results
  end

end
