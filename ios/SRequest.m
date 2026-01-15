//
//  SRequest.m
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#import "SRequest.h"
#import "SParamConvert.h"

@implementation SRequest

#pragma mark - Geocode

+ (MFServiceRequest *)buildGeocodingRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/v2/geocode"];
  MFGeocodeParams *params = [[MFGeocodeParams alloc] initWithAddress:data[@"address"]];
  params.location = [SParamConvert MFLocationComponent:data[@"location"]];
  params.viewbox = [SParamConvert MFViewboxComponent:data[@"viewbox"]];
  
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
  params.types = [SParamConvert NSStringArray:data[@"types"]];
  params.location = [SParamConvert MFLocationComponent:data[@"location"]];
  params.datetime = [SParamConvert NSDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildNearbySearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/nearby-search"];
  MFNearbySearchParams *params = [[MFNearbySearchParams alloc] initWithLocation:[SParamConvert MFLocationComponent:data[@"location"]]
                                                                         radius:[SParamConvert NSUInteger:data[@"radius"]]
                                                                           text:[SParamConvert NSString:data[@"text"]]];
  params.types = [SParamConvert NSStringArray:data[@"types"]];
  params.tags = [SParamConvert NSStringArray:data[@"tags"]];
  params.datetime = [SParamConvert NSDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildViewboxSearchRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/place/viewbox-search"];
  MFViewboxSearchParams *params = [[MFViewboxSearchParams alloc] initWithViewbox:[SParamConvert MFViewboxComponent:data[@"viewbox"]]
                                                                            text:[SParamConvert NSString:data[@"text"]]];
  params.types = [SParamConvert NSStringArray:data[@"types"]];
  params.tags = [SParamConvert NSStringArray:data[@"tags"]];
  params.datetime = [SParamConvert NSDate:data[@"datetime"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildSuggestionsRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/autosuggest"];
  MFSuggestionParams *params = [[MFSuggestionParams alloc] initWithText:[SParamConvert NSString:data[@"text"]]];
  params.location = [SParamConvert MFLocationComponent:data[@"location"]];
  params.acronym = [SParamConvert BOOL:data[@"acronym"] fallback:params.acronym];
  
  request.params = params;
  return request;
}

#pragma mark - Route

+ (MFServiceRequest *)buildDirectionsRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route"];
  
  MFLocationComponent *origin = [SParamConvert MFLocationComponent:data[@"origin"]];
  MFLocationComponent *destination = [SParamConvert MFLocationComponent:data[@"destination"]];
  MFDirectionsParams *params = [[MFDirectionsParams alloc] initWithOrigin:origin destination:destination];
  params.waypoints = [SParamConvert MFLocationComponentArray:data[@"waypoints"]];
  params.mode = [SParamConvert MFTravelMode:data[@"mode"] fallback:params.mode];
  params.language = [SParamConvert MFLanguageResult:data[@"language"] fallback:params.language];
  params.weighting = [SParamConvert MFRouteWeighting:data[@"weighting"] fallback:params.weighting];
  params.restriction = [SParamConvert MFRouteRestriction:data[@"restriction"]];
  
  request.params = params;
  return request;
}

+ (MFServiceRequest *)buildDistanceMatrixRequestWithData:(NSDictionary *)data {
  MFServiceRequest *request = [[MFServiceRequest alloc] initWithPath:@"/sdk/route/matrix"];
  
  NSArray<MFLocationComponent *> *origins = [SParamConvert MFLocationComponentArray:data[@"origins"]];
  NSArray<MFLocationComponent *> *destinations = [SParamConvert MFLocationComponentArray:data[@"destinations"]];
  MFDistanceMatrixParams *params = [[MFDistanceMatrixParams alloc] initWithOrigins:origins destinations:destinations];
  params.mode = [SParamConvert MFTravelMode:data[@"mode"] fallback:params.mode];
  params.language = [SParamConvert MFLanguageResult:data[@"language"] fallback:params.language];
  params.weighting = [SParamConvert MFRouteWeighting:data[@"weighting"] fallback:params.weighting];
  params.restriction = [SParamConvert MFRouteRestriction:data[@"restriction"]];
  
  request.params = params;
  return request;
}

@end

