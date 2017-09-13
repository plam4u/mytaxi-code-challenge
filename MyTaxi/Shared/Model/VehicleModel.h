//
//  VehicleModel.h
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface VehicleModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;
@property (nonatomic, assign) NSInteger heading;

@end
