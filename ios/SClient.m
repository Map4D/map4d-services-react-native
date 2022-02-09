//
//  SClient.m
//  react-native-map4d-services
//
//  Created by Huy Dang on 26/01/2022.
//

#import "SClient.h"

@implementation SClient

static MFServices *_services = nil;

+ (MFServices *)services {
  if (_services == nil) {
    _services = [[MFServices alloc] init];
  }
  return _services;
}

+ (void)fireRequest:(MFServiceRequest *)request
            resolve:(RCTPromiseResolveBlock)resolve
             reject:(RCTPromiseRejectBlock)reject {
  [SClient.services dataTaskWithRequest:request
                      completionHandler:^(NSData * _Nullable data, id<MFServiceError>  _Nullable error) {
    if (error != nil) {
      resolve(@{
        @"code": error.code,
        @"message": error.message
      });
    }

    NSError *parseError = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];

    if (parseError != nil) {
      resolve(@{
        @"code": [NSString stringWithFormat:@"%ld", parseError.code],
        @"message": parseError.localizedDescription
      });
    }

    resolve(dictionary);
  }];
}

@end
