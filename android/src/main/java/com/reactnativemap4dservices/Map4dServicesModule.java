package com.reactnativemap4dservices;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.module.annotations.ReactModule;

import vn.map4d.services.MFServicesOptions;

@ReactModule(name = Map4dServicesModule.NAME)
public class Map4dServicesModule extends ReactContextBaseJavaModule {
  public static final String NAME = "Map4dServices";

  private MFServicesOptions servicesOptions;

  public Map4dServicesModule(ReactApplicationContext reactContext) {
    super(reactContext);
    servicesOptions = new MFServicesOptions.Builder(reactContext).build();
  }

  @Override
  @NonNull
  public String getName() {
    return NAME;
  }

  /* Place | Suggestions */
  @ReactMethod
  public void fetchSuggestion(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildSuggestionsRequestWithData(params), promise);
  }

  /* Place | Detail */
  @ReactMethod
  public void fetchPlaceDetail(String placeId, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildPlaceDetailRequestWithId(placeId), promise);
  }

  /* Place | Text search */
  @ReactMethod
  public void fetchTextSearch(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildTextSearchRequestWithData(params), promise);
  }

  /* Place | Nearby search */
  @ReactMethod
  public void fetchNearbySearch(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildNearbySearchRequestWithData(params), promise);
  }

  /* Place | Viewbox search */
  @ReactMethod
  public void fetchViewboxSearch(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildViewboxSearchRequestWithData(params), promise);
  }

  /* Place | Geocode */
  @ReactMethod
  public void fetchGeocode(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildGeocodingRequestWithData(params), promise);
  }

  /* Route | Directions */
  @ReactMethod
  public void fetchDirections(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildDirectionsRequestWithData(params), promise);
  }

  /* Route | ETA */
  @ReactMethod
  public void fetchRouteETA(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildRouteETARequestWithData(params), promise);
  }

  /* Route | Distance matrix */
  @ReactMethod
  public void fetchDistanceMatrix(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildDistanceMatrixRequestWithData(params), promise);
  }

  /* Route | Graph route */
  @ReactMethod
  public void fetchGraphRoute(ReadableMap params, @NonNull Promise promise) {
    SClient.fireRequest(servicesOptions, SRequest.buildGraphRouteRequestWithData(params), promise);
  }

}
