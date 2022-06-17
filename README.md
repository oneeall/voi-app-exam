# mobile_app

A new Voila App v2 project.

# Getting Started

The Mobile Apps contains the minimal implementation.
to clone this repo make sure you have install flutter SDK

```
- Flutter - channel stable, 3.0.2 
```

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/machtwatch/voila-mobile.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses generator library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Dio Smart Retry](https://pub.dev/packages/dio_smart_retry)
* [Provider](https://github.com/rrousselGit/provider) (State Management)
* [Connectivity_plus](https://pub.dev/packages/connectivity_plus)
* [Logger](https://pub.dev/packages/logger)
* [Intl](https://pub.dev/packages/intl)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- generated/
|- l10n/
|- src/
    |- constants
    |- features
    |- network
    |- persistence
    |- routes
    |- ui
    |- utils
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- generated - Contains all generated flutter localizly
2- l10n - Contains files inlt for config intl languages.
3- src - The main sources project structure code
4- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, firebase analytics, firebase crashlytics, etc.
```
