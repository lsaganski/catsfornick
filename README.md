# Cats For Nick

An iOS project, implemented with SwiftUI, which lists cat's images from an API and provides detailed information about each cat listed.
This project was built as a test for job interview purposes.

Details:
- This project doesn't have any dependencies, setups or special requirements. 
- Designed for iOS 17.5, but it can run under iOS 16+.
- Architecture used was MVVM.
- Design patterns used: singleton, environment objects, dependency injection, generics, abstraction by protocols.
- Tested in simulators and devices.
- Unit and UI testing implemented for the list viewmodel.
- Reuse of components, UI and project structure organized.
- Performance improved with downloaded image caching.

Description:
This app retrieves an array of images of cats and detail information about each cat, from https://thecatapi.com/ API. 
Then a list is displayed, with an image, name and origin for each cat. 
The list present 20 cats for request. Scrolling until the end, a new array is requested with the next 20 cats, using a pagination feature.
Images are downloaded asyncronously and stored in a local cache. The array of cats is downloaded asyncronously as well.
Since a cell os tapped, a popup is displayed with more information about the selected cat.

About tests: 
- A unit test which retrieves the cat list, from mocked array stored in a JSON file, checking if the available information is the expected one.
- A UI test, which retrieves the information from server, wait for the list, tap the first cell and check if the detail page opens.
