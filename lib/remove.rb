# Do some resque based stuff
require 'fuggery/rackspace/spinup'

class Remove
  @queue = :shaq
  def self.perform u, k, name
    spinup = Fuggery::Rackspace::Spinup.new u, k
    spinup.remove name
  end
end
