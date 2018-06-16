class PageController < ApplicationController
  def home
  end

  def contact_us
    @now = DateTime.now
    @first_name = params["first_name"]
    flash.now[:alert] = ""
    if (@first_name == "")
      flash.now[:alert] += "First Name is reqiured!<br/>"
    end
    @last_name = params["last_name"]
    if (@last_name == "")
      flash.now[:alert] += "Last Name is reqiured!<br/>"
    end
    @email = params["email"]
    if (@email == "")
      flash.now[:alert] += "Email is reqiured!<br/>"
    end
    @phone_number = params["phone_number"]
    @question = params["question"]
    @subscribed = params["newsletter"] == "subscribed" ? true : false
    @contact = params["contact"]
    @products = []
    Product.all.each do |product|

      @products << product.name
    end
    @selected_product = params["products"]
    @commit = params["commit"]
    if @commit == "Submit"
      if (@first_name != "") && (@last_name != "") && (@email != "")
        UserMailer.contact_email(@email, @selected_product).deliver_now
        UserMailer.welcome_email(@email, @first_name, @last_name, @question, @selected_product).deliver_now
      end
    end
  end

  def products
    @products = {
        "Snow Skis" => 200.00,
        "Snow Boards" => 150.00,
        "Snow Boots" => 100.00,
        "Mittens" => 9.00,
        "Gloves" => 15.00,
        "Hats" => 20.00
    }
  end

  def preferences
  end

  def blog
  end

  def calendar
    @month = params[:month].to_i
    if @month == 0
      @month = Time.now.month
    end
    @year = params["year"].to_i
    if @year == 0
      @year = Time.now.year
    end
  end

  def articles
  end

  def login
  end
end
