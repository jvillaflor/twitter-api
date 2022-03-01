## Twitter Api

Twitter-api haves a feature that tweets current temperature and 5-days forecast temperatures average. Data is collected from Open Weather Map (https://openweathermap.org/).


* Ruby version: 3.1.1

* Rails version: 7.0.2


## Usage

Clone this repository.

Run 
    rails s 


Make a post request like:
    curl -X POST http://localhost:3000/api/tweets/temperatures -H 'Content-Type: application/json' -d '{"appid":"<your_appid_here>"}'

More info about appid: https://openweathermap.org/appid.
Note you have to signup openweathermap.org to create an appid.

The API is documented by using Apipie (https://github.com/Apipie/apipie-rails)
