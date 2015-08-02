class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @designs = current_user.designs.completed
    @designs = []
    uploads = current_user.uploads
    uploads.each do |upload|
      @designs << upload.design if upload.design.completed?
    end
    @designs
  end

  def show
    design  = Design.find(params[:design_id])
    @images = design.images
  end
end
