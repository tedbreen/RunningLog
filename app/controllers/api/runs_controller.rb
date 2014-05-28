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
    @run.start_date = set_date( @p[:year].to_i, @p[:mon].to_i, @p[:day].to_i )
    @run.start_time = set_time( @p[:hr].to_i, @p[:min].to_i, @p[:offset] )
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
    @runs = Run.all
    render :json => @runs
  end

  def show
    @run = Run.find(params[:id])
    render :json => @run
  end

  private

  def run_params
    params.require(:run).permit(:d_hr, :d_min, :d_sec, :sneaker_id,
                                :run_type, :distance, :city, :state,
                                :year, :mon, :day, :hr, :min, :offset,
                                :description
    )
  end

  def set_time(hr, mi, offset)
    Time.new(2000,1,1,hr,mi, 0, offset )
  end

  def set_date(yr,mo,da)
    Date.new(yr,mo,da)
  end

  def set_duration(hr, min, sec)
    hr * 3600 + min * 60 + sec
  end
end