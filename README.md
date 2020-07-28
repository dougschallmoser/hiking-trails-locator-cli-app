# Hiking Trails Locator

This is a command line interface application that allows the user to locate hiking trails anywhere in the United States via a zip code and obtain information about the trail.


### Installing

In order to run this application, you will need a private key from the Hiking Project API.
To obtain a private key, create an account on https://www.hikingproject.com/.
Once the account is created, go to https://www.hikingproject.com/data and your private key will be available for use.

To run this application in your local environment, follow these steps:
1. Clone this repository
2. Run `cd hiking-trails-locator-cli-app`
3. Run `bundle install`
4. Run `bin/hike`

To run this application as a gem, follow these steps:
1. Run `gem install hiking_trails_locator
2. Enter your private API key in `trail_importer.rb`
3. Run `bundle install`
4. Run `bin/hike`


### Sample

```
Please enter the five digit zip code of where you would like to hike.
98225

You entered zip code '98225' which is located in Bellingham, Washington.

How many miles from this location would you like to search for trails? (Enter a number between 1 and 100):
10

You entered '10' miles.

Here are the trails available within 10 miles of Bellingham, Washington 98225:

1. TEDDY BEAR COVE TRAIL - Length: 0.5 mi - A somewhat steep descent through the trees takes hikers to a picturesque cove.
2. ROCK TRAIL - Length: 0.7 mi - A gorgeous trail with many switchbacks and stairs taking you past huge boulders.
3. RAPTOR RIDGE - Length: 1.3 mi - Beautiful trail with a view of Mt. Baker and even Mt. Rainier on a clear day.
4. SQUIRES LAKE PARK LOOP - Length: 2.1 mi - Just over two miles of easy hiking through unique sandstone, wetland, and forest settings.
5. STIMPSON FAMILY NATURE RESERVE LOOP - Length: 3.1 mi - A strikingly beautiful loop that invites visitors to connect with nature.

Enter the number corresponding to the specific trail you would like to get more details about.
5

You requested more details for STIMPSON FAMILY NATURE RESERVE LOOP...


**********************************************

Trail Details for STIMPSON FAMILY NATURE RESERVE LOOP

Length: 3.1 miles
Level of Difficulty: Intermediate
Dogs Allowed?: No Dogs
Route Type:Loop
Highest Elevation: 796'
Lowest Elevation: 522'
Elevation Gain: 369'

Description: From the kiosk at the parking area, follow the wide gravel path as it heads into the forest. Very soon, you'll reach a slightly obscured wetland complete with a viewpoint and bench. A few roots enter the tread, but the going remains very easy as hikers climb a gentle slope lined by tall cedars.

**********************************************

Enter '1' to go back to your list of trails.
Enter '2' to enter a new zip code.
Enter 'exit' to close this application.
```

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
