class Api::RunsController < ApplicationController
  before_action :require_current_user!

  def new
    @run = Run.new
    render :new
  end

  def create
    @p = params[:run]

    @run = Run.new(run_params)

    if @run.save
      render :json => @run
    else
      render :json => @run.errors.full_messages
    end
  end

  def index
    @runs = Run.order(:time_date => :desc).page(params[:page])
    render :json => {
      :models => @runs,
      :page => params[:page],
      :total_pages => @runs.total_pages
    }
  end

  def show
    @run = Run.find(params[:id])
    render :json => @run
  end
  
  def destroy
    @run = Run.find(params[:id])
    render :json => @run.destroy
  end
  
  def update
    @run = Run.find(params[:id])
    if @run.update_attributes(run_params)
      render :json => @run
    else
      render :json => @run.errors.full_messages
    end
  end
  
  #custom route
  def date_range
    @runs = Run.where(:time_date => DateTime.parse(params[:start_date])..DateTime.parse(params[:end_date])).
                      order(:time_date => :desc).page(params[:page]
    )

    render :json => {
      :models => @runs,
      :page => params[:page],
      :total_pages => @runs.total_pages
    }
  end

  private
  
  def run_params
    params.require(:run).permit(:run_type, :title, :city, :state,
                                        :distance, :description, :user_id,
                                        :time_date)
  end

  def set_duration(hr, min, sec)
    hr * 3600 + min * 60 + sec
  end
end