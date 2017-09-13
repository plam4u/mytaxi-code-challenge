//
//  MYTVehicleTableViewCell+Configure.h
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "MYTVehicleTableViewCell.h"
#import "MYTVehicleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYTVehicleTableViewCell (Configure)

/**
 Configures the view to display a model

 @param vehicle the model to display
 */
- (void)configureForVehicle:(MYTVehicleModel *)vehicle;

@end

NS_ASSUME_NONNULL_END
