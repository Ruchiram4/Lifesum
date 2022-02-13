# Lifesum
Lifesum iOS app

A demo project displaying the usage of MVVM architecture which integrates with the LifeSum API.

Each time the user shakes the device, a random integer in the range of [1, 200] is generated and the respective food item is requested from the API.

Once the food item details are downloaded, the app displays them on the main view.

Lottie library has been used to display a loading indicator when the app downloads data.

The app also uses Core Data to store the last downloaded food item. The last downloaded food item details would be displayed to the user while the app downloads new content.

![Screen Shot 2022-02-13 at 10 26 27 AM](https://user-images.githubusercontent.com/23075032/153739311-b468e51b-8a99-4595-b558-b96da9be5452.png)
