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
  @words = ["scary", "ruthless", "violent", "sleepy", "super", "sweet"]
  @rooms = Room.all.where(active: true)
  if session[:user_id]
    @user = User.find session[:user_id]
    erb :lobby
  else
    redirect '/access_denied'
  end
end

patch '/room/:id/join' do
  @room = Room.find params[:id]
  @player1 = @room.player1
  @room.update(player2: nil)
  @player2 = Player2.create(name: current_user.username)
  @room.update(active: true, player2_id: @player2.id)
  @rooms = Room.all

  redirect "/room/#{@room.id}"
end


patch '/room/:id/start' do
  @room = Room.find params[:id]
  @player1 = @room.player1
  @player2 = @room.player2
  @game = Game.create(name: "#{@player1.name} vs. #{@player2.name}")

  redirect "room/#{@room.id}/start"
end

get '/room/:id/start' do
  @room = Room.find params[:id]
  @player1 = @room.player1
  @player2 = @room.player2

  erb :start
end

get '/room/:id' do
  @room = Room.find params[:id]
  @room.active = true
  @room.save
  if @room.player1 && @room.player2
    @msg = "Players in this room: #{@room.player1.name} & #{@room.player2.name}"
  else
    @msg = "It's only you in the room! Waiting for another player..."
  end
  @rooms = Room.all

  erb :fight

  # values = {room_id: @room.id}.to_json
end


patch '/leave/:id' do
  @user = current_user
  @room = Room.find params[:id]
  if @room.player1.name = @user.username
    @room.update(player1: nil)
  else
    @room.update(player2: nil)
  end
  @player = nil
  @room.save
  @room.update(active: false)
  @rooms = Room.all

  redirect '/lobby'
end

post '/game' do
  grid_id = params[:grid_id]
  count = params[:count]

  {}.to_json
end
