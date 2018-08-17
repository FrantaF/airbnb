class BraintreeController < ApplicationController
  before_action :require_login 

  def new

    if params[:id].to_i != current_user.id      
      redirect_to listings_search_box_path
    else
      @client_token = Braintree::ClientToken.generate
      render "payment"
    end
  end

  def checkout
    #retrieve booking id from session 
    payable_amount = Booking.find(session["booking_id"]).total_price.to_i
    session["booking_id"] = nil
    
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
   :amount => payable_amount, #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
    :submit_for_settlement => true
  }
  )

    if result.success?    
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
     redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
   end

 end
end
