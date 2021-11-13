class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  # ここで初めて入力内容を保存
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  # 送信完了画面。
  def done
  end


  private

  def contact_params
    params.require(:contact).permit(:email, :name, :message)
  end
  
end
