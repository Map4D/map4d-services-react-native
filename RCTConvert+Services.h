//
//  RCTConvert+Services.h
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#ifndef RCTConvert_Services_h
#define RCTConvert_Services_h

#import <React/RCTConvert.h>
#import <Map4dServices/Map4dServices.h>

@interface RCTConvert (Services)

+ (MFLocationComponent *)MFLocationComponent:(id)json;

+ (NSArray<MFLocationComponent *> *)MFLocationComponentArray:(id)json;

+ (MFViewboxComponent *)MFViewboxComponent:(id)json;

+ (MFRouteRestriction *)MFRouteRestriction:(id)json;

+ (MFTravelMode)MFTravelMode:(id)json;

+ (MFRouteWeighting)MFRouteWeighting:(id)json;

+ (MFLanguageResult)MFLanguageResult:(id)json;

@end


#endif /* RCTConvert_Services_h */
