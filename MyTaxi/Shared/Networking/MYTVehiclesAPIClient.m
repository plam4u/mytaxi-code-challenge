//
//  MYTVehiclesAPIClient.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "MYTVehiclesAPIClient.h"
#import "MYTVehicleModel.h"
@import MapKit;

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
										 success:(void (^)(NSArray<MYTVehicleModel*> *vehicles))success
										 failure:(void (^)(NSError *error))failure {
	MKMapPoint p1 = MKMapPointMake(rect.origin.x, rect.origin.y);
	MKMapPoint p2 = MKMapPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);

	CLLocationCoordinate2D topLeftCoord = MKCoordinateForMapPoint(p1);
	CLLocationCoordinate2D bottomRightCoord = MKCoordinateForMapPoint(p2);

	double p1Lat = topLeftCoord.latitude;
	double p1Lon = topLeftCoord.longitude;
	double p2Lat = bottomRightCoord.latitude;
	double p2Lon = bottomRightCoord.longitude;
	NSString *query = [NSString stringWithFormat:@"poi/v1?p1Lat=%f&p1Lon=%f&p2Lat=%f&p2Lon=%f", p1Lat, p1Lon, p2Lat, p2Lon];

	[[MYTVehiclesAPIClient sharedClient]
	 GET:query
	 parameters:nil progress:nil
	 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		 // TODO: agree with the team how to handle the errors of malformed responses
		 // The iOS app should gracefully handle any server errors but we need to have certain expectations from the Backend
		 // It could become a hell if we need to check if every single part of the response is well-formed and matches the correct types
		 // Ideally, API validator tests should be run both on Backend and iOS
		 assert(responseObject[@"poiList"]); // we assume that the server will always have the field "poiList"

		 NSArray *vehicleDictionaries = responseObject[@"poiList"];
		 NSError *error;
		 NSArray *vehicles = [MYTVehicleModel arrayOfModelsFromDictionaries:vehicleDictionaries error:&error];

		 if (success != nil) {
			 success(vehicles);
		 }
	 }
	 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		 if (failure != nil) {
			 failure(error);
		 }
	 }];
}
@end
