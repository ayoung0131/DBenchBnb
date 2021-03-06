class Api::BenchesController < ApplicationController

  def index
    # benches = bounds ? Bench.in_bounds(bounds) : Bench.all
    @benches = Bench.all
    render :index
  end

  def show
    @bench = Bench.find_by(id: params[:id])
    if @bench
      render :show
    else
      render json: ['Bench not found'], status: 404
    end
  end

  def create
    @bench = Bench.new(bench_params)
      if @bench.save
        render :show
      else
        render json: @bench.errors.full_messages, status: 404
      end
  end

  private
  def bench_params
    params.require(:bench).permit(:description, :lat, :lng)
  end
end
