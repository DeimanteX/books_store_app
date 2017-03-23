source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',        '5.0.2'
gem 'puma',         '3.4.0'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.0.0'
gem 'coffee-rails', '4.2.1'
gem 'jquery-rails', '4.1.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.5'
gem 'bootstrap',    '4.0.0.alpha6'
gem 'haml', '4.0.7'
gem 'devise', '4.2.1'
gem 'kaminari', '1.0.1'
gem "paperclip", '5.1.0'
gem 'rails-assets-tether', '1.1.1'

group :development, :test do
  gem 'sqlite3', '1.3.12'
  gem 'byebug', '9.0.0', platform: :mri
end

group :development do
  gem 'web-console',  '3.3.0'
  gem 'listen',       '3.0.8'
  gem 'spring', '1.7.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "haml-rails", "~> 0.9"
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
