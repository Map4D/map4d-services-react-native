//
//  SParamConvert.h
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#ifndef SParamConvert_h
#define SParamConvert_h

#import <Map4dServices/Map4dServices.h>

@interface SParamConvert : NSObject

+ (BOOL)BOOL:(id)json fallback:(BOOL)fallback;

+ (NSUInteger)NSUInteger:(id)json;

+ (NSUInteger)NSUInteger:(id)json fallback:(NSUInteger)fallback;

+ (NSString *)NSString:(id)json;

+ (NSArray<NSString *> *)NSStringArray:(id)json;

+ (NSDate *)NSDate:(id)json;

+ (MFLocationComponent *)MFLocationComponent:(id)json;

+ (NSArray<MFLocationComponent *> *)MFLocationComponentArray:(id)json;

+ (MFViewboxComponent *)MFViewboxComponent:(id)json;

+ (MFRouteRestriction *)MFRouteRestriction:(id)json;

+ (MFTravelMode)MFTravelMode:(id)json fallback:(MFTravelMode)fallback;

+ (MFRouteWeighting)MFRouteWeighting:(id)json fallback:(MFRouteWeighting)fallback;

+ (MFLanguageResult)MFLanguageResult:(id)json fallback:(MFLanguageResult)fallback;

@end


#endif /* SParamConvert_h */
