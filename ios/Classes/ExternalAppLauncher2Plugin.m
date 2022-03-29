#import "ExternalAppLauncher2Plugin.h"

@implementation ExternalAppLauncher2Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"external_app_launcher2"
            binaryMessenger:[registrar messenger]];
  ExternalAppLauncher2Plugin* instance = [[ExternalAppLauncher2Plugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"openApp" isEqualToString:call.method]) {
     @try {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:call.arguments[@"urlScheme"]]]) {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:call.arguments[@"urlScheme"]]];
            result(@(YES));
        } else {
            result(@(NO));
        }
     }
    @catch (NSException * e) {
      NSLog(@"exception here");
      result(e);
    }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
