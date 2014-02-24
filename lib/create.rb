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

    spinup = Fuggery::Rackspace::Spinup.new u, k
    spinup.create fqdn, domain, subdomains
  end
end
