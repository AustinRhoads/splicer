class BattlesController < ApplicationController
  before_action :check_login
  before_action :set_battle, only: [:show, :edit, :update, :destroy]
  include ActionController::Live


  def index
    @battles = Battle.all
  end


  def show
    @player_one = @battle.player_one
    @player_two = @battle.player_two

  end


  def new
    @battle = Battle.new
    @user = current_user
    @battle_party = @user.battle_party
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
      redirect_to battle_path(@battle)
    else
      redirect_to new_battle_path
    end

  end

  def update
  
    if  ActiveModel::Type::Boolean.new.cast(battle_params[:user_won]) == true
      @points = @battle.winning_exp
    else
      @points = @battle.losing_exp
    end
    
    current_user.gain_experience(@points)
    current_user.save
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

  
    def battle_params
      params.require(:battle).permit(:level, :user_won)
    end
end
