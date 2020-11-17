class IdentitiesController < ApplicationController
    def new
        @identity = ENV['omniauth.identity']
       end

       def identity_params
        params.require(:identity).permit(:name, :email, :password, :password_confirmation, :npc)
      end
end
