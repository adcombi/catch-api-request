module Routing
  module Triggers

    def self.registered(app)
      app.namespace '/triggers' do
        
        get '/test.?:format?' do
          content_type :json
          return { status: 'ok'}.to_json
        end

        post '/catch.?:format?' do 
          trigger = JSON.parse(request.body.read)
          
          File.open(File.join(Api.root, "requests", "#{Time.now.strftime("%Y-%m-%d__%H:%M:%S")}.json"),"w") do |f|
            f.write(JSON.pretty_generate(trigger))
          end

          binding.pry

          # Return HTTP status code 200, no matter what happends
          content_type :json
          return { status: 'ok'}.to_json
        end 

      end
    
    end
  end
end