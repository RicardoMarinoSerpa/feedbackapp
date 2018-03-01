class DimensionsController < ApplicationController
  def index
    @q = Dimension.ransack(params[:q])
    @dimensions = @q.result(:distinct => true).includes(:subdimensions).page(params[:page]).per(10)

    render("dimensions/index.html.erb")
  end

  def show
    @subdimension = Subdimension.new
    @dimension = Dimension.find(params[:id])

    render("dimensions/show.html.erb")
  end

  def new
    @dimension = Dimension.new

    render("dimensions/new.html.erb")
  end

  def create
    @dimension = Dimension.new

    @dimension.name = params[:name]

    save_status = @dimension.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dimensions/new", "/create_dimension"
        redirect_to("/dimensions")
      else
        redirect_back(:fallback_location => "/", :notice => "Dimension created successfully.")
      end
    else
      render("dimensions/new.html.erb")
    end
  end

  def edit
    @dimension = Dimension.find(params[:id])

    render("dimensions/edit.html.erb")
  end

  def update
    @dimension = Dimension.find(params[:id])

    @dimension.name = params[:name]

    save_status = @dimension.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dimensions/#{@dimension.id}/edit", "/update_dimension"
        redirect_to("/dimensions/#{@dimension.id}", :notice => "Dimension updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dimension updated successfully.")
      end
    else
      render("dimensions/edit.html.erb")
    end
  end

  def destroy
    @dimension = Dimension.find(params[:id])

    @dimension.destroy

    if URI(request.referer).path == "/dimensions/#{@dimension.id}"
      redirect_to("/", :notice => "Dimension deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dimension deleted.")
    end
  end
end
