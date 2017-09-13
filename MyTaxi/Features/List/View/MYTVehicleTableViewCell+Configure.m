//
//  MYTVehicleTableViewCell+Configure.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "MYTVehicleTableViewCell+Configure.h"

@implementation MYTVehicleTableViewCell (Configure)

- (void)configureForVehicle:(MYTVehicleModel *)vehicle {
	self.vehicleImageView.image = [UIImage imageNamed:@"ic_taxi"];
	self.headlineLabel.text = [NSString stringWithFormat:@"%ld", vehicle.vehicleId];
	self.subheadLabel.text = vehicle.state;
}

@end
