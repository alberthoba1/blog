class UserMailer < ApplicationMailer
  default from: 'alberthoba6@gmail.com'

  def smail(message)
    @message = message
    mail(to: 'alberthoba6@gmail.com', subject: "#{@message.title}"  )
  end
end
