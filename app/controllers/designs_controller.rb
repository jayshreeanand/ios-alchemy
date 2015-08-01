class DesignsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end
  
  def index
    design = Design.first
    @design_data = [{label: "File Name", id: design.id}]
    children_data = []
    design.meta_data[:children].each_with_index do |child, i|
      data = {}
      data[:label] = "#{child[:type]} #{child[:name]}"
      data[:id]= i
      children_data << data
    end
    @design_data[0][:children] = children_data
    # @test = @design_data.to_json

   
  end

  def show
  end
end
