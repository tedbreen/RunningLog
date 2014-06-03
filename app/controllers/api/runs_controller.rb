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
    @runs = Run.order(:start_date => :desc, :start_time => :desc).page(params[:page])
    # @runs = Run.page(params[:page])
    # render :json => @runs
    # render :index => @runs
    render :json => {
      :models => @runs,
      :page => params[:page],
      :total_pages => @runs.total_pages
    }
  end

  def user
  end

  def show
    @run = Run.find(params[:id])
    render :json => @run
  end

  private

  def set_date(yr,mo,da)
    DateTime.new(yr,mo,da,12,0,0)
  end

  def set_duration(hr, min, sec)
    hr * 3600 + min * 60 + sec
  end
end