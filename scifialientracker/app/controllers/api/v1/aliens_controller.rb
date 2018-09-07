class Api::V1::AliensController < ApplicationController
    before_action :find_alien, only: [:show, :update, :destroy]
    def index
        
        if params[:name]!= nil then
            @alien = Alien.find_by_name(params[:name])
            render :json => {
                :status => :ok,
                :message => "record found",
                :data => @alien

            }
        else
            @aliens = Alien.all
            render json: @aliens
        end
    end
    def show
        render json: @alien
    end
    def update
      if @alien.update(alien_params)
        render :json =>{
            :status => :ok,
            :message => "Record Updated"
        }
      else
        render json: @alien.errors, status: :unprocessable_entity
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
       
        params.require(:alien).permit(:name, :specie,:home_world)
    end

    def find_alien
        begin
            @alien = Alien.find(params[:id])
        rescue StandardError => e
            render :json=>{
                :status => :not_found,
                :message => "#{e}"
            } 
        end
       
    end
end
