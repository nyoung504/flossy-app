class ItemController < ApplicationController
  def page
    @listings = Listing.all
  end
end
