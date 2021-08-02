source 'http://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.6.5'

gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  # gem 'pry-rails', '~> 0.3.4'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc', '~> 0.8.0'    # methodを表示
  # gem 'pry-byebug', '~> 3.3.0' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer', '~> 0.4.9.2' # スタックをたどれる
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem "binding_of_caller"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
  gem 'launchy'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'kaminari'
gem 'bcrypt'
gem 'faker'
gem 'pry-rails'
