//
//  Place.h
//  Tec Friends
//
//  Created by Viko Nava on 9/26/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Place : NSObject <MKAnnotation> {
    NSString *title;
    NSString *subtitle;
	CLLocationCoordinate2D coordinate;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) UIImage *image;
- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d imageNamed:(NSString *)imagen subtitle:(NSString *)subt;
@end