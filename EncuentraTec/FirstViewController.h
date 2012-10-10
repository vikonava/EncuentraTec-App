//
//  FirstViewController.h
//  EncuentraTec
//
//  Created by Viko Nava on 9/27/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (retain, nonatomic) IBOutlet MKMapView *myMap;
@property (nonatomic, retain) CLLocationManager *locationManager;

@end
