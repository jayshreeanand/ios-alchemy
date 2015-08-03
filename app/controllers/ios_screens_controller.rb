require 'rubygems'
require 'zip'
require "open-uri"

class IosScreensController < ApplicationController
  before_action :authenticate_user!

  def index
     @designs = []
     uploads = current_user.uploads
    uploads.each do |upload|
      @designs << upload.design if upload.design.ios_screens.count > 0
    end
    @designs
  end

  def export
    design = Design.find(params[:design_id])
    if Resque.enqueue IosConversionJob, design.id
      redirect_to uploads_path, notice: 'Design is queued for ios conversion. You can view the converted files in the ios section'
    end
  end

  def download
    design  = Design.find(params[:design_id])
    data = design.ios_screens.first.formatted_data
    xib_file_name = "screen-#{Time.now}.xib"
    File.write("tmp/#{xib_file_name}",data)

   send_file "tmp/#{xib_file_name}", 
                                 :disposition => 'attachment',
                                 :filename => "ios_screen.xib"


  end
end


