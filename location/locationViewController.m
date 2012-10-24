//
//  locationViewController.m
//  location
//
//  Created by Azam Malik on 10/22/12.
//  Copyright (c) 2012 prepcloud. All rights reserved.
//

#import "locationViewController.h"

@interface locationViewController ()

@end

@implementation locationViewController

@synthesize longitude, latitude, horizontalAccuracy, verticalAccuracy, altitude, distance, locationManager, startLocation;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    self.startLocation = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)resetDistance
{
    self.startLocation = nil;
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSString *currentLatitude = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.coordinate.latitude];
    self.latitude.text = currentLatitude;
    NSString *currentLongitude = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.coordinate.longitude];
    self.longitude.text = currentLongitude;
    NSString *currentHorizontalAccuracy = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.horizontalAccuracy];
    self.horizontalAccuracy.text = currentHorizontalAccuracy;
NSString *currentAltitude  = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.altitude];
    self.altitude.text = currentAltitude;
NSString *currentVerticalAccuracy = [[NSString alloc] initWithFormat:@"%+.6f", newLocation.verticalAccuracy];
self.verticalAccuracy.text = currentVerticalAccuracy;

if (self.startLocation == nil)
    self.startLocation = newLocation;
    CLLocationDistance distanceBetween = [newLocation distanceFromLocation:self.startLocation];
    NSString *tripString = [[NSString alloc] initWithFormat:@"%f", distanceBetween];
    self.distance.text = tripString;

}
-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}
@end
