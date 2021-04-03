class PremiumsController < ApplicationController

  before_action :authenticate_user!

  def new

  end

  def update

    token = params[:stripeToken]

    customer = Stripe::Customer.create(
        card: token,
        plan: 'price_1Ic7GfCMsWiGyDH3RzZ2UiXz',
        email: current_user.email
    )

    current_user.subscribed = true
    current_user.premium = true
    current_user.stripeid = customer.id
    current_user.save

    redirect_to root_path


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_premium_path

  end

end
