module Routing
  module Triggers

    def self.registered(app)
      app.namespace '/triggers' do
        
        get '/test.?:format?' do
          content_type :json
          return { status: 'ok'}.to_json
        end

        post '/?' do 
          trigger = JSON.parse(request.body.read)
          binding.pry
          trigger = Trigger.new(params)
          
          # Return 200 ok no matter what
          content_type :json
          return { status: 'ok'}.to_json
        end 

      end
    
    end
  end
end