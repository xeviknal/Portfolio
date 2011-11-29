class DesignsController < FrontController
  def index
  #  @designs = Design.all
    @designs = Design.paginate(:page => params[:page])
  end

  def show
    @design = Design.find(params[:id])
  end
end
