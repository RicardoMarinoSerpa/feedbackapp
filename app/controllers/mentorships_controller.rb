class MentorshipsController < ApplicationController
  def index
    @q = Mentorship.ransack(params[:q])
    @mentorships = @q.result(:distinct => true).includes(:mentor, :mentee).page(params[:page]).per(10)

    render("mentorships/index.html.erb")
  end

  def show
    @mentorship = Mentorship.find(params[:id])

    render("mentorships/show.html.erb")
  end

  def new
    @mentorship = Mentorship.new

    render("mentorships/new.html.erb")
  end

  def create
    @mentorship = Mentorship.new

    @mentorship.mentee_id = params[:mentee_id]
    @mentorship.mentor_id = params[:mentor_id]

    save_status = @mentorship.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mentorships/new", "/create_mentorship"
        redirect_to("/mentorships")
      else
        redirect_back(:fallback_location => "/", :notice => "Mentorship created successfully.")
      end
    else
      render("mentorships/new.html.erb")
    end
  end

  def edit
    @mentorship = Mentorship.find(params[:id])

    render("mentorships/edit.html.erb")
  end

  def update
    @mentorship = Mentorship.find(params[:id])

    @mentorship.mentee_id = params[:mentee_id]
    @mentorship.mentor_id = params[:mentor_id]

    save_status = @mentorship.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mentorships/#{@mentorship.id}/edit", "/update_mentorship"
        redirect_to("/mentorships/#{@mentorship.id}", :notice => "Mentorship updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mentorship updated successfully.")
      end
    else
      render("mentorships/edit.html.erb")
    end
  end

  def destroy
    @mentorship = Mentorship.find(params[:id])

    @mentorship.destroy

    if URI(request.referer).path == "/mentorships/#{@mentorship.id}"
      redirect_to("/", :notice => "Mentorship deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mentorship deleted.")
    end
  end
end
