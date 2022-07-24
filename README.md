**News App**

Four page news list app.

Keywords

The first appearing screen is the splash screen. Asking to user push notification permission at splash.

The second screen is the list that includes the news from now to the past. I can able to fetching the data from Google News API and the data refresh by the pull to refresh.The list screen have a search and filter which can work at the same time. I can able to search by text and filter by date range such as from 01/01/2022 to 30/01/2022. The search work with the API, not locale.

By tapping one of the news, the news detail screen appear. I can able to add the news to the favorites via a button.

The last screen is the favorites that have the favorite news. Opening via Safari when a favorited news is tapped.

**Goals**

Learn asking permission.

Learn how to use closures.

Understand MVVM by separating logic between controller and view model.

Integrate third-party library.

Build UI programmatically in controller.

Use UserDefaults.

Integrate generic network layer by Alamofire.

Use model(such as News) with Codable.

Understand localization.

Write unit test.

**Architecture**
MVVM.
Use closures to communicate between controller and view model.
Build a generic network layer combined with Alamofire.
Use protocols to pass the data from the network layer to the screen.

**Language / Framework**
Swift with UIKit.
Responsive Design.
SnapKit integrated to build UI programmatically. 
Table view for the list screen.
Download news images via Kingfisher.

**Keywords**
MVVM.
Table view.
Codable.
SPM.
SnapKit.
Kingfisher.
Generic network layer.
Alamofire.
UserDefaults.
Localization.
Unit test.
Closure.
