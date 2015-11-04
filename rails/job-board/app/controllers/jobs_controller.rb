class JobsController < ApplicationController
  before_filter :authorize_company, only: [:new, :create, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @id_minimo = params[:id_minimo]
    if @id_minimo
      list_partial = Job.where("id >= ?", @id_minimo)
    else
      list_partial = Job
    end
    
    @jobs = list_partial.most_recent.includes(:company).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
      format.atom { 
        if @jobs.first
          @last_updated = @jobs.first.updated_at
        else
          @last_updated = Time.now
        end
      }
    end
  end

  def premium
    @jobs = Job.where(premium: true).most_recent.includes(:company).
      paginate(page: params[:page], per_page: 10)
  end

  rescue_from SlugError, :with => :rescue_from_slug_error
  def rescue_from_slug_error exception
    redirect_to exception.objeto
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find_by_slug(params[:id])
    @comments = @job.comments.order('id desc')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = current_company.jobs.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = current_company.jobs.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = current_company.jobs.build(params[:job])

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = current_company.jobs.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = current_company.jobs.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  private
  def authorize_company
    unless current_company
      redirect_to root_path, alert: "You need to login to continue."
    end
  end
end
