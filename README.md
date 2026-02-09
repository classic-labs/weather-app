# README

Weather App

* Versions

	* Ruby: 3.2.3
	* Rails 7.2.2

* Database

	* Create new PostgreSQL DB and run "rails db:migrate"

* System dependencies

	* Devise for basic user auth
	* Open Weather (for retrieving weather by zip code)
	* validates_zipcode (for validating zip code passed to Open Weather)

* Caching

	* Please run rails dev:cache for local mem caching
	
* General Notes

	* Use the default sign up to create user
	* Weather is retrieved from the Dashboard
	* No CSS framework for this project, just some simple styles

* Tests

	* all tests
		* bundle exec rspec
	* specific tests
		* bundle exec rspec spec/services/weather_service_spec.rb

* Services

	* WeatherService handles fetching and caching weather data
	* It also returns basic error notifications to user
