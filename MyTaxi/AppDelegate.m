//
//  AppDelegate.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "AppDelegate.h"
#import "MYTVehiclesAPIClient.h"
#import "VehicleModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	[[MYTVehiclesAPIClient sharedClient]
	 getVehiclesInMapRect:MKMapRectMake(0, 0, 0, 0)
	 success:^(NSArray<VehicleModel*> * _Nonnull vehicles) {
		 // do something with the vehicles
		 NSLog(@"Success: %@", vehicles);
	 }
	 failure:^(NSError * _Nonnull error) {
		 // handle the error and notify the user
		 NSLog(@"Failure %@", error.localizedDescription);
	 }];

	return YES;
}

@end
