class Admin::OffersController < Admin::BaseController
  before_action :set_offer, only: %i[edit update destroy]
  before_action :set_products, only: %i[new create edit update]

  def index
    @offers = Offer.includes(:products).all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to admin_offers_url, notice: 'Offer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @offer.update(offer_params)
      redirect_to admin_offers_url, notice: 'Offer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy

    redirect_to admin_offers_url, notice: 'Offer was successfully destroyed.'
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def set_products
    @products = Product.all
  end

  def offer_params
    params.require(:offer).permit(:name, :description, :rules, { product_ids: [] })
  end
end
