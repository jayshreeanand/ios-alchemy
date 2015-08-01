class UploadsController < ApplicationController

  def new
    @upload = Upload.new
  end

  def create
    @upload = current_user.uploads.new psd: URI.parse(URI.unescape(params['url']))
    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'PSD was successfully uploaded.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def upload_params
    params.require(:upload).permit(:psd)
  end

end
