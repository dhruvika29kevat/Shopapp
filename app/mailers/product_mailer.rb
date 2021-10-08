class ProductMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.product_created.subject
  #
  def product_created
    @greeting = "Hi"

    mail(
      from: "dkkevat@test.com",
      to: User.first.email, 
      cc: User.all.pluck(:email), 
      subject: "New Product created!!"
      ) 
  end
end
