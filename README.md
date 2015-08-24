docker-ruby
===========

This is docker project for generate static content in octopress. I build ruby 1.9.3 + Gems.


How it's work
===========

1. Pull image:

    `` docker pull vukor/docker-ruby ``

2. Go to directory with your octopress project

3. Generate static content:

    `` docker run -v `pwd`:/blog -ti --rm vukor/docker-ruby rake generate ``

4. Generate and preview static content:

    `` docker run -p 80:4000 -v `pwd`:/blog -ti --rm vukor/docker-ruby rake preview ``

    Now see http://ip-address-where-run-docker/


Useful links
============
  - http://docs.docker.com/compose/
  - https://github.com/docker/compose/blob/master/docs/index.md

