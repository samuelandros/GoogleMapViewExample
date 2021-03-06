//
// Copyright (c) 2015 Samuel Andros - http://relatedcode.com


#import <MapKit/MapKit.h>

#import "MapView.h"

//-------------------------------------------------------------------------------------------------------------------------------------------------
@interface MapView()
{
	CLLocation *location;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
//-------------------------------------------------------------------------------------------------------------------------------------------------

@implementation MapView

@synthesize mapView;

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (id)initWith:(CLLocation *)location_
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	self = [super init];
	location = location_;
	return self;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[super viewDidLoad];
	self.title = @"Map";
	//---------------------------------------------------------------------------------------------------------------------------------------------
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
																						  action:@selector(actionCancel)];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[super viewWillAppear:animated];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	MKCoordinateRegion region;
	region.center.latitude = location.coordinate.latitude;
	region.center.longitude = location.coordinate.longitude;
	region.span.latitudeDelta = 0.01;
	region.span.longitudeDelta = 0.01;
	[mapView setRegion:region animated:NO];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
	[mapView addAnnotation:annotation];
	[annotation setCoordinate:location.coordinate];
}

#pragma mark - User actions

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)actionCancel
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
