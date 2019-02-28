class DosesController < ApplicationController

  def show
    @dose = Dose.find(param[:id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save!

      redirect_to @dose.cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail);
  end

  private

   def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
