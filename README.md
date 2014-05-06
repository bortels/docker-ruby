docker-ruby
===========

docker container with ruby 2.1.1

This is mostly for my own use, but hey - sharing is caring. 

Worth noting, this is based on ubuntu 14.04, and currently the ruby 2.1.1 build is broken on that
version of ubuntu, because readline is *too new*, yowza. A patch is included to fix it, look at links
in the dockerfile for the ugly details. This will presumably be fixed in 2.1.2 shortly, but patience
isn't my strong suit. If you are reading this, it's not out yet, or I'm lazy, or got hit by a bus or
something - weep for me. 
