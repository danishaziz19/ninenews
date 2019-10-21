# Task

The included API endpoint returns, amongst other data, an array of news stories (assets).

You are tasked with creating an iPhone app that consumes the provided API and displays a list of news articles to the user, ideally in a TableView or CollectionView. Tapping a story should present the asset’s URL in a WKWebView or an alternate.

# Requirements

* The list of articles should display at least the following fields:

-- headline

-- theAbstract

-- byLine


* Display the latest article first in the list, use article's 'timeStamp'

* If an 'asset' has 'relatedImages', display the smallest image available as a thumbnail on the cell

* Images should be loaded asynchronously and cached

* The style of cells is up to you, with necessary padding and layout.

* For UI use storyboards, xibs or layout programmatically as needed, but it should adapt to all iPhone screen sizes

* Comment your code, so it's understandable in six months

* Make sure to include Unit tests as part of the solution - we thoroughly review unit tests and coverage!

* Use Xcode 10.3 (stable) with Swift 4 or 5, please specify code compilation notes in your submission.


# BONUS

* UI tests are bonus, we encourage do as time allows

# Resources

API Endpoint:

https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full


# Solution

## Software Architecture:

Model–view–viewmodel (MVVM)

* Model : All the model Classes (eg: Article, Author, Category, etc)
* ViewModel : ArticleViewModel use to get articles and massaging data.
* LogicController : All the viewcontoller logic written in logic controller
* Views: All ViewControllers

All modules are separated so it can be resuable.

## 3rd Party Library:

I created a framework Library name as [MindV](https://github.com/pakidanish/MindV) as we have to load image asynchronously and cached it.

How to Pod MindV Library:

```bash
platform :ios, '9.0'
pod 'MindV', :git => 'https://github.com/pakidanish/MindV.git', :tag => '1.0.11'    
```

How to use MindV Library:


```python
import MindV

MindVL.shared().loadImage(from: url, imageView: self, placeHolder: "placeHolder_image")

```

## Features

* Cacha Image Library [MindV](https://github.com/pakidanish/MindV) 
* Size classes and Constraints
* Cache limit configurable
* Test classes (Unit and UI)

## Unit test:

There are 7 unit testing funtions

* Get Article From API Sets up URL Host and Path as Expected - The first test case we will create is to test that the get articles method sets up URL Host and Path within the correct expectation.

* Get Article From API Successfully Returns List of Articles - This test is to test when the API to get articles has a successful response, the completion handler should be invoked passing the list of articles. To test asynchronous code in Xcode we can use expectation and waitForExpectation function to be fulfilled within the specified timeout we pass.

* Get Article From API with URL Response Error returns ErrorResponse - This test case is to test when the dataTask completion handler has an Error it returns ResponseError.

* Get Article From API with Empty Data returns Error - This test will check when the response returns empty data, then the completion handler will be invoked passing an Error object. 

* Get Article From API with Invalid JSON returns Error - This test for the get articles API is to handle when an invalid JSON data is passed into object serialization returns an Error.

* Articale View Controller Test

* Article Story View Controller Test

## UI test:

* Articale View Controller Navigation test.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://github.com/pakidanish/MindValley/blob/master/LICENSE)
