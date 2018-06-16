# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/contact_email
  def contact_email
    UserMailer.contact_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/product_email
  def product_email
    UserMailer.product_email
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_email
  def welcome_email
    UserMailer.welcome_email
  end

end
