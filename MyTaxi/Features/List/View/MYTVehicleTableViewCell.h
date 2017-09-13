//
//  MYTVehicleTableViewCell.h
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYTVehicleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *vehicleImageView;
@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;
@property (weak, nonatomic) IBOutlet UILabel *subheadLabel;

@end
