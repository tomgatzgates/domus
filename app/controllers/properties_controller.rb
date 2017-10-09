class PropertiesController < ApplicationController
  before_action :authorise

  def index
    @properties = current_user.properties
  end

  def show
    @property = properties.find(params[:id])
  end

  def new
    @property = properties.new
  end

  def create
    @property = properties.new(property_params)

    if @property.save
      redirect_to property_path(@property), notice: 'Successfully created a listing.'
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:bedrooms, :bathrooms, :furnished)
  end

  def properties
    current_user.properties
  end
end
