class SummariesController < ApplicationController

  before_action :set_summary, only: [:edit, :update, :destroy]
  before_action :authorize_resource
  before_action :prepare_params, only: [:create, :update]

  def index
    @summaries = current_user.summaries
  end

  def new
    @summary = Summary.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @summary = current_user.summaries.new summary_params
    respond_to do |format|
      @summary.save
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      @summary.update summary_params
      format.js
    end
  end

  def destroy
    respond_to do |format|
      @summary.destroy
      format.js
    end
  end


  private

  def authorize_resource
    authorize!(params[:action].to_sym, @summary || Summary)
  end

  def prepare_params
    start_date = params[:summary][:start_date]
    end_date = params[:summary][:end_date]
    params[:summary][:start_date] = start_date.to_date || Date.today
    params[:summary][:end_date] = end_date.to_date || Date.today + 1.month
  end

  def summary_params
    params.require(:summary).permit(:name, :trackable, :start_date, :end_date,
                                    :share)
  end

  def set_summary
    @summary = Summary.find(params[:id])
  end

end
