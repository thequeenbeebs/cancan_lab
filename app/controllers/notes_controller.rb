class NotesController < ApplicationController
  def create
    if user_is_not_signed_in?
      return head(:unauthorized)
    else
      note = Note.create(note_params)
      note.user = current_user
      note.visible_to = current_user.name
      note.save
      note.reload
      redirect_to '/'
    end
  end

  def update
    note = Note.find(params.require(:id))
    attrs = params.require(:note).permit(:content, :visible_to)
    note.update(attrs)
    redirect_to '/'
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
