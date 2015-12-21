class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :request_to_owner, :ask_to_join]
  before_action :authenticate_user!
 
  autocomplete :skill, :name, :full => true

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params, :owner_id => current_user.id)

    respond_to do |format|
      if @project.save
        format.html { redirect_to edit_project_path(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new}
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if params[:project][:skills]
        skill_names = params[:project][:skills][0].split(",")
        skills = Skill.where(:name => skill_names).except(@project.skills)
        @project.skills << skills
      end
      
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def request_to_owner
    notification = Notification.create(:message => "#{current_user.name} #{current_user.last_name} would like to join #{@project.name}.")
    @project.owner.notifications << notification
    respond_to do |format|
      format.js {}
      format.html {redirect_to projects_path, notice: "Request sent"}
    end
  end
  
  def ask_to_join
    notification = Notification.create(:message => "#{current_user.name} #{current_user.last_name} would like you to join #{@project.name}.")
    User.find(params[:user_id]).notifications << notification
    respond_to do |format|
      format.js {}
      format.html {redirect_to projects_path, notice: "Request sent"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :repo, :skill_ids => [])#, :skills_attributes => [:name, :id])
    end
end
