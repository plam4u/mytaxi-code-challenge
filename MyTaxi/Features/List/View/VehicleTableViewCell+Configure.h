//
//  VehicleTableViewCell+Configure.h
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "VehicleTableViewCell.h"
#import "VehicleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VehicleTableViewCell (Configure)

/**
 Configures the view to display a model

 @param vehicle the model to display
 */
- (void)configureForVehicle:(VehicleModel *)vehicle;

@end

NS_ASSUME_NONNULL_END
