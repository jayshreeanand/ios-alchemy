class UploadsController < ApplicationController

    def create
    byebug
    current_user.uploads.create psd: URI.parse(URI.unescape(params['psd']))
  end
end
