class PropertiesController < ApplicationController
  before_action :authorise

  def index
    @properties = current_user.properties
  end

  def show
    @property = properties.find(params[:id])
    @address = @property.address
  end

  def new
    @property = properties.new(address: Address.new)
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
    params.require(:property).permit(:bedrooms, :bathrooms, :furnished, address_attributes: [:line_1, :line_2, :city, :province, :zip])
  end

  def properties
    current_user.properties.includes(:address)
  end
end
