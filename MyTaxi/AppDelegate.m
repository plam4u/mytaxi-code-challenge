//
//  AppDelegate.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "AppDelegate.h"
#import "MYTVehiclesAPIClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	[[MYTVehiclesAPIClient sharedClient] getVehiclesInMapRect:MKMapRectMake(0, 0, 0, 0) success:^(NSArray * _Nonnull vehicles) {
		// do something with the vehicles
	} failure:^(NSError * _Nonnull error) {
		// handle the error and notify the user
	}];

	return YES;
}

@end
