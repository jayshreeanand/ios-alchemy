class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @designs = current_user.designs.completed
    @designs = Design.all.completed
  end

  def show
    design  = Design.find(params[:design_id])
    @images = design.images
  end
end
