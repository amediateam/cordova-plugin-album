#import "PhotoAlbum.h"
#import <Cordova/CDVPluginResult.h>

@implementation PhotoAlbum

- (void)get: (CDVInvokedUrlCommand*)command
{
    [self.webView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError* error) {
        NSString* userAgent = result;
        NSString* callbackId = command.callbackId;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:userAgent];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
    }];
}

- (void)set: (CDVInvokedUrlCommand*)command
{
    id newPhotoAlbum = [command argumentAtIndex:0];
    self.webView.customPhotoAlbum = newPhotoAlbum;
    
    NSString* callbackId = command.callbackId;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:newPhotoAlbum];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackId];
}

- (void)reset: (CDVInvokedUrlCommand*)command
{
    self.webView.customPhotoAlbum = nil;
    [self get:command];
}

@end
