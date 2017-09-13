//
//  VehiclesListViewController.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "VehiclesListViewController.h"
#import "MYTVehiclesAPIClient.h"

static NSString * const kTaxiCellIdentifier = @"taxiCell";

@interface VehiclesListViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray<VehicleModel *> *vehicles;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation VehiclesListViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTaxiCellIdentifier];
	self.tableView.dataSource = self;

	self.vehicles = @[];
	[self loadContent];
}

- (void)loadContent {
	[[MYTVehiclesAPIClient sharedClient]
	 getVehiclesInMapRect:MKMapRectMake(0, 0, 0, 0)
	 success:^(NSArray<VehicleModel *> * _Nonnull vehicles) {
		 self.vehicles = vehicles;
		 [self.tableView reloadData];
	 }
	 failure:^(NSError * _Nonnull error) {

	 }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.vehicles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTaxiCellIdentifier];
	cell.imageView.image = [UIImage imageNamed:@"ic_taxi"];
	cell.textLabel.text = [NSString stringWithFormat:@"%ld", self.vehicles[indexPath.row].vehicleId];
	cell.detailTextLabel.text = self.vehicles[indexPath.row].state;
	return cell;
}

@end
