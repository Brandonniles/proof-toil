class WelcomeController < ApplicationController
  def index
  end
  def weather
    # Creates an array of states that our user can choose from on our index page
    @states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NB KS OK
      TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY
      NJ CT RI MA VT NH ME DC).sort!

      # removes spaces from the 2-word city names and replaces the space with an underscore
      if params[:city] != nil
        params[:city].gsub!(" ", "_")
      end

      #checks that the state and city params are not empty before calling the API
      if params[:state] != "" && params[:city] != "" && params[:state] != nil && params[:city] != nil

        results = HTTParty.get("http://api.wunderground.com/api/#{Figaro.env.wunderground_api_key}/geolookup/conditions/q/#{params[:state]}/#{params[:city]}.json")


        #if no error is returned from the call, we fill our instants variables with the result of the call
        if results['response']['error'] == nil || results['error'] ==""

          #Checks to see if the response contains an array (ambigous response for an invalid city/state combination) or a hash(valid response)
          if results.key?("location")
            @location = results['location']['city']
            @temp_f = results['current_observation']['temp_f']
            @temp_c = results['current_observation']['temp_c']
            @weather_icon = results['current_observation']['icon_url']
            @weather_words = results['current_observation']['weather']
            @forecast_link = results['current_observation']['forecast_url']
            @real_feel_f = results['current_observation']['feelslike_f']
            @real_feel_c = results['current_observation']['feelslike_c']
            @wind = results['current_observation']['wind_string']
          else
            @error = "City/State combination does not exist."
          end
        else
          # if there is an error, we report it to our user via the @error variable
          @error = results['response']['error']['description']
        end


      end
    end

    def blog
    end

    def store
    end

    def map
    end

    def order_complete
      @order = Order.find(params[:order_id])
      @amount = (@order.grand_total.to_f.round(2) * 100).to_i

      customer = Stripe::Customer.create(
        :email => current_user.email,
        :card => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer => customer.id,
        :amount => @amount,
        :description => 'Rails Stripe customer',
        :currency => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to cart_path
    end
  end
