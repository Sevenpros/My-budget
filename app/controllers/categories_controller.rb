# controllers for categories
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[home]
  # GET /categories or /categories.json
  def index
    @categories = Category.all
    # @total_amount = 0
    # @categories.each do |c|
    #   @total_amount += Transaction.find(:total).where(category_id: c.id)
    # end
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end
  def home; end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_url
      # format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
      # format.json { render :show, status: :created, location: @category }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @category.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
