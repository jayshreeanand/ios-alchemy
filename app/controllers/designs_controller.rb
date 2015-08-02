class DesignsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def show
    design = Design.find(params[:id])
    @design_data = [{label: "File Name", id: design.id}]
    @design_data[0][:children] = design.meta_data
    # children_data = []
    # design.meta_data[:children].each_with_index do |child, i|
    #   data = {}
    #   data[:label] = "#{child[:type]} #{child[:name]}"
    #   data[:id]= i
    #   children_data << data
    # end
    # @design_data[0][:children] = children_data
  end

  def index
  end
end
