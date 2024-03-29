class Admin::ImagesController < Admin::AdminController

  def update
    @image = Image.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.json { render json: {:thumb => @image.image_url(:thumb), :original => @image.image_url } }
      else
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @image = Image.new(params[:image])
    @image.save
    @design = Design.find(@image.design_id)
    respond_to do |format|
      format.html { render :partial => "image", :locals => { :design => @design, :img => @image }, :layout => false }
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.js { }
    end
  end
end
