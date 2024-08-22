# Getting started :
- Clone this repo 
    
    ```
    git clone https://github.com/okto-hq/okto-sdk-flutter-starter-repo.git
    ```

- Open the terminal at the project root and run 

    ```
    flutter pub get
    ```

- Do google authentication setup on google cloud console using this [guide](https://sdk-docs.okto.tech/guide/google-authentication-setup)


## Android Setup
- Open `android/app/src/res/values/strings.xml`

    Put your Webclient Id here
    ```
    <?xml version="1.0" encoding="utf-8"?>
    <resources>
	<string name="default_web_client_id">YOUR_WEB_CLIENT_ID</string>
    </resources>
    ```

## IOS Setup
- Create ios app in your Google Cloud using your iOS app bundle id, you can get it either from xcode or `info.plist` file
- Download plist file from Google Cloud for iOS.
- Rename it to GoogleService-Info.plist
- Paste it inside `ios/Runner` directory.
- Copy your `Client ID` and `iOS URL scheme` from Google Cloud
- Open your info.plist file, present inside `ios/Runner`
- And Paste your Client ID and iOS URL Scheme.
- `flutter build ios`
- And you are all set!.

- Open `lib/okto.dart`
    - Put your client (non s2s api key) here  

    ```
    final okto = Okto('apiKey', BuildType.sandbox);
    ```

    - There are 3 buildtypes provided by okto wallet :
        1. Sandbox
        2. Staging
        3. Production


For more information have a look at our docs : [Docs](https://sdk-docs.okto.tech/) 
        