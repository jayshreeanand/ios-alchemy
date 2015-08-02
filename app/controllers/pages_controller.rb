class PagesController < ApplicationController
   before_action :authenticate_user!, :except => [:landing]

  def landing
     render(:layout => "layouts/landing")
  end
end