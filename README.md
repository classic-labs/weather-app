# README

Weather App

* Ruby version

	* 3.2.3

* Database

	* Run rails db:migrate

* System dependencies

	* Devise for basic user auth
		* Use the default sign up to create user
	* Open Weather (for retrieving weather by zip code)
	* validates_zipcode (for validating zip code passed to Open Weather)

* Configuration

	* Please run rails dev:cache for caching in development env
	* No CSS framework for this project, just some simple styles

* How to run the weather service test

	* bundle exec rspec spec/services/weather_service_spec.rb

* Services (job queues, cache servers, search engines, etc.)

	* WeatherService handles fetching and caching weather data
