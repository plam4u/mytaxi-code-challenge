//
//  MYTVehiclesListViewController.m
//  MyTaxi
//
//  Created by Plamen Andreev on 9/13/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

#import "MYTVehiclesListViewController.h"
#import "MYTVehiclesAPIClient.h"
#import "MYTVehicleTableViewCell.h"
#import "MYTVehicleTableViewCell+Configure.h"

static NSString * const kTaxiCellIdentifier = @"vehicleCell";

@interface MYTVehiclesListViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray<MYTVehicleModel *> *vehicles;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation MYTVehiclesListViewController

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
	 getVehiclesInMapRect:MKMapRectMake(53.5439092, 9.9834774, 0.05, 0.05)
	 success:^(NSArray<MYTVehicleModel *> * _Nonnull vehicles) {
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
	MYTVehicleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTaxiCellIdentifier];
	[cell configureForVehicle:self.vehicles[indexPath.row]];
	return cell;
}

@end
