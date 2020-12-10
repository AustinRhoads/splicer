class MonstersController < ApplicationController
  before_action :check_login
  
  def index
    @monsters = Monster.all
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def new
    @monster = Monster.new
    @heads = Head.all
    @arms = Arm.all
    @legs =Leg.all
    @backs = Back.all
    
  end

  def create
    binding.pry
    @@errors = ""
    @monster = Monster.new(monster_params)
    if @monster.save
      redirect_to monster_path(@monster)
    else
      @monster.errors.full_messages.each do |msg|
        msg = msg.split(" ")
        msg.shift()
        msg = msg.join(" ")
        flash[:alert] = "   " + msg + "   "
      end

      redirect_to new_monster_path
    end
  end

  def edit
    @monster = Monster.find(params[:id])
    @heads = Head.all
    @arms = Arm.all
    @legs =Leg.all
    @backs = Back.all
    
  end

  def update
    @monster = Monster.find(params[:id])
    @monster.update(monster_params)
    @monster.save
    redirect_to monster_path(@monster)
  end


  def destroy
    @monster = Monster.find(params[:id])
    if current_user.battle_party && current_user.battle_party.monsters.include?(@monster)
      @monster.destroy
      current_user.set_top_three_as_battle_party
    else
    @monster.destroy

    end

    redirect_to user_path(current_user), notice: "#{@monster.name} has been euthinized"
  end

  def monster_params
    params.require(:monster).permit(:name, :user_id, :head_id, :arm_id, :leg_id, :back_id, :image)
  end
end
