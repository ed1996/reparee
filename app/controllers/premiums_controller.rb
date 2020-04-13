class PremiumsController < ApplicationController

  before_action :authenticate_user!

  def new

  end

  def update

    token = params[:stripeToken]

    customer = Stripe::Customer.create(
        card: token,
        plan: 2202,
        email: current_user.email
    )

    current_user.subscribed = true
    current_user.premium = true
    current_user.stripeid = customer.id

    if current_user.save
      redirect_to root_path
    end

  end

end
