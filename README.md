 Flutter Platform Integration Demo
 
This sample Flutter app showcases platform integration capabilities using method channel and event channel with native code. By using these channels, you can establish bi-directional communication between your Flutter app and the native platform, allowing you to leverage platform-specific features and functionality.

Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

Prerequisites
To run this Flutter app, make sure you have Flutter SDK installed on your machine. You can follow the official Flutter installation guide: Flutter Installation

Installation

flutter pub get
Running the App
Connect your device or emulator and run the app using the Flutter CLI:

flutter run
This will launch the app on your device/emulator, and you should be able to see the home screen with the platform integration examples.

Usage

The Flutter app provides two examples of platform integration using method channel and event channel:

Method Channel
The method channel allows your Flutter app to invoke methods from native code and receive results asynchronously.

In this demo app, you can tap the "Invoke Native Method" button, which triggers a method call to the native platform. The native platform executes the battery oercentage method and returns the result to the Flutter app.

Event Channel
The event channel enables your Flutter app to listen for events emitted by the native code.

In this demo app, which sets up an event stream from the native platform. The native platform emits events whenever changes happened in network state, which are then received by the Flutter app and displayed on the screen.

