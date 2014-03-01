# Do some resque based stuff
require 'fuggery/rackspace/spinup'

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

    spinup = Fuggery::Rackspace::Spinup.new u, k
    spinup.create fqdn, flavor, image, domain, subdomains
  end
end
