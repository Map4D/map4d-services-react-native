import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-map4d-services' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const Map4dServices = NativeModules.Map4dServices
  ? NativeModules.Map4dServices
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export type MFLocationComponent = {
  latitude: number,
  longitude: number,
  alias?: string,
}

export type MFViewboxComponent = {
  southwest: MFLocationComponent,
  northeast: MFLocationComponent,
}

export enum MFTravelMode {
  car = 'car',
  bike = 'bike',
  foot = 'foot',
  motorcycle = 'motorcycle',
}

export enum MFRouteWeighting {
  shortest = 'shortest',
  fastest = 'fastest',
  balance = 'balance',
}

export enum MFLanguageResult {
  en = 'en',
  vi = 'vi',
}

export enum MFRouteType {
  motorway = 'motorway',
  trunk = 'trunk',
  ferry = 'ferry',
  bridge = 'bridge',
  tunnel = 'tunnel',
}

export type MFRouteRestriction = {
  location?: MFLocationComponent,
  radius?: number,
  viewbox?: MFViewboxComponent,
  path?: MFLocationComponent[],
  types?: MFRouteType[] | string[]
}

export type MFSuggestionParams = {
  text: string,
  location?: MFLocationComponent,
  acronym?: boolean,
}

export type MFTextSearchParams = {
  text: string,
  types?: string[],
  datetime?: number,
  location?: MFLocationComponent,
}

export type MFNearbySearchParams = {
  location: MFLocationComponent,
  radius: number,
  text?: string,
  types?: string[],
  tags?: string[],
  datetime?: number,
}

export type MFViewboxSearchParams = {
  viewbox: MFViewboxComponent,
  text?: string,
  types?: string[],
  tags?: string[],
  datetime?: number,
}

export type MFGeocodeParams = {
  location?: MFLocationComponent,
  address?: string,
  viewbox?: MFViewboxComponent,
}

export type MFDirectionsParams = {
  origin: MFLocationComponent,
  destination: MFLocationComponent,
  waypoints?: MFLocationComponent[],
  mode?: MFTravelMode | string,
  weighting?: MFRouteWeighting | string,
  language?: MFLanguageResult | string,
  restriction?: MFRouteRestriction,
}

export type MFDistanceMatrixParams = {
  origins: MFLocationComponent[],
  destinations: MFLocationComponent[],
  mode?: MFTravelMode | string,
  weighting?: MFRouteWeighting | string,
  language?: MFLanguageResult | string,
  restriction?: MFRouteRestriction,
}

type MFServiceResponse<T> = {
  code: string,
  message?: string,
  result?: T
}

/* Place | Suggestions */

export type MFSuggestionResult = Array<{
  id?: string
  name?: string
  address?: string
  distance?: number
  location?: { lat: number, lng: number }
  types?: string[]
  [_: string]: unknown
}>
export type MFSuggestionResponse = MFServiceResponse<MFSuggestionResult>

export async function fetchSuggestion(params: MFSuggestionParams): Promise<MFSuggestionResponse> {
  return Map4dServices.fetchSuggestion(params);
}

/* Place | Detail */

export type MFPlaceDetailResult = {
  id?: string
  name?: string
  description?: string
  address?: string
  addressComponents?: Array<any>
  distance?: number
  location?: { lat: number, lng: number }
  types?: string[]
  tags?: string[]
  photos?: Array<any>
  metadata?: Array<any>
  [_: string]: unknown
}
export type MFPlaceDetailResponse = MFServiceResponse<MFPlaceDetailResult>

export async function fetchPlaceDetail(placeId: string): Promise<MFPlaceDetailResponse> {
  return Map4dServices.fetchPlaceDetail(placeId);
}

/* Place | Text search */

export type MFTextSearchResult = Array<{
  id?: string
  name?: string
  address?: string
  distance?: number
  location?: { lat: number, lng: number }
  types?: string[]
  [_: string]: unknown
}>
export type MFTextSearchResponse = MFServiceResponse<MFTextSearchResult>

export async function fetchTextSearch(params: MFTextSearchParams): Promise<MFTextSearchResponse> {
  return Map4dServices.fetchTextSearch(params);
}

/* Place | Nearby search */

export type MFNearbySearchResult = Array<{
  id?: string
  name?: string
  address?: string
  distance?: number
  location?: { lat: number, lng: number }
  types?: string[]
  [_: string]: unknown
}>
export type MFNearbySearchResponse = MFServiceResponse<MFNearbySearchResult>

export async function fetchNearbySearch(params: MFNearbySearchParams): Promise<MFNearbySearchResponse> {
  return Map4dServices.fetchNearbySearch(params);
}

/* Place | Viewbox search */

export type MFViewboxSearchResult = Array<{
  id?: string
  name?: string
  address?: string
  distance?: number
  location?: { lat: number, lng: number }
  types?: string[]
  [_: string]: unknown
}>
export type MFViewboxSearchResponse = MFServiceResponse<MFViewboxSearchResult>

export async function fetchViewboxSearch(params: MFViewboxSearchParams): Promise<MFViewboxSearchResponse> {
  return Map4dServices.fetchViewboxSearch(params);
}

/* Place | Geocode */

export type MFGeocodeResult = Array<{
  id?: string
  name?: string
  address?: string
  distance?: number
  location?: { lat: number, lng: number }
  types?: string[]
  addressComponents?: Array<any>
  [_: string]: unknown
}>
export type MFGeocodeResponse = MFServiceResponse<MFGeocodeResult>

export async function fetchGeocode(params: MFGeocodeParams): Promise<MFGeocodeResponse> {
  return Map4dServices.fetchGeocode(params);
}

/* Route | Directions */

export type MFDirectionsResult = {
  routes?: Array<{
    summary?: string
    overviewPolyline?: string
    distance?: { [key: string]: any }
    duration?: { [key: string]: any }
    legs?: Array<{ [key: string]: any }>
    snappedWaypoints?: Array<{ lat: number, lng: number }>
    [_: string]: unknown
  }>
  [_: string]: unknown
}
export type MFDirectionsResponse = MFServiceResponse<MFDirectionsResult>

export async function fetchDirections(params: MFDirectionsParams): Promise<MFDirectionsResponse> {
  return Map4dServices.fetchDirections(params);
}

/* Route | Distance matrix */

export type MFDistanceMatrixResult = {
  originAddresses?: string[],
  destinationAddresses?: string[],
  routeRows: Array<{
    elements: Array<{ [key:string]: any }>
  }>
  [_: string]: unknown
}
export type MFDistanceMatrixResponse = MFServiceResponse<MFDistanceMatrixResult>

export async function fetchDistanceMatrix(params: MFDistanceMatrixParams): Promise<MFDistanceMatrixResponse> {
  return Map4dServices.fetchDistanceMatrix(params);
}
