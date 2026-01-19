import * as React from 'react';
import { StyleSheet, View, Text, FlatList } from 'react-native';
import {
  fetchSuggestion,
  fetchPlaceDetail,
  fetchTextSearch,
  fetchNearbySearch,
  fetchViewboxSearch,
  fetchGeocode,
  fetchDirections,
  fetchDistanceMatrix,
  MFTravelMode,
  MFSuggestionResponse
} from 'react-native-map4d-services';

export default function App() {

  const DATA = [
    {
      title: 'Suggestion',
      onPress: () => {
        fetchSuggestion({
          text: 'abc',
          acronym: true,
          location: {
            latitude: 16.036461,
            longitude: 108.218159
          }
        }).then((response: MFSuggestionResponse) => {
          if (response.code == 'ok') {
            console.log('Suggestions:', response.result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        });
      },
    },
    {
      title: 'Place Detail',
      onPress: () => {
        fetchPlaceDetail('65825e663a3b1963a64bb50c').then(response => {
          if (response.code == 'ok') {
            console.log('Place Detail:', response.result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        });
      },
    },
    {
      title: 'Text Search',
      onPress: () => {
        let date = new Date();
        fetchTextSearch({
          text: 'abc',
          // types: ['atm', 'hotel'],
          location: {
            latitude: 16.036461,
            longitude: 108.218159
          },
          datetime: date.getTime()
        }).then(response => {
          if (response.code == 'ok') {
            console.log('Text Search Results:', response.result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        })
      },
    },
    {
      title: 'Nearby Search',
      onPress: () => {
        fetchNearbySearch({
          location: {
            latitude: 16.036461,
            longitude: 108.218159,
          },
          radius: 500,
          text: 'abc',
        }).then(response => {
          if (response.code == 'ok') {
            console.log('Nearby Search Results:', response.result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        });
      }
    },
    {
      title: 'Viewbox Search',
      onPress: () => {
        fetchViewboxSearch({
          viewbox: {
            southwest: { latitude: 16.056453967981348, longitude: 108.19387435913086 },
            northeast: { latitude: 16.093031550262133, longitude: 108.25927734375 },
          },
          text: 'abc',
        }).then(response => {
          if (response.code == 'ok') {
            console.log('Viewbox Search Results:', response.result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        })
      }
    },
    {
      title: 'Geocode',
      onPress: () => {
        fetchGeocode({
          address: '31 Lê Văn Duyệt, Phường Nại Hiên Đông, Quận Sơn Trà, Thành Phố Đà Nẵng',
        }).then(response => {
          if (response.code == 'ok') {
            console.log('Geocode Results:', response.result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        })
      }
    },
    {
      title: 'Directions',
      onPress: () => {
        fetchDirections({
          origin: { latitude: 16.024634, longitude: 108.209217 },
          destination: { latitude: 16.020179, longitude: 108.211212 },
          mode: MFTravelMode.car,
          weighting: 'shortest',
          language: 'vi',
          waypoints: [
            { latitude: 16.024634, longitude: 108.211212 }
          ],
          restriction: {
            location: { latitude: 16.024634, longitude: 108.209217 },
            radius: 30,
            // viewbox: {
            //   southwest: { latitude: 16.056453967981348, longitude: 108.19387435913086 },
            //   northeast: { latitude: 16.093031550262133, longitude: 108.25927734375 },
            // },
            // path: [
            //   { latitude: 16.024634, longitude: 108.209217 },
            //   { latitude: 16.024834, longitude: 108.209217 }
            // ],
            types: ['motorway']
          }
        }).then(response => {
          if (response.code == 'ok') {
            const result = response.result
            console.log('Directions Result:', result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        })
      }
    },
    {
      title: 'Distance Matrix',
      onPress: () => {
        fetchDistanceMatrix({
          origins: [
            { latitude: 16.024634, longitude: 108.209217 },
            { latitude: 16.071766, longitude: 108.223615 },
          ],
          destinations: [
            { latitude: 16.020179, longitude: 108.211212 },
            { latitude: 16.061040, longitude: 108.216700 },
            { latitude: 16.059145, longitude: 108.221297 }
          ]
        }).then(response => {
          if (response.code == 'ok') {
            console.log('Distance Matrix Result:', response.result)
          }
          else {
            console.log(`Error code: ${response.code}, message: ${response.message}`);
          }
        })
      }
    },
  ];

  return (
    <View style={styles.container}>
      <View style={{height: 100}}>
        <Text>Map4dServices React Native</Text>
      </View>
      <FlatList
        data={DATA}
        renderItem={({item}) => <Text style={styles.item} onPress={item.onPress} >{item.title}</Text>}
        keyExtractor={(_item, index) => index.toString()}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  item: {
    padding: 16,
    fontSize: 22,
    height: 60,
  },
});
