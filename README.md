Shaqspace
==

Funneling the awesomeness of Shaq into the suckiness of the Rackspace frontend.

But also doing shit for spnning up environments ar FC.

Running
--

In development I'd suggest 

```bash
$ bundle install
$ bundle exec rackup
```

In production we have unicorn. Point the upstream at `${PWD}/tmp/sockets/unicorn.sock` and start both resque and uniconr via rake
