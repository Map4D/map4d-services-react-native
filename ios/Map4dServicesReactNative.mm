#import "Map4dServicesReactNative.h"
#import "SClient.h"
#import "SRequest.h"

@implementation Map4dServicesReactNative

+ (NSString *)moduleName {
  return @"Map4dServicesReactNative";
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule: (const facebook::react::ObjCTurboModule::InitParams &)params   {
    return std::make_shared<facebook::react::NativeMap4dServicesReactNativeSpecJSI>(params);
}

/* Place | Suggestions */
- (void)fetchSuggestion:(id)params
                resolve:(RCTPromiseResolveBlock)resolve
                 reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildSuggestionsRequestWithData:params] resolve:resolve reject:reject];
}

/* Place | Detail */
- (void)fetchPlaceDetail:(NSString *)placeId
                 resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildPlaceDetailRequestWithId:placeId] resolve:resolve reject:reject];
}

/* Place | Text search */
- (void)fetchTextSearch:(id)params
                resolve:(RCTPromiseResolveBlock)resolve
                 reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildTextSearchRequestWithData:params] resolve:resolve reject:reject];
}

/* Place | Nearby search */
- (void)fetchNearbySearch:(id)params
                  resolve:(RCTPromiseResolveBlock)resolve
                   reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildNearbySearchRequestWithData:params] resolve:resolve reject:reject];
}

/* Place | Viewbox search */
- (void)fetchViewboxSearch:(id)params
                   resolve:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildViewboxSearchRequestWithData:params] resolve:resolve reject:reject];
}

/* Place | Geocode */
- (void)fetchGeocode:(id)params
             resolve:(RCTPromiseResolveBlock)resolve
              reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildGeocodingRequestWithData:params] resolve:resolve reject:reject];
}

/* Route | Directions */
- (void)fetchDirections:(id)params
                resolve:(RCTPromiseResolveBlock)resolve
                 reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildDirectionsRequestWithData:params] resolve:resolve reject:reject];
}

/* Route | Distance matrix */
- (void)fetchDistanceMatrix:(id)params
                    resolve:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject {
  [SClient fireRequest:[SRequest buildDistanceMatrixRequestWithData:params] resolve:resolve reject:reject];
}

@end
