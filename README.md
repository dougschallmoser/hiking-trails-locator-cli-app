# Hiking Trails Locator

This is a command line interface application that allows the user to locate hiking trails anywhere in the United States via a zip code and obtain additional information about any trail. The user is also given control over how many miles to extend their search for trails.

The user is prompted for their name, zip code and distance of search radius. The application returns a list of up to 10 trails meeting this criteria in ascending order of trail length. The user is then prompted to choose a number corresponding to the trail in the list that they want to see additional details for. The application provides the details for the trail of choice and prompts the user once more with three choices: Go back to trail list, enter a new zip code, or exit.


## Getting Started

In order to run this application, you will need a private key from the Hiking Project API.
To obtain a private key, create an account on https://www.hikingproject.com/.
Once the account is created, go to https://www.hikingproject.com/data and your private key will be available for use.

### Installation

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



## Sample

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


## Contributing

Bug reports and pull requests are welcome on Github at https://github.com/dougschallmoser/hiking-trails-locator-cli-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.
 

## Authors

* **Doug Schallmoser** - *All work* - [DougSchallmoser](https://github.com/dougschallmoser)


## License

This project is licensed under the MIT License.


## Acknowledgments

I would like to acknowledge Hiking Project for continuing to offer their API free of charge.
