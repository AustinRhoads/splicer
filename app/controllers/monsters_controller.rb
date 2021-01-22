class MonstersController < ApplicationController
  before_action :check_login
 
  
  def index
    @monsters = monster_query(params["query"])
    if @monsters == nil || @monsters.empty? 
      @monsters = Monster.all
    end
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

  
  def monster_query(str)

      if str == nil 
            @monsters = Monster.all
      else
           str = params["query"].split(" ").map {|x| x =  x.capitalize }.join(" ")
            @monsters = Monster.where('name LIKE ?', str + '%').all  
      end
  end



  def monster_params
    params.require(:monster).permit(:name, :user_id, :head_id, :arm_id, :leg_id, :back_id, :image)
  end
end

