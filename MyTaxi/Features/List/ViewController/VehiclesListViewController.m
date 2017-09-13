//
//  VehiclesListViewController.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "VehiclesListViewController.h"
#import "MYTVehiclesAPIClient.h"
#import "VehicleTableViewCell.h"
#import "VehicleTableViewCell+Configure.h"

static NSString * const kTaxiCellIdentifier = @"vehicleCell";

@interface VehiclesListViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray<VehicleModel *> *vehicles;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation VehiclesListViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	[self setupTableView];
	[self loadContent];
}

- (void)setupTableView {
	self.tableView.dataSource = self;
	self.tableView.rowHeight = 60;
	self.vehicles = @[];
}

- (void)loadContent {
	[[MYTVehiclesAPIClient sharedClient]
	 getVehiclesInMapRect:MKMapRectMake(0, 0, 0, 0)
	 success:^(NSArray<VehicleModel *> * _Nonnull vehicles) {
		 self.vehicles = vehicles;
		 [self.tableView reloadData];
	 }
	 failure:^(NSError * _Nonnull error) {
		 // handle error
	 }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.vehicles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	VehicleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTaxiCellIdentifier];
	[cell configureForVehicle:self.vehicles[indexPath.row]];
	return cell;
}

@end
