//
//  RCTConvert+Services.m
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#import <React/RCTConvert+CoreLocation.h>
#import "RCTConvert+Services.h"

@implementation RCTConvert (Services)

+ (MFLocationComponent *)MFLocationComponent:(id)json {
  if (json == nil) {
    return nil;
  }
  CLLocationCoordinate2D coordinate = [RCTConvert CLLocationCoordinate2D:json];
  return [[MFLocationComponent alloc] initWithCoordinate:coordinate alias:json[@"alias"]];
}

RCT_ARRAY_CONVERTER(MFLocationComponent);

+ (MFViewboxComponent *)MFViewboxComponent:(id)json {
  if (json == nil) {
    return nil;
  }

  MFLocationComponent *southwest = [RCTConvert MFLocationComponent:json[@"southwest"]];
  MFLocationComponent *northeast = [RCTConvert MFLocationComponent:json[@"northeast"]];
  return [[MFViewboxComponent alloc] initWithSouthwest:southwest.coordinate northeast:northeast.coordinate];
}

+ (MFRouteRestriction *)MFRouteRestriction:(id)json {
  if (json == nil) {
    return nil;
  }
  
  MFLocationComponent *location = [RCTConvert MFLocationComponent:json[@"location"]];
  NSUInteger radius = json[@"radius"] != nil ? [RCTConvert NSUInteger:json[@"radius"]] : 0;
  MFViewboxComponent *viewbox = [RCTConvert MFViewboxComponent:json[@"viewbox"]];
  NSArray<MFLocationComponent *> *path = [RCTConvert MFLocationComponentArray:json[@"path"]];
  NSArray<NSString *> *types = [RCTConvert NSStringArray:json[@"types"]];
  
  MFRouteRestriction *result = nil;
    if (location != nil) {
      result = [[MFRouteRestriction alloc] initWithLocation:location radius:radius];
    }
    else if (viewbox != nil) {
      result = [[MFRouteRestriction alloc] initWithViewbox:viewbox];
    }
    else if (path != nil) {
      result = [[MFRouteRestriction alloc] initWithPath:path];
    }
    
    if (types != nil && types.count > 0) {
      if (result != nil) {
        for (NSUInteger i = 0; i < types.count; i++) {
          if ([RCTConvert isMFRouteType:types[i]]) {
            [result avoidRouteType:[RCTConvert MFRouteType:types[i]]];
          }
        }
      }
      else {
        result = [[MFRouteRestriction alloc] initWithRouteType:[RCTConvert MFRouteType:types[0]]];
        for (NSUInteger i = 1; i < types.count; i++) {
          if ([RCTConvert isMFRouteType:types[i]]) {
            [result avoidRouteType:[RCTConvert MFRouteType:types[i]]];
          }
        }
      }
    }
    
    return result;
  
}

+ (MFTravelMode)MFTravelMode:(id)json {
  NSString *mode = [RCTConvert NSString:json];
  if ([@"motorcycle" isEqualToString:mode]) {
    return MFTravelModeMotorcycle;
  }
  else if ([@"foot" isEqualToString:mode]) {
    return MFTravelModeFoot;
  }
  else if ([@"bike" isEqualToString:mode]) {
    return MFTravelModeBike;
  }
  else {
    return MFTravelModeCar;
  }
}

+ (MFRouteWeighting)MFRouteWeighting:(id)json {
  NSString *weighting = [RCTConvert NSString:json];
  if ([@"shortest" isEqualToString:weighting]) {
    return MFRouteWeightingShortest;
  }
  else if ([@"balance" isEqualToString:weighting]) {
    return MFRouteWeightingBalance;
  }
  else {
    return MFRouteWeightingFastest;
  }
}

+ (MFLanguageResult)MFLanguageResult:(id)json {
  NSString *language = [RCTConvert NSString:json];
  if ([@"en" isEqualToString:language]) {
    return MFLanguageResultEnglish;
  }
  else {
    return MFLanguageResultVietnamese;
  }
}

+ (BOOL)isMFRouteType:(NSString *)type {
  if ([@"motorway" isEqualToString:type] ||
      [@"trunk" isEqualToString:type] ||
      [@"ferry" isEqualToString:type] ||
      [@"bridge" isEqualToString:type] ||
      [@"tunnel" isEqualToString:type]) {
    return YES;
  }
  return NO;
}

+ (MFRouteType)MFRouteType:(NSString *)type {
  if ([@"motorway" isEqualToString:type]) {
    return MFRouteTypeMotorway;
  }
  else if ([@"trunk" isEqualToString:type]) {
    return MFRouteTypeTrunk;
  }
  else if ([@"ferry" isEqualToString:type]) {
    return MFRouteTypeFerry;
  }
  else if ([@"bridge" isEqualToString:type]) {
    return MFRouteTypeBridge;
  }
  else if ([@"tunnel" isEqualToString:type]) {
    return MFRouteTypeTunnel;
  }
  return 0;
}

@end
