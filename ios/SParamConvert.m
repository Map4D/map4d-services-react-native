//
//  SParamConvert.m
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#import <React/RCTConvert.h>
#import <React/RCTConvert+CoreLocation.h>
#import "SParamConvert.h"

@interface SParamConvert (Private)
+ (BOOL)isNull:(id)json;
+ (BOOL)isMFRouteType:(NSString *)type;
+ (MFRouteType)MFRouteType:(NSString *)type;
@end

#pragma mark - SParamConvert

@implementation SParamConvert

+ (BOOL)BOOL:(id)json fallback:(BOOL)fallback {
  return [self isNull:json] ? fallback : [RCTConvert BOOL:json];
}

+ (NSUInteger)NSUInteger:(id)json {
  return [self NSUInteger:json fallback:0];
}

+ (NSUInteger)NSUInteger:(id)json fallback:(NSUInteger)fallback {
  return [self isNull:json] ? fallback : [RCTConvert NSUInteger:json];
}

+ (NSString *)NSString:(id)json {
  return [self isNull:json] ? nil : [RCTConvert NSString:json];
}

+ (NSArray<NSString *> *)NSStringArray:(id)json {
  if ([self isNull:json]) {
    return nil;
  }
  
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[json count]];
  for (id e in json) {
    NSString *str = [self NSString:e];
    if (str != nil) {
      [array addObject:str];
    }
  }
  return array;
}

+ (NSDate *)NSDate:(id)json {
  return [self isNull:json] ? nil : [RCTConvert NSDate:json];
}

+ (MFLocationComponent *)MFLocationComponent:(id)json {
  if ([self isNull:json]) {
    return nil;
  }
  CLLocationCoordinate2D coordinate = [RCTConvert CLLocationCoordinate2D:json];
  return [[MFLocationComponent alloc] initWithCoordinate:coordinate alias:json[@"alias"]];
}

+ (NSArray<MFLocationComponent *> *)MFLocationComponentArray:(id)json {
  if ([self isNull:json]) {
    return nil;
  }
  
  NSMutableArray<MFLocationComponent *> *array = [NSMutableArray arrayWithCapacity:[json count]];
  for (id e in json) {
    MFLocationComponent *location = [self MFLocationComponent:e];
    if (location != nil) {
      [array addObject:location];
    }
  }
  return array;
}

+ (MFViewboxComponent *)MFViewboxComponent:(id)json {
  if ([self isNull:json]) {
    return nil;
  }

  MFLocationComponent *southwest = [SParamConvert MFLocationComponent:json[@"southwest"]];
  MFLocationComponent *northeast = [SParamConvert MFLocationComponent:json[@"northeast"]];
  return [[MFViewboxComponent alloc] initWithSouthwest:southwest.coordinate northeast:northeast.coordinate];
}

+ (MFRouteRestriction *)MFRouteRestriction:(id)json {
  if ([self isNull:json]) {
    return nil;
  }
  
  MFLocationComponent *location = [SParamConvert MFLocationComponent:json[@"location"]];
  NSUInteger radius = json[@"radius"] != nil ? [RCTConvert NSUInteger:json[@"radius"]] : 0;
  MFViewboxComponent *viewbox = [SParamConvert MFViewboxComponent:json[@"viewbox"]];
  NSArray<MFLocationComponent *> *path = [SParamConvert MFLocationComponentArray:json[@"path"]];
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
          if ([SParamConvert isMFRouteType:types[i]]) {
            [result avoidRouteType:[SParamConvert MFRouteType:types[i]]];
          }
        }
      }
      else {
        result = [[MFRouteRestriction alloc] initWithRouteType:[SParamConvert MFRouteType:types[0]]];
        for (NSUInteger i = 1; i < types.count; i++) {
          if ([SParamConvert isMFRouteType:types[i]]) {
            [result avoidRouteType:[SParamConvert MFRouteType:types[i]]];
          }
        }
      }
    }
    
    return result;
  
}

+ (MFTravelMode)MFTravelMode:(id)json fallback:(MFTravelMode)fallback {
  if ([self isNull:json]) {
    return fallback;
  }

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

+ (MFRouteWeighting)MFRouteWeighting:(id)json fallback:(MFRouteWeighting)fallback {
  if ([self isNull:json]) {
    return fallback;
  }

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

+ (MFLanguageResult)MFLanguageResult:(id)json fallback:(MFLanguageResult)fallback {
  if ([self isNull:json]) {
    return fallback;
  }

  NSString *language = [RCTConvert NSString:json];
  if ([@"en" isEqualToString:language]) {
    return MFLanguageResultEnglish;
  }
  else {
    return MFLanguageResultVietnamese;
  }
}

@end

#pragma mark - SParamConvert (Private)


@implementation SParamConvert (Private)

+ (BOOL)isNull:(id)json {
  if (json == nil || [json isKindOfClass:[NSNull class]]) {
    return true;
  }
  return false;
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
