class Api::UserRunsController < ApplicationController
  def index
    @runs = Run.where(:user_id => params[:user_id])
               .order(:time_date => :desc).page(params[:page])
    render :json => {
      :models => @runs,
      :page => params[:page],
      :total_pages => @runs.total_pages
    }
  end
  
  # custom route
  def date_range
    @runs = Run.where(:user_id => params[:user_id], :time_date => DateTime.parse(params[:start_date])..DateTime.parse(params[:end_date])).
                      order(:time_date => :desc).page(params[:page]
    )
  
    render :json => {
      :models => @runs,
      :page => params[:page],
      :total_pages => @runs.total_pages
    }
  end  

end