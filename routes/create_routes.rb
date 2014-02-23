get '/create' do
  redirect '/login' unless session[:logged]
  @domains = session[:dns].zones
  erb :create
end

post '/create' do
  redirect '/login' unless session[:logged]
  fqdn = "#{params[:name]}.#{params[:domain]}"

  begin
    Resque.enqueue(Create, session[:u], session[:k], fqdn, params[:domain])
    redirect "/server/#{fqdn}"
  rescue Exception=>e
    @err = "Couldn't create server #{fqdn}: #{e}"
    erb :err
  end
end
