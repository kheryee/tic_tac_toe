enable :sessions

helpers do
  def current_user
    begin
      if session[:user_id]
        User.find session[:user_id]
      else
        nil
      end
    rescue
      nil
    end
  end

  def logged_in?
    if current_user
      true
    else
      false
    end
  end
end


get '/login' do

  erb :"user/login"
end

post '/login' do
  @user = User.authenticate(params[:username_or_email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/lobby'
  else
    redirect '/error'
  end
end

get '/error' do
  erb :"user/error"
end

post '/register' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id

  redirect '/lobby'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/access_denied' do
  erb :"user/access_denied"
end