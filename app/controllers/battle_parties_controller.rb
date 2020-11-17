class BattlePartiesController < ApplicationController
  before_action :check_login
  

  def edit
    @battle_party = BattleParty.find_by(user_id: params[:user_id])
  end


  def update

        @battle_party = BattleParty.find_by(user_id: params[:user_id])

        @battle_party.update(battle_party_params)

        if @battle_party.save
             redirect_to new_battle_path
        else
             redirect_to edit_user_battle_party_path(current_user)
        end
  
  end

  private

  def battle_party_params
    params.require(:battle_party).permit(:user_id, :monster_ids => [])
  end

end
