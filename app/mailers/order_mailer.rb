class OrderMailer < ApplicationMailer
  default from: 'chaton-maton@outlook.fr'
  layout 'mailer'

  def send_admin_order(user)
    @user = user
    @item_carts = ItemCart.where(cart_id: @user.cart.id)
    mail(:to => 'yanis95@yopmail.com', :subject => "New Order created please review and enable.")
  end

  def send_order_confirmation(user)
    @user = user
    @item_carts = ItemCart.where(cart_id: @user.cart.id)
    mail(:to => @user.email, :subject => "Your order is confirmed !")
  end
end
