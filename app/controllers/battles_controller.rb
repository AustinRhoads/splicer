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
    respond_to do |format|
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url, notice: 'Battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_battle
      @battle = Battle.find(params[:id])
    end

  
    def battle_params
      params.require(:battle).permit(:level)
    end
end
