class JobsController < ApplicationController
  # Add skip_before_action to turn off CSRF, should remove this when we introduce the authentication part in the application
  skip_before_action :verify_authenticity_token
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_group, only: [:group]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    @groups = Job.all.group(:name)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  def group
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    if request.headers["X-Password"] == ENV['password']
      respond_to do |format|
        if @job.save
          format.html { redirect_to @job, notice: 'Job was successfully created.' }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if request.headers["X-Password"].nil?
          format.json  { render :json => 'Valid requests must include the X-Password header.' }
        else
          format.json  { render :json => 'Password is wrong. Please provide correct password.' }
        end
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def set_group
      @group_jobs = Job.where("name= ?", params[:name]).paginate(:page => params[:page], :per_page => 10).order(params[:create_at]).reverse_order
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:name, :status, :duration, :message, :frequency)
    end
end
