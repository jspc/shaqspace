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
    @err = "Server #{params[:name]} doesn't seem to exist"
    erb :err
  end
end
