require 'rubygems'
require 'zip'
require "open-uri"


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

  def download
    design  = Design.find(params[:design_id])
    @images = design.images
    zip_file_name = "tmp/image-export#{Time.now}.zip"
    Zip::File.open(zip_file_name, Zip::File::CREATE) do |zipfile|
      @images.each do |image|
        image.onex.copy_to_local_file(:original, "tmp/#{image.onex_file_name}")
        image.twox.copy_to_local_file(:original, "tmp/#{image.twox_file_name}")
        image.threex.copy_to_local_file(:original, "tmp/#{image.threex_file_name}")
        zipfile.add(image.onex_file_name, "tmp/#{image.onex_file_name}")
        zipfile.add(image.twox_file_name, "tmp/#{image.twox_file_name}")
        zipfile.add(image.threex_file_name, "tmp/#{image.threex_file_name}")
      end
    end

    send_file zip_file_name, :type => 'application/zip',
                                 :disposition => 'attachment',
                                 :filename => "Image_exports.zip"
                                 

  end
end
 
  