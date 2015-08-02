class PagesController < ApplicationController
  def landing
     render(:layout => "layouts/landing")
  end
end