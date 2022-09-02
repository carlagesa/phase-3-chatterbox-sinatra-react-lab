class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes

  get '/messages' do
    # get all the messages from the database
    messages = Message.all.order(:created_at)
    # send them back as a JSON array
    messages.to_json
  end


  post '/messages' do
    # post all the messages from the database
    messages = Message.create(body: params[:body],  username: params[:username])
    # send them back as a JSON array
    messages.to_json
  end
  

  patch '/messages/:id' do
    # patch all the messages from the database
    messages = Message.find(params[:id])
    # send them back as a JSON array
    messages.update(body: params[:body])
    messages.to_json
  end

  delete "/messages/:id" do
    messages = Message.find(params[:id])
    messages.destroy
    messages.to_json
  end
end
