class AttachementsController < ApplicationController
  def create

  end

  def show
#    @attachement = Attachement.find(params[:id])
  end

  def destroy
   # @attachement = Attachement.find(params[:id]
   # @attachement.destroy

  end

  def update
  #  @attachement = Attachement.find(params[:id])
  #  if @attachement.update_attributes(attachement_params)
  #    flash[:notice] = "Image updated."
  #  end

  end

  def edit
     @attachement = Attachement.find(params[:id])
     @attachments.update!(attachement_params)
  end

    private
      def attachement_params
        params.require(:attachement).permit(:image)
      end

end