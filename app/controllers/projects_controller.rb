class ProjectsController < ApplicationController
  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(:distinct => true).includes(:staffings, :users, :roles).page(params[:page]).per(10)

    render("projects/index.html.erb")
  end

  def show
    @staffing = Staffing.new
    @project = Project.find(params[:id])

    render("projects/show.html.erb")
  end

  def new
    @project = Project.new

    render("projects/new.html.erb")
  end

  def create
    @project = Project.new

    @project.name = params[:name]
    @project.code = params[:code]
    @project.start_date = params[:start_date]
    @project.end_date = params[:end_date]
    @project.active = params[:active]

    save_status = @project.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projects/new", "/create_project"
        redirect_to("/projects")
      else
        redirect_back(:fallback_location => "/", :notice => "Project created successfully.")
      end
    else
      render("projects/new.html.erb")
    end
  end

  def edit
    @project = Project.find(params[:id])

    render("projects/edit.html.erb")
  end

  def update
    @project = Project.find(params[:id])

    @project.name = params[:name]
    @project.code = params[:code]
    @project.start_date = params[:start_date]
    @project.end_date = params[:end_date]
    @project.active = params[:active]

    save_status = @project.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/projects/#{@project.id}/edit", "/update_project"
        redirect_to("/projects/#{@project.id}", :notice => "Project updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Project updated successfully.")
      end
    else
      render("projects/edit.html.erb")
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    if URI(request.referer).path == "/projects/#{@project.id}"
      redirect_to("/", :notice => "Project deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Project deleted.")
    end
  end
end
