class ContactsController < ApplicationController
load_and_authorize_resource class: "Message", param_method: :message_params

  def index
    @messages = @contacts
  end

  def new
    @message = @contact
  end

  def create
    @message = @contact
     if @message.save
       flash[:success] = "Wiadomość stworzona"
       redirect_to new_contact_path
       UserMailer.smail(@message).deliver_now
     else
       render 'new'
    end
  end

  def destroy
    @message = @contact
    if @message.destroy
      flash[:notice] = "Usunięto wiadomość"
      redirect_to contacts_path
    else
      render 'index'
      flash[:notice] = "Wystąpił błąd"
    end
  end

  private
  def message_params
    params.require(:message).permit(:title, :email, :description)
  end

end
