//
//  ViewController.m
//  cordovaTest
//
//  Created by エリス on 2024/09/11.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestPushNotificationPermissions];
}

- (void)requestPushNotificationPermissions {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];

    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge)
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"Permission granted.");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        } else {
            NSLog(@"Permission denied.");
        }
        
        if (error) {
            NSLog(@"Error requesting permission: %@", error);
        }
    }];
}

@end
