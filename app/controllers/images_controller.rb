class ImagesController < Admin::AdminController

  def update
    @image = Image.find(params[:id])
    p @image
    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render json: {:thumb => @image.image_url(:thumb), :original => @image.image_url } }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end
end
