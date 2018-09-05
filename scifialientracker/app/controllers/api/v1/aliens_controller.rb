class Api::V1::AliensController < ApplicationController
    before_action :find_alien, only: [:show, :update, :destroy]
    def index
        @aliens = Alien.all
        render json: @aliens
    end
    def show
        render json: @alien
    end
    def update
      if @alien.update(alien_params)
        render json: @alien
      else
        render json: @alien.errors
      end 

    end
    def destroy
        @alien.delete

        render :json => { 
            :status => :ok, 
            :message => "Successfully deleted!",
          
         }

    end
    def create
        @alien = Alien.new(alien_params)

        if @alien.save
            render json:@alien
        
        else
            
        end
        

    end

    private

    def alien_params
        params.require(:alien).permit(:name, :specie,:notes,:home_world)
    end

    def find_alien
        @alien = Alien.find(params[:id])
    end
end
