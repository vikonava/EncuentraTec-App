//
//  FirstViewController.h
//  EncuentraTec
//
//  Created by Viko Nava on 9/27/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Place.h"

#define kFilename @"places.plist"

@interface FirstViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate>
@property (retain, nonatomic) IBOutlet MKMapView *myMap;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) Place *curPlace;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

@end
