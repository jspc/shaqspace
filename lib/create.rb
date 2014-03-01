# Do some resque based stuff
require 'fuggery/rackspace/spinup'
require 'fuggery/rackspace/servers'
require 'net/ssh'

class Create
  @queue = :shaq
  def self.perform u, k, fqdn, domain
    if domain == 'fcuat.co.uk'
      subdomains = %w(web bilcas db redis alpaca codas www api)
    else
      subdomains = %w(www)
    end

    flavor = '2 GB Performance'
    image  = 'CentOS 6'

    spinup  = Fuggery::Rackspace::Spinup.new u, k
    servers = Fuggery::Rackspace::Servers.new u, k
    pw      = spinup.create fqdn, flavor, image, domain, subdomains
    ip      = servers.server(fqdn).ipv4_address # Sometimes the DNS hasn't propagated

    Net::SSH.start(ip, 'root', :password => pw) do |ssh|
      ssh.exec "usermod -p $1$N6wOstd7$hGSh63pvHHVWw7voSP0CK1 root"
    end
  end
end

