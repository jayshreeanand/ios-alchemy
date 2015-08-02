class DesignsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def show
    @design = Design.find(params[:id])
  end

  def index
  end

  def export_images
    design = Design.find(params[:id])
    if Resque.enqueue ExtractJob, design.id
         redirect_to uploads_path , notice: 'Design is queued for extraction. You can view all extracted images in the images section in a short while'
    end
  end
end
