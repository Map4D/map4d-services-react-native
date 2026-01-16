#import "Map4dServicesReactNative.h"

@implementation Map4dServicesReactNative
- (NSNumber *)multiply:(double)a b:(double)b {
    NSNumber *result = @(a * b);

    return result;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeMap4dServicesReactNativeSpecJSI>(params);
}

+ (NSString *)moduleName
{
  return @"Map4dServicesReactNative";
}

@end
