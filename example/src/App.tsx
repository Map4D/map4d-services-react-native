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
  fetchRouteETA,
  fetchDistanceMatrix,
  fetchGraphRoute,
  MFTravelMode
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
        }).then(result => {
          console.log('Suggestion:', result);
        });
      },
    },
    {
      title: 'Place Detail',
      onPress: () => {
        fetchPlaceDetail('60dd389ef81cb14bc889d971').then(result => {
          console.log('Place Detail:', result);
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
        }).then(result => {
          console.log('Text Search:', result);
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
        }).then(result => {
          console.log('Nearby Search:', result);
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
        }).then(result => {
          console.log('Viewbox Search:', result)
        })
      }
    },
    {
      title: 'Geocode',
      onPress: () => {
        fetchGeocode({
          address: '31 Lê Văn Duyệt, Phường Nại Hiên Đông, Quận Sơn Trà, Thành Phố Đà Nẵng',
        }).then(result => {
          console.log('Geocode:', result)
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
        }).then(result => {
          console.log('Directions:', result)
        })
      }
    },
    {
      title: 'Route ETA',
      onPress: () => {
        fetchRouteETA({
          origins: [
            { latitude: 16.024634, longitude: 108.209217, alias: "A" },
            { latitude: 16.039173, longitude: 108.210912, alias: "B" },
          ],
          destination: { latitude: 16.020179, longitude: 108.211212 },
          mode: MFTravelMode.car
        }).then(result => {
          console.log('Route ETA:', result)
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
        }).then(result => {
          console.log('Distance Matrix:', result)
        })
      }
    },
    {
      title: 'Graph Route',
      onPress: () => {
        fetchGraphRoute({
          locations: [
            { latitude: 16.039173, longitude: 108.210912 },
            { latitude: 16.044597, longitude: 108.217263 },
            { latitude: 16.082598, longitude: 108.221989 },
          ],
          mode: MFTravelMode.car
        }).then(result => {
          console.log('Graph Route:', result)
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
