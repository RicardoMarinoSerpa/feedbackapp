class FeedbacksController < ApplicationController
  before_action :current_user_must_be_feedback_sender_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_feedback_sender_user
    feedback = Feedback.find(params[:id])

    unless current_user == feedback.sender_user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @feedbacks = Feedback.page(params[:page]).per(10)

    render("feedbacks/index.html.erb")
  end

  def show
    @feedback = Feedback.find(params[:id])

    render("feedbacks/show.html.erb")
  end

  def new
    @feedback = Feedback.new

    render("feedbacks/new.html.erb")
  end

  def create
    @feedback = Feedback.new

    @feedback.staffing_id = params[:staffing_id]
    @feedback.sender_user_id = params[:sender_user_id]
    @feedback.receiver_user_id = params[:receiver_user_id]
    @feedback.subdimension_id = params[:subdimension_id]
    @feedback.grade = params[:grade]
    @feedback.comment = params[:comment]
    @feedback.receiver_visible = params[:receiver_visible]
    @feedback.mentor_visible = params[:mentor_visible]

    save_status = @feedback.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/feedbacks/new", "/create_feedback"
        redirect_to("/feedbacks")
      else
        redirect_back(:fallback_location => "/", :notice => "Feedback created successfully.")
      end
    else
      render("feedbacks/new.html.erb")
    end
  end

  def edit
    @feedback = Feedback.find(params[:id])

    render("feedbacks/edit.html.erb")
  end

  def update
    @feedback = Feedback.find(params[:id])

    @feedback.staffing_id = params[:staffing_id]
    @feedback.sender_user_id = params[:sender_user_id]
    @feedback.receiver_user_id = params[:receiver_user_id]
    @feedback.subdimension_id = params[:subdimension_id]
    @feedback.grade = params[:grade]
    @feedback.comment = params[:comment]
    @feedback.receiver_visible = params[:receiver_visible]
    @feedback.mentor_visible = params[:mentor_visible]

    save_status = @feedback.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/feedbacks/#{@feedback.id}/edit", "/update_feedback"
        redirect_to("/feedbacks/#{@feedback.id}", :notice => "Feedback updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Feedback updated successfully.")
      end
    else
      render("feedbacks/edit.html.erb")
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])

    @feedback.destroy

    if URI(request.referer).path == "/feedbacks/#{@feedback.id}"
      redirect_to("/", :notice => "Feedback deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Feedback deleted.")
    end
  end
end
