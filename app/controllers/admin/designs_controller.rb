class Admin::DesignsController < Admin::AdminController

  def index
    @designs = Design.paginate(:page => params[:page], :per_page => 10)
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
    respond_to do |format|
      if @design.update_attributes(params[:design])
        format.html { redirect_to admin_design_path(@design), notice: 'Design was successfully updated' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render :json => @user.errors.full_messages, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy

    redirect_to admin_designs_url
  end
end
