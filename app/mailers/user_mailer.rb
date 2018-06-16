class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_email.subject
  #
  def contact_email(user_email, selected_product)
    @greeting = "Hi"

    @selected_product = selected_product
    @user_email = user_email
    mail to: @user_email,
         bcc: 'dave.jones@scc.spokane.edu',
         subject: "Thank you"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.product_email.subject
  #
  def product_email(user, product)
    @greeting = "Hi"
    @user = user
    @product = product

    mail to: @user.email,
         subject: "A New Product For You."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(email, first_name, last_name, question, selected_product)
    @greeting = "Hi"
    @email = email
    @first_name = first_name
    @last_name = last_name
    @question = question
    @selected_product = selected_product

    mail to: "wolfspirit100@gmail.com",
         reply_to: @email,
         subject: @selected_product
  end

  def article_email(user, article)
    @greeting = "Hello"
    @user = user
    @article = article

    mail to: @user.email,
         subject: @article.title
  end

end
