class DesignsController < ApplicationController
  def index
    @designs = Design.all
  end

  def show
    @design = Design.find(params[:id])
  end
end
