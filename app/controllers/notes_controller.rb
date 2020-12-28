class NotesController < ApplicationController
    load_and_authorize_resource

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
        @note.user = current_user
        @note.visible_to = current_user.name   
        @note.save
        @note.reload  
        redirect_to root_path       
        
    end

    def update
        @note = Note.find(params[:id])
        @note.update_attributes(note_params)
        @note.readers << current_user
        @note.save
        redirect_to root_path
    end

    private

    def note_params
        params.require(:note).permit(:content, :visible_to, :user_id)
    end

end