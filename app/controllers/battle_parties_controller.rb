class BattlePartiesController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def edit
    @battle_party = BattleParty.find_by(user_id: params[:user_id])
  end

  def update
  end

  def destroy
  end

  def battle_party_params
    perams.require(:battle_party).permit(:user_id)
  end
end
