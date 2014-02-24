get '/' do
  redirect '/login' unless session[:logged]
  @servers = session[:servers].servers.sort
  erb :index
end

get '/server/:name' do
  redirect '/login' unless session[:logged]
  begin
    @host, @zone = Helpers::tld params[:name], session[:dns]
    @dns_entries = session[:dns].view @host, @zone
    @server      = session[:servers].server params[:name]
    erb :view
  rescue Exception=>e
    @err = "Server #{params[:name]} doesn't seem to exist or isn't a FQDN (You heathen!)"
    erb :err
  end
end

get '/server/:name/delete' do
  redirect '/login' unless session[:logged]
  @name = params[:name]
  erb :confirm_deletion
end


post '/server/:name/delete' do
  redirect '/login' unless session[:logged]
  if params[:confirmed] == 'true'
    begin
      @name = params[:name]
      @host, @zone = Helpers::tld @name, session[:dns]
      session[:dns].remove_all @name, @zone
      session[:servers].remove @name
      redirect '/'
    rescue Exception=>e
      @err = e
      erb :err
    end
  end
end
