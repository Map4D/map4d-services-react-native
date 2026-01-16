import { TurboModuleRegistry, type TurboModule } from 'react-native';

export interface Spec extends TurboModule {
  fetchSuggestion(params: Object): Promise<Object>;
  fetchPlaceDetail(placeId: string): Promise<Object>;
  fetchTextSearch(params: Object): Promise<Object>;
  fetchNearbySearch(params: Object): Promise<Object>;
  fetchViewboxSearch(params: Object): Promise<Object>
  fetchGeocode(params: Object): Promise<Object>;
  fetchDirections(params: Object): Promise<Object>;
  fetchDistanceMatrix(params: Object): Promise<Object>;
}

export default TurboModuleRegistry.getEnforcing<Spec>('Map4dServicesReactNative');
