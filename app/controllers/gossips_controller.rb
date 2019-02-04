class GossipsController < ApplicationController
  def card
    @gossip_card = Gossip.find(params[:id])
  end
end
