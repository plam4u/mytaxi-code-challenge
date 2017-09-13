//
//  VehicleModel.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "VehicleModel.h"

@implementation VehicleModel

// we use the mapper to flatten the coordinate JSON object into latitude and longitude properties
// everything else is mapped directly as we receive it
// anything that is not declared as a property is ignored
+ (JSONKeyMapper *)keyMapper {
	return [[JSONKeyMapper alloc] initWithModelToJSONDictionary: @{@"latitude": @"coordinate.latitude",
																																 @"longitude": @"coordinate.longitude"}];
}

@end
