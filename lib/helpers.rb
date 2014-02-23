# Simple helper methods for Shaqspace

module Helpers
  def self.tld fqdn, dns
    zones = dns.zones
    splat = fqdn.split('.')
    host  = []

    until splat.length == 0
      host << splat.shift
      if zones.include? splat.join('.')
        return host.join('.'), splat.join('.')
      end
    end
    nil
  end
end
