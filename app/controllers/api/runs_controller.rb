class Api::RunsController < ApplicationController
  before_action :require_current_user!

  def new
    @run = Run.new
    render :new
  end

  def create
    @p = params[:run]

    @run = Run.new( params[:run].permit(:run_type, :title, :city, :state,
                                        :distance, :description)
    )
    
    @run.user_id = current_user.id
    
    date = @p[:date].split('-')
    time = @p[:time].split(':')
    
    @run.time_date = set_date( date[0].to_i, date[1].to_i, date[2].to_i,
                               time[0].to_i, time[1].to_i
    )

    @run.duration = set_duration( @p[:d_hr].to_i,
                                  @p[:d_min].to_i,
                                  @p[:d_sec].to_i
    )
    if @run.save
      render :json => @run
    else
      render :json => @run.errors.full_messages
    end
  end

  def index
    @runs = Run.order(:time_date => :desc).page(params[:page])
    # @runs = Run.page(params[:page])
    # render :json => @runs
    # render :index => @runs
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

  def set_date(yr,mo,da,hr,mi)
    DateTime.new(yr,mo,da,hr,mi)
  end

  def set_duration(hr, min, sec)
    hr * 3600 + min * 60 + sec
  end
end