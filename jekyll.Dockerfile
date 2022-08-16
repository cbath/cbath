# Simple linux image that can host our static website using ruby & jekyll
#FROM ubuntu:latest
FROM jekyll/jekyll:4.2.0

# Install jekyll, ruby and bundler
#RUN apt-get update
#RUN apt-get -y install ruby-full build-essential zlib1g-dev
RUN gem install jekyll bundler rails

# Copy installation based files (assumes the context is the docs directory)
COPY  _config.yml Gemfile Gemfile.lock favicon.ico index.md ./

# Add the docs folder which will be used to build the jekyll site 
RUN mkdir docs && mkdir assets
ADD docs docs/
ADD assets assets/

# Install associated Gems
#RUN bundler update && bundler install

# Resolve issues with local host on windows (https://tonyho.net/jekyll-docker-windows-and-0-0-0-0/)
ENV JEKYLL_ENV docker   

# Make the site access able via localhost:4000
##EXPOSE 4000

# Serve the site! (livereload seems to be very slow on docker leaving out for now)
ENTRYPOINT bundler update && bundler install && bundler exec jekyll serve --host 0.0.0.0 -t


# docker image build . -f jekyll.Dockerfile -t px_jekyll
# docker container run -it -p 4000:4000 px_jekyll bash
# docker container run -d -p 4000:4000  px_jekyll
# docker container run -d -p 4000:4000  --mount type=bind,source="$(pwd)"/docs,target=/srv/jekyll/docs  px_jekyll
