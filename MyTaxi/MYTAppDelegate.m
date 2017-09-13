//
//  MYTAppDelegate.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "MYTAppDelegate.h"
#import "MYTVehiclesAPIClient.h"
#import "MYTVehicleModel.h"

@interface MYTAppDelegate ()

@end

@implementation MYTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	[[MYTVehiclesAPIClient sharedClient]
	 getVehiclesInMapRect:MKMapRectMake(0, 0, 0, 0)
	 success:^(NSArray<MYTVehicleModel*> * _Nonnull vehicles) {
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
