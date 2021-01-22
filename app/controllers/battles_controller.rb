class BattlesController < ApplicationController
  before_action :check_login
  before_action :set_battle, only: [:show, :edit, :update, :destroy]
  before_action :old_game, only: [:show]
  include ActionController::Live


  


  def show
    
       @player_one = @battle.player_one
       @player_two = @battle.player_two
       player_one_check
   
  end


  def new
    @battle = Battle.new
    @user = current_user
    if @user.battle_party == nil || @user.battle_party.monsters.count != 3 
      @user.set_top_three_as_battle_party
    end
    @battle_party = @user.battle_party
   battle_ready
  end


  def edit
    
  end

  def create
    @battle = Battle.new(battle_params)
    @npc = (User.where(:npc => true, :level => @battle.level)).sample
    @npc.set_top_three_as_battle_party

    if @battle.save
      @player_one = BattleUser.create(:user_id => current_user.id, :battle_id => @battle.id)
      @player_two = BattleUser.create(:user_id => @npc.id, :battle_id => @battle.id)
      @battle.save
      redirect_to "/users/#{current_user.id}/battles/#{@battle.id}"
    else
      redirect_to new_user_battle_path
    end

  end

  def update
    player_one_check
    @user = @battle.player_one
    if  ActiveModel::Type::Boolean.new.cast(battle_params[:user_won]) == true
      @points = @battle.winning_exp
    else
      @points = @battle.losing_exp
    end

    @user.gain_experience(@points)
    @user.save
    @battle.update(battle_params)
    redirect_to user_path(current_user)
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    redirect_to user_path(current_user)
  end

  private
    def set_battle
      @battle = Battle.find(params[:id])
    end

    def player_one_check
      if current_user != @battle.player_one 
        redirect_to user_path(current_user)
      end
    end

    def battle_ready
      if @user.monsters.count < 3
        flash[:alert] = "You need at least three monsters to battle."
        redirect_to user_path(@user)
      end
    end

    def old_game
      if @battle.game_over == true
        flash[:alert] = ["Sneaky sneaky."]
        redirect_to user_path(current_user)
      end
    end

  
    def battle_params
      params.require(:battle).permit(:level, :user_won, :game_over)
    end
end
