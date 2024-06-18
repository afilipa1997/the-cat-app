# the-cat-app

The Cats app is an iOS app that displays a list of cat breeds along with their images. Users can mark their favorite breeds.

**Disclaimer:** This app was done on a challenge context. And i took it as that. This was my first contact with SwiftUI and its architecture, and although there were some challanges requirements that were not addressed, and for that the challenge may not be accepted, i did a lot of research and learn a lot regarding this new way of building UI. 

## Features
- Display a list of cat breeds with images.
- Mark breeds as favorites.
- Persist favorite breeds using Core Data.
- Asynchronous data fetching.

## Architecture
The app follows the MVVM (Model-View-ViewModel) architecture pattern

## UI Development
The app uses SwiftUI for UI development.

## Core Data
Core Data is used to store the cat breeds and their favorite status locally. This ensures that users' preferences are saved even when the app is closed or restarted.

## Known Issues
- **Cancelled Images download:** In some specific scenarios the download of the images may be canceled. I suspect that this may be due to some task/async management issues.

## How to Run the Project
1. Clone the repository.
   ```sh
   git clone https://github.com/afilipa1997/the-cat-app.git

2.
   ```sh
   open Cat.xcodeproj

3.
   Make sure you are on the main branch

4.
   Build and run the project on a simulator or a physical device.
