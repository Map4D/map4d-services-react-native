//
//  SRequest.m
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#import "SRequest.h"
#import "RCTConvert+Services.h"

@implementation SRequest

#pragma mark - Geocode

+ (MFServiceRequest *)buildGeocodingRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/v2/geocode"];
  MFGeocodeParams *params = [[MFGeocodeParams alloc] initWithAddress:data[@"address"]];
  params.location = [RCTConvert MFLocationComponent:data[@"location"]];
  params.viewbox = [RCTConvert MFViewboxComponent:data[@"viewbox"]];
  
  request.params = params;
  return request;
}

#pragma mark - Place

+ (MFServiceRequest *)buildPlaceDetailRequestWithId:(NSString *)placeId {
  NSString *path = [@"/sdk/place/detail/" stringByAppendingString:placeId];
  return [[MFServiceRequest alloc] initWithPath:path];
}

+ (MFServiceRequest *)buildTextSearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/text-search"];
  MFTextSearchParams *params = [[MFTextSearchParams alloc] initWithText:data[@"text"]];
  
  params.types = data[@"types"];
  params.location = [RCTConvert MFLocationComponent:data[@"location"]];
  params.datetime = [RCTConvert NSDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildNearbySearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/nearby-search"];
  MFNearbySearchParams *params = [[MFNearbySearchParams alloc] initWithLocation:[RCTConvert MFLocationComponent:data[@"location"]]
                                                                         radius:[RCTConvert NSUInteger:data[@"radius"]]
                                                                           text:data[@"text"]];
  params.types = data[@"types"];
  params.tags = data[@"tags"];
  params.datetime = [RCTConvert NSDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildViewboxSearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/viewbox-search"];
  MFViewboxSearchParams *params = [[MFViewboxSearchParams alloc] initWithViewbox:[RCTConvert MFViewboxComponent:data[@"viewbox"]]
                                                                            text:data[@"text"]];
  params.types = data[@"types"];
  params.tags = data[@"tags"];
  params.datetime = [RCTConvert NSDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildSuggestionsRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/autosuggest"];
  MFSuggestionParams *params = [[MFSuggestionParams alloc] initWithText:data[@"text"]];
  params.acronym = [RCTConvert BOOL:data[@"acronym"]];
  params.location = [RCTConvert MFLocationComponent:data[@"location"]];
  
  request.params = params;
  return request;
}

#pragma mark - Route

+ (MFServiceRequest *)buildDirectionsRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route"];
  
  MFLocationComponent *origin = [RCTConvert MFLocationComponent:data[@"origin"]];
  MFLocationComponent *destination = [RCTConvert MFLocationComponent:data[@"destination"]];
  MFDirectionsParams *params = [[MFDirectionsParams alloc] initWithOrigin:origin destination:destination];
  params.waypoints = [RCTConvert MFLocationComponentArray:data[@"points"]];
  params.mode = [RCTConvert MFTravelMode:data[@"mode"]];
  params.language = [RCTConvert MFLanguageResult:data[@"language"]];
  params.weighting = [RCTConvert MFRouteWeighting:data[@"weighting"]];
  params.avoid = [RCTConvert MFRouteRestriction:data[@"avoid"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildRouteETARequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route/eta"];
  
  NSArray<MFLocationComponent *> *origins = [RCTConvert MFLocationComponentArray:data[@"origins"]];
  MFLocationComponent *destination = [RCTConvert MFLocationComponent:data[@"destination"]];
  MFRouteETAParams *params = [[MFRouteETAParams alloc] initWithOrigins:origins destination:destination];
  params.mode = [RCTConvert MFTravelMode:data[@"mode"]];
  params.language = [RCTConvert MFLanguageResult:data[@"language"]];
  params.weighting = [RCTConvert MFRouteWeighting:data[@"weighting"]];
  params.avoid = [RCTConvert MFRouteRestriction:data[@"avoid"]];
  
  request.params = params;
  request.method = MFRequestMethodPost;
  return request;
}

+ (MFServiceRequest *)buildDistanceMatrixRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route/matrix"];
  
  NSArray<MFLocationComponent *> *origins = [RCTConvert MFLocationComponentArray:data[@"origins"]];
  NSArray<MFLocationComponent *> *destinations = [RCTConvert MFLocationComponentArray:data[@"destinations"]];
  MFDistanceMatrixParams *params = [[MFDistanceMatrixParams alloc] initWithOrigins:origins destinations:destinations];
  params.mode = [RCTConvert MFTravelMode:data[@"mode"]];
  params.language = [RCTConvert MFLanguageResult:data[@"language"]];
  params.weighting = [RCTConvert MFRouteWeighting:data[@"weighting"]];
  params.avoid = [RCTConvert MFRouteRestriction:data[@"avoid"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildGraphRouteRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route/graph"];
  
  NSArray<MFLocationComponent *> *points = [RCTConvert MFLocationComponentArray:data[@"points"]];
  MFGraphRouteParams *params = [[MFGraphRouteParams alloc] initWithLocations:points];
  params.mode = [RCTConvert MFTravelMode:data[@"mode"]];
  params.language = [RCTConvert MFLanguageResult:data[@"language"]];
  params.weighting = [RCTConvert MFRouteWeighting:data[@"weighting"]];
  params.avoid = [RCTConvert MFRouteRestriction:data[@"avoid"]];
  
  request.params = params;
  return request;
}

@end

