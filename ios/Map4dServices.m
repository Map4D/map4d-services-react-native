#import "Map4dServices.h"
#import "SRequest.h"
#import "SClient.h"

@implementation Map4dServices

RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject) {
  // NSNumber *result = @([a floatValue] * [b floatValue]);
  // [MFServices provideServicesAccessKey:@""];//TODO: check
  resolve(MFServices.version);
}

RCT_EXPORT_METHOD(fetchSuggestion:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildSuggestionsRequestWithData:params] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchPlaceDetail:(NSString *)placeId
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildPlaceDetailRequestWithId:placeId] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchTextSearch:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildTextSearchRequestWithData:params] resolve:resolve reject:reject];
}


RCT_EXPORT_METHOD(fetchNearbySearch:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildNearbySearchRequestWithData:params] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchViewboxSearch:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildViewboxSearchRequestWithData:params] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchGeocode:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildGeocodingRequestWithData:params] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchDirections:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildDirectionsRequestWithData:params] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchRouteETA:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildRouteETARequestWithData:params] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchDistanceMatrix:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildDistanceMatrixRequestWithData:params] resolve:resolve reject:reject];
}

RCT_EXPORT_METHOD(fetchGraphRoute:(id)params
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject) {
  [SClient fireRequest:[SRequest buildGraphRouteRequestWithData:params] resolve:resolve reject:reject];
}

@end
