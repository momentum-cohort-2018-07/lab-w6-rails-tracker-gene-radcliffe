class Api::V1::NotesController < ApplicationController
    before_action :find_alien, only:[:index]
    before_action :find_note, only:[:destroy]
    def index
      
        @notes = @alien.notes
        render json: @notes
    end

    def create
    
        @note = Note.new(note_params)
        if @note.save
            render :json =>{
                :status=> :created,
                :message => "Record created"
            }
        else
            render json:@note.errors, status: :unprocessable_entity
        end
        

    end

    def destroy 
        binding.pry

        @note.delete

        render :json => { 
            :status => :ok, 
            :message => "Successfully deleted!",
          
         }

    end
    private

    def alien_params
        params.require(:alien).permit(:name, :specie,:home_world)
    end

    def note_params
        params.permit(:alien_id, :body)
    end
    def find_note
       
       
        begin
            @note = Note.find(params[:id])
        rescue StandardError => e
            render :json=>{
                :status => :not_found,
                :message => "#{e}"
            } 
        end
    end
    def find_alien
        begin
            @alien = Alien.find(params[:alien_id])
        rescue StandardError => e
            render :json=>{
                :status => :not_found,
                :message => "#{e}"
            } 
        end
    end
end
