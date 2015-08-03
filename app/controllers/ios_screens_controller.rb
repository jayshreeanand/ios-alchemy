require 'rubygems'
require 'zip'
require "open-uri"

class IosScreensController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def export
    design = Design.find(params[:design_id])
    if Resque.enque IosConversionJob, design.id
      redirect_to uploads_path, notice: 'Design is queued for ios conversion. You can view the converted files in the ios section'

  end

  def download

  end
end


