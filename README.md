# react-native-map4d-services

React Native Map4dServices for iOS + Android

## Installation

```sh
npm install react-native-map4d-services
```

## Usage

E.g. Auto Suggest

```js
import { fetchSuggestion } from "react-native-map4d-services";

// ...

fetchSuggestion({text: 'abc'})
.then(result => {
  console.log('Suggestion:', result);
})
```
