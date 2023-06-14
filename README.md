# DeezerAPI-App

The purpose of this application is to regularly display song and album data obtained from the Deezer API.

The application consists of 2 tab bars and a total of 5 pages.

* The first page provides information about the types of songs available.
* The second page lists the artists who create that type of song.
* The third page displays albums by the selected artist.
* On the fourth page, the songs within the selected album are listed.
* Each cell on this page has a like button. When the like button is pressed, the song data is saved to Core Data and added to the favorites section.

Additionally, when a cell is pressed, a 30-second preview of the song is played.

## Features:

* MVVM Design Pattern: 

The application follows the Model-View-ViewModel design pattern for a structured and organized architecture.
* Programmatic Layout: 

The user interface is built programmatically, ensuring flexibility and control over the layout.
* UICollectionView: 

The collection view is used to display the lists of songs, artists, albums, and favorites.
* Custom CollectionView Cell: 

Customized collection view cells are implemented to achieve a unique and visually appealing design.
* Protocols: 

Protocols are utilized for delegation and communication between different components of the application.
* AVFoundation: 

The AVFoundation framework is used to play the 30-second preview of the songs.
* CoreData: 

CoreData is employed to save and manage the liked songs data, allowing users to access their favorites anytime.
* Alamofire: 

Alamofire library is utilized to handle API requests and retrieve song and album data from the Deezer API.
* SnapKit: 

SnapKit is a popular library for programmatic constraints, providing an intuitive and concise way to define UI layouts.
* KingFisher: 

KingFisher library simplifies the process of downloading and caching images from the web, enhancing the performance of displaying album cover arts.
* JGProgressHUD: 

JGProgressHUD is a lightweight and customizable progress HUD used to indicate loading states or operations in the application.
