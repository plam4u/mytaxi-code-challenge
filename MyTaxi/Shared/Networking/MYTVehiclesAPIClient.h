//
//  MYTVehiclesAPIClient.h
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

@import AFNetworking;
@import MapKit;

NS_ASSUME_NONNULL_BEGIN

@interface MYTVehiclesAPIClient : AFHTTPSessionManager

/**
 Shared client for requesting data from the server responsible for vehicles

 @return returns the shared instance that can be used to request vehicles information
 */
+ (instancetype)sharedClient;


/**
 Requests all the vehicles in a map region.

 @param rect The map rect containing the vehicles of interest. Vehicles outside of this rect won't be returned from the server.
 @param success success block to execute if the query was successful. The block receives the parsed vehicle as an NSArray.
 @param failure failure block to execute if there was an issue executing the query. Use the `error` to obtain more information.
 */
- (void)getVehiclesInMapRect:(MKMapRect)rect
										 success:(void (^)(NSArray *vehicles))success
										 failure:(void (^)(NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
