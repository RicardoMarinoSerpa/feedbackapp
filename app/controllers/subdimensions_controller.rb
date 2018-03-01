class SubdimensionsController < ApplicationController
  def index
    @subdimensions = Subdimension.page(params[:page]).per(10)

    render("subdimensions/index.html.erb")
  end

  def show
    @feedback = Feedback.new
    @subdimension = Subdimension.find(params[:id])

    render("subdimensions/show.html.erb")
  end

  def new
    @subdimension = Subdimension.new

    render("subdimensions/new.html.erb")
  end

  def create
    @subdimension = Subdimension.new

    @subdimension.dimension_id = params[:dimension_id]
    @subdimension.role_id = params[:role_id]
    @subdimension.name = params[:name]
    @subdimension.expectation = params[:expectation]

    save_status = @subdimension.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subdimensions/new", "/create_subdimension"
        redirect_to("/subdimensions")
      else
        redirect_back(:fallback_location => "/", :notice => "Subdimension created successfully.")
      end
    else
      render("subdimensions/new.html.erb")
    end
  end

  def edit
    @subdimension = Subdimension.find(params[:id])

    render("subdimensions/edit.html.erb")
  end

  def update
    @subdimension = Subdimension.find(params[:id])

    @subdimension.dimension_id = params[:dimension_id]
    @subdimension.role_id = params[:role_id]
    @subdimension.name = params[:name]
    @subdimension.expectation = params[:expectation]

    save_status = @subdimension.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/subdimensions/#{@subdimension.id}/edit", "/update_subdimension"
        redirect_to("/subdimensions/#{@subdimension.id}", :notice => "Subdimension updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Subdimension updated successfully.")
      end
    else
      render("subdimensions/edit.html.erb")
    end
  end

  def destroy
    @subdimension = Subdimension.find(params[:id])

    @subdimension.destroy

    if URI(request.referer).path == "/subdimensions/#{@subdimension.id}"
      redirect_to("/", :notice => "Subdimension deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Subdimension deleted.")
    end
  end
end
