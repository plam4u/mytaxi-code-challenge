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
	MKMapRect hamburgRect = MKMapRectMake(141643306.94949707, 86732981.832517802, 37282.702865302563, 64325.091840445995);
	[[MYTVehiclesAPIClient sharedClient]
	 getVehiclesInMapRect:hamburgRect
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
