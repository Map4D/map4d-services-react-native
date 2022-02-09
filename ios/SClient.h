//
//  SClient.h
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#ifndef SClient_h
#define SClient_h

#import <React/RCTBridgeModule.h>
#import <Map4dServices/Map4dServices.h>

@interface SClient : NSObject

+ (void)fireRequest:(MFServiceRequest *)request
            resolve:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject;

@end


#endif /* SClient_h */
