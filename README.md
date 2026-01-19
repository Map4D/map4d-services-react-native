# react-native-map4d-services

React Native Map4dServices for iOS + Android

## Installation

```sh
npm install react-native-map4d-services
```

## Setup API key

The API key is a unique identifier that authenticates requests associated with your project for usage and billing purposes. You must have at least one API key associated with your project.

Get an API key at <https://map.map4d.vn/user> > Developer > Key

### Android

Provide access key from `android/app/src/main/AndroidManifest.xml`

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application>
        <meta-data
            android:name="vn.map4d.services.ACCESS_KEY"
            android:value="YOUR_SERVICES_ACCESS_KEY"/>
    </application>
</manifest>
```

### iOS

Provide access key from `ios/Runner/Info.plist`

```xml
<key>Map4dServicesAccessKey</key>
<string>YOUR_SERVICES_ACCESS_KEY</string>
```

## Usage

E.g. Auto Suggest

```js
import { fetchSuggestion } from "react-native-map4d-services";

// ...

fetchSuggestion({text: 'abc'})
.then(response => {
  console.log('Suggestion:', response);
})
```
