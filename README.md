# Catch External API request

This small modular Sinatra app is intended to 'catch' API calls from external services.

## Getting started

```
$ bundle install
$ rackup
```

## Test 

Point your browser to `http://localhost:9292`, you should see:
```
{
  status: "ok"
}
```

Point your browser to `http://localhost:9292`, you should see:
```
{
  author: "Egbert Pot",
  version: "1.0.0"
}
```

## Use

Catch a POST request via `http://localhost:9292/triggers/catch.json`. You should now be able to intercept the POST request using `binding.pry`

The JSON request body can be found in the variable `trigger`
```
    14:           
    15:           File.open(File.join(Api.root, "requests", "#{Time.now.strftime("%Y-%m-%d__%H:%M:%S")}.json"),"w") do |f|
    16:             f.write(JSON.pretty_generate(trigger))
    17:           end
    18: 
 => 19:           binding.pry
    20: 
    21:           # Return HTTP status code 200, no matter what happends
    22:           content_type :json
    23:           return { status: 'ok'}.to_json
    24:         end 
```

You can also find the JSON request in the folder requests. The request is created with a timestamp, e.g. 2015-10-24__19:10:10.json

## Make your local app publicly accessible for the internet:

For this, we're using the `ngrok` service: [Secure tunnels to localhost](https://ngrok.com/)

*”I want to expose a local server behind a NAT or firewall to the internet.”*

```
$ ngrok http 9292
```

Enjoy!