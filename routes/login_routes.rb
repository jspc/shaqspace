get '/login' do
  erb :login
end

post '/login' do
  session[:u]  = params[:user]
  session[:k]  = params[:key]
  begin
    session[:dns]     =  Fuggery::Rackspace::DNS.new session[:u], session[:k]
    session[:servers] =  Fuggery::Rackspace::Servers.new session[:u], session[:k]
    session[:logged]  =  true
    redirect '/'
  rescue Exception => e
    @err = "Couldn't login: #{e}"
    erb :err
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
