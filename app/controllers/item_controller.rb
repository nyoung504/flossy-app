# frozen_string_literal: true

class ItemController < ApplicationController
  def page
    @listings = Listing.all
  end
end
