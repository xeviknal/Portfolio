class Admin::DesignsController < Admin::AdminController

  def show
    @design = Design.find(params[:id])
  end
end
