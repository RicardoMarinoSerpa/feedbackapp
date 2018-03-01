class StaffingsController < ApplicationController
  def index
    @q = Staffing.ransack(params[:q])
    @staffings = @q.result(:distinct => true).includes(:user, :project, :role, :feedbacks).page(params[:page]).per(10)

    render("staffings/index.html.erb")
  end

  def show
    @feedback = Feedback.new
    @staffing = Staffing.find(params[:id])

    render("staffings/show.html.erb")
  end

  def new
    @staffing = Staffing.new

    render("staffings/new.html.erb")
  end

  def create
    @staffing = Staffing.new

    @staffing.project_id = params[:project_id]
    @staffing.user_id = params[:user_id]
    @staffing.role_id = params[:role_id]

    save_status = @staffing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/staffings/new", "/create_staffing"
        redirect_to("/staffings")
      else
        redirect_back(:fallback_location => "/", :notice => "Staffing created successfully.")
      end
    else
      render("staffings/new.html.erb")
    end
  end

  def edit
    @staffing = Staffing.find(params[:id])

    render("staffings/edit.html.erb")
  end

  def update
    @staffing = Staffing.find(params[:id])

    @staffing.project_id = params[:project_id]
    @staffing.user_id = params[:user_id]
    @staffing.role_id = params[:role_id]

    save_status = @staffing.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/staffings/#{@staffing.id}/edit", "/update_staffing"
        redirect_to("/staffings/#{@staffing.id}", :notice => "Staffing updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Staffing updated successfully.")
      end
    else
      render("staffings/edit.html.erb")
    end
  end

  def destroy
    @staffing = Staffing.find(params[:id])

    @staffing.destroy

    if URI(request.referer).path == "/staffings/#{@staffing.id}"
      redirect_to("/", :notice => "Staffing deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Staffing deleted.")
    end
  end
end
