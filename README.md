# Travel Companion App

## Overview
Travel Companion is an iOS application designed to help users discover and book travel destinations. With an easy-to-navigate interface, users can explore various destinations, compare them, and book their next great adventure.

## Features
- **Explore Destinations**: Users can browse through a curated list of destinations.
- **Search Functionality**: Find destinations easily with a search feature.

## Installation
To run the Travel Companion app, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the application on your device or in the simulator.

## Requirements
- iOS 13.0+
- Xcode 11+
- Swift 5+

## Usage
Upon launching the app, you will be greeted with a list of travel destinations. You can scroll through the list or use the search bar to find a specific place. Selecting a destination will give you more information and the option to book your trip.

## Custom Views
- **GradientView**: A customizable UIView with a gradient layer, used in destination cells for a visually appealing overlay effect.
- **DestinationCell**: A UICollectionViewCell that displays destination information with an image and a gradient overlay.

## Code Snippets
Here is a snippet of adding a gradient overlay to an image view:

```swift
private func setupGradientLayer() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = imageView.bounds
    imageView.layer.insertSublayer(gradientLayer, at: 0)
}
