# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'rainbow', '~> 3.0'
gem 'nokogiri', '~> 1.13'
gem 'gemoji', '~> 3.0'
gem 'jekyll', '>= 3.6'
gem 'rack', '>= 2.1.4'
gem 'rspec'
gem 'wdm', '~> 0.1.1', :install_if => Gem.win_platform?
gem 'just-the-docs'
gem 'jekyll-spaceship'
gem 'jekyll-feed'
gem 'jekyll-sitemap'
gem 'jekyll-seo-tag'

install_if -> { Gem.win_platform? } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# gem "rails"
