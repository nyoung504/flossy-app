# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :authenticate_user!, except: [:webhook]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    listing = Listing.find(params[:id])
    session = Stripe::Checkout::Session.create({
                                                 payment_method_types: ['card'],
                                                 line_items: [{
                                                   price_data: {
                                                     unit_amount: listing.price.to_i * 100,
                                                     currency: 'aud',
                                                     product_data: {
                                                       name: listing.title
                                                     }
                                                   },
                                                   quantity: 1
                                                 }],
                                                 mode: 'payment',
                                                 success_url: "#{root_url}payments/success?listing_id=#{listing.id}",
                                                 cancel_url: "#{root_url}payments/cancel"
                                               })
    render json: { id: session.id }
  end

  def webhook
    payload = request.body.read
    puts payload.inspect
  end

  def success
    @listing = Listing.find(params[:listing_id])
  end

  def cancel; end
end
