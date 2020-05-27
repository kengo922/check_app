class SoftwaresController < ApplicationController
  
  def index
    @software = Software.all
  end

  def new
    @software = Software.new
    @platforms = Platform.all
  end

  def create
    @software = Software.new
    @software.assign_attributes(software_params)
    #convert the array of platform ids into a string
    @software.platform_ids = params[:software][:platform_ids].join(",")
    if @software.save
      flash[:notice] = "Software was saved."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error saving the software. Please try again."
      render :new
    end
  end

  def edit
    @software = Software.find(params[:id])
    #convert the string of platform ids into an array
    @platform_ids_array = @software.platform_ids.split(",")
    @platforms = Platform.all
  end

  def update
    @software = Software.find(params[:id])
    @software.assign_attributes(software_params)
    #convert the array of platform ids into a string
    @software.platform_ids = params[:software][:platform_ids].join(",")

    if @software.save
      flash[:notice] = "software was updated."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error saving the software. Please try again."
      render :edit
    end
  end

  private
  def software_params
      #don't include :platform_ids here because we need to convert it into a string
    params.require(:software).permit(:name, :versions, :url)
  end

end
