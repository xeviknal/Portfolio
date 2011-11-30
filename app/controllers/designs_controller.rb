class DesignsController < FrontController
  def index
    @designs = Design.paginate(:page => params[:page])
  end

  def show
    @design = Design.find(params[:id])
  end
end
