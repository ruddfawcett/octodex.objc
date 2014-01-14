octodex-objc
============

An Objective-C wrapper for the Octodex API.

##Use
Use this class like any other Objective-C class:

```objc
// import the GHOctodex class (using GH as a prefix for GitHub)
import "GHOctodex.h";

// fetch all octocats and print the returned array
NSLog(@"%@",[GHOctodex completeOctodex]);
```

For complete annotation, see [the actual class file (GHOctodex.m)](GHOctodex.m) as well as the [demo implementation](GHOctodex Demo/GHOctodex Demo/AppDelegate.m).

##Class Methods
Check the [response example](#example-response) below, to see what these functions wil serve you.

###Complete Octodex
**`[GHOctodex completeOctodex];`** 

Returns an array containing every octocat from [the Octodex](https://octodex.github.com).

###Random Octocat
**`[GHOctodex randomOctocat];`** 

Returns an array containing a random octocat from [the Octodex](https://octodex.github.com).

###Octocat by Number
**`[GHOctodex numberedOctocat:number];`**

Where `number` is a number between 1 and the number of the last Octocat (as of 1/14/14 this - 113), and returns that numbered Octocat from [the Octodex](https://octodex.github.com).  

The API checks if the number exists in the Octodex, so you don't have to check if it does.

##Example Response
**NSDictionary:**
```objc
{
    author = "http://octodex.github.com/original";
    authorAvatar = "https://img.skitch.com/20110427-p3wtwcbu957cf9mm93s4sjqqci.png";
    authorURL = "http://www.idokungfoo.com";
    image = "http://octodex.github.com/images/original.png";
    name = Original;
    number = 1;
    page = "http://octodex.github.com/original";
}
```

###Keys
- `name` - the name of the octocat
- `page` - the webpage of the octocat
- `image` - the raw image URL of the octocat
- `author` - the creator of the octocat
- `number` - the number of the octocat in the series
- `authorURL` - the URL of the author (GitHub/Website)
- `authorAvatar` - the avatar of the author

##To Do
- Check for errors given by the API and handle them

##Use of Octocats
Check out the GitHub Octodex frequently asked questions (http://octodex.github.com/faq), for specific use.  GitHub owns all of the Octocats, this Objective-C class just uses an API that grabs all of their data.
