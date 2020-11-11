class MonstersController < ApplicationController
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
    @monster = Monster.create(monster_params)
    
    if @monster.save
      redirect_to monster_path(@monster)
    else
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
    @monster.destroy
    redirect_to user_path(current_user), notice: "#{@monster.name} has been euthinized"
  end

  def monster_params
    params.require(:monster).permit(:name, :user_id, :head_id, :arm_id, :leg_id, :back_id)
  end
end
