get '/' do
  @user = current_user if logged_in?

  erb :index
end

post '/create_room' do
  @user = current_user
  @player1 = Player1.create(name: current_user.username)
  @room = Room.create(name: params[:name], user_id: @user.id, player1_id: @player1.id)
  @player2 = nil

  redirect "/room/#{@room.id}"
end

get '/lobby' do
  @rooms = Room.all.where(active: true)
  if session[:user_id]
    @user = User.find session[:user_id]
    erb :lobby
  else
    redirect '/access_denied'
  end
end

get '/room/:id' do
  @room = Room.find params[:id]
  @player1 = @room.player1
  @room.update(active: true)
  @rooms = Room.all

  erb :fight
end

patch '/room/:id/join' do
  @room = Room.find params[:id]
  @player1 = @room.player1
  @player2 = Player2.create(name: current_user.username)
  @room.update(active: true, player2_id: @player2.id)
  @rooms = Room.all

  erb :fight
end

get '/room/:id' do
  @room = Room.find params[:id]
  @room.active = true
  @room.save
  @rooms = Room.all

  erb :fight
end


patch '/leave/:id' do
  @room = Room.find params[:id]
  @room.active = false
  @room.save
  @rooms = Room.all
  @user = current_user

  erb :lobby
end