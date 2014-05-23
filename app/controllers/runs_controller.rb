class RunsController < ApplicationController
  def new
    @run = Run.new
    render :new
  end

  def create
    @p = params[:run]
    @run = Run.new
    @run.user_id = current_user.id
    @run.city = @p[:city]
    @run.state = @p[:state]
    @run.distance = @p[:distance]
    @run.run_type = @p[:run_type]
    @run.start_time = DateTime.new( @p[:year].to_i,
                                    @p[:mon].to_i,
                                    @p[:day].to_i,
                                    @p[:hour].to_i,
                                    @p[:min].to_i
    )

    if (@p[:d_hr].to_i * 3600
        + @p[:d_min].to_i * 60
        + @p[:d_sec].to_i).is_a?(Numeric)
      @run.duration = @p[:d_hr].to_i * 3600
      @run.duration += @p[:d_min].to_i * 60
      @run.duration += @p[:d_sec].to_i
    end

    @run.sneaker_id = @p[:sneaker_id] unless @p[:sneaker_id].empty?
    if @run.save
      render :json => @run
    else
      render :json => @run.errors.full_messages
    end
  end

  private

  def run_params
    params.require(:run).permit(:d_hr, :d_min, :d_sec, :sneaker_id,
                                :run_type, :distance, :city, :state,
                                :year, :mon, :day, :hr, :min
    )
  end

end