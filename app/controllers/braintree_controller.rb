require 'date'
class BraintreeController < ApplicationController
  before_action :require_login 

  def new        
    #only make this page accessable to the current user
    if params[:booking][:user_id].to_i != current_user.id      
      redirect_to listings_search_box_path
    else
      @client_token = Braintree::ClientToken.generate
      num_of_nights =  Date.parse(params[:booking][:end_date]) - Date.parse(params[:booking][:start_date])
      price_per_night = Listing.find(params[:booking][:listing_id]).price_per_night
      total_price = (num_of_nights * price_per_night).to_i
      params[:booking][:total_price] = total_price
      session["booking"] = params[:booking]
      render "payment"
    end

  end

  def checkout    

    payable_amount = session["booking"]["total_price"].to_i

    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
      :amount => payable_amount, 
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
      )

    if result.success?   
      redirect_to create_booking_path(params[:id])
    else
     redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
   end

 end
end
