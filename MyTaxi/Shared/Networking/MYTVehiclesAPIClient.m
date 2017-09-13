//
//  MYTVehiclesAPIClient.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "MYTVehiclesAPIClient.h"

static NSString * const POIBaseURLString = @"https://poi-api.mytaxi.com/PoiService/";

@implementation MYTVehiclesAPIClient

+ (instancetype)sharedClient {
	static MYTVehiclesAPIClient *_sharedClient = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedClient = [[MYTVehiclesAPIClient alloc] initWithBaseURL:[NSURL URLWithString:POIBaseURLString]];
		_sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
	});
	
	return _sharedClient;
}

- (void)getVehiclesInMapRect:(MKMapRect)rect
										 success:(void (^)(NSArray *vehicles))success
										 failure:(void (^)(NSError *error))failure {
	[[MYTVehiclesAPIClient sharedClient]
	 // TODO: refactor to read the passed rect argument
	 GET:@"poi/v1?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891"
	 parameters:nil progress:nil
	 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		 if (success != nil) success(@[@"Vehicle 1", @"Vehicle 2"]);
	 }
	 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		 if (failure != nil) failure(error);
	 }];
}
@end
