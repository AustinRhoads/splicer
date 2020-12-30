class MonstersController < ApplicationController
  before_action :check_login
  
  def index
    @monsters = Monster.all
  end

  def show
    @monster = Monster.find(params[:id])
    @user = @monster.user
  end

  def new
    @monster = Monster.new
    @heads = Head.all
    @arms = Arm.all
    @legs =Leg.all
    @backs = Back.all
    
  end

  def create
    @@errors = ""
    @monster = Monster.new(monster_params)
    if @monster.save
      redirect_to monster_path(@monster)
    else
      flash[:alert] = []
      @monster.errors.full_messages.each do |msg|
       next if msg.include? "must exist"
        msg = msg.split(" ")
        msg.shift()
        msg = msg.join(" ")
        flash[:alert] << "   " + msg + "   "
        
      end

      redirect_to new_monster_path
    end
  end


  def destroy
    @monster = Monster.find(params[:id])

    if @monster.user == current_user

      if current_user.battle_party && current_user.battle_party.monsters.include?(@monster)
        @monster.destroy
        current_user.set_top_three_as_battle_party
      else
      @monster.destroy

      end

      redirect_to user_path(current_user), notice: "#{@monster.name} has been euthinized"

    else
      redirect_to monster_path(@monster)

    end

  end

  def monster_params
    params.require(:monster).permit(:name, :user_id, :head_id, :arm_id, :leg_id, :back_id, :image)
  end
end





#  def edit
#    @monster = Monster.find(params[:id])
  #  @heads = Head.all
  #  @arms = Arm.all
  #  @legs =Leg.all
  #  @backs = Back.all
  #  
#  redirect_back(fallback_location: monster_path(@monster))
#  end

 # def update
 #   @monster = Monster.find(params[:id])
 #   @monster.update(monster_params)
 #   @monster.save
 #   redirect_to monster_path(@monster)
 # end