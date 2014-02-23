# Do some resque based stuff
require 'fuggery/rackspace/spinup'

class Create
  @queue = :shaq
  def self.perform u, k, fqdn, domain
    spinup = Fuggery::Rackspace::Spinup.new u, k
    spinup.create fqdn, domain
  end
end
