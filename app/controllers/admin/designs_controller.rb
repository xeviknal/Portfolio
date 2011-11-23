class Admin::DesignsController < Admin::AdminController

  def index
    @designs = Design.all
  end

  def show
    @design = Design.find(params[:id])
  end

  def new
    @design = Design.new
  end

  def edit
    @design = Design.find(params[:id])
  end

  def create
    @design = Design.new(params[:design])
    if @design.save
      redirect_to( admin_design_path(@design), :notice => 'Design was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @design = Design.find(params[:id])
    
    if @design.update_attributes(params[:design])
      redirect_to admin_design_path(@design), notice: 'Design was successfully updated'
    else
      render action: "edit"
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy

    redirect_to admin_designs_url
  end
end
