class ContactsController < ApplicationController
load_and_authorize_resource class: "Message", param_method: :message_params


def show
  @messages = @contact.messages
  @message = Message.new
 end

def index
@message = Message.all
end

def new
@message = Message.new
 end

def create
  @message = Message.new(message_params)
  @message.user = current_user
   if @message.save
     flash[:success] = "Wiadomość stworzona"
     redirect_to new_contact_path
     UserMailer.smail(@message).deliver_now
   else
     render 'new'
  end
end

def destroy
  @message = Message.find(params[:id])
  @message.destroy
  flash[:notice] = "Usunięto wiadomość"
  redirect_to contacts_path
end


private


def message_params
  params.require(:message).permit(:title, :email, :description)
end



end
