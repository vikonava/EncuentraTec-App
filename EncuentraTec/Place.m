//
//  Place.m
//  Tec Friends
//
//  Created by Viko Nava on 9/26/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "Place.h"

@implementation Place
@synthesize title, coordinate, image, subtitle, photo, placeType;
 
- (id)initWithTitle:(NSString *)ttl placeType:(NSString *)tipo  andCoordinate:(CLLocationCoordinate2D)c2d imageNamed:(NSString *)imagen subtitle:(NSString *)subt photo:(NSString *)photourl description:(NSString *)placeDescription{
	[super init];
	self.title = ttl;
    self.subtitle = subt;
	coordinate = c2d;
    self.image = [UIImage imageNamed:imagen];
    self.photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photourl]]];
    self.description = placeDescription;
    self.placeType = tipo;
	return self;
}
 
- (void)dealloc {
	[title release];
    [subtitle release];
	[super dealloc];
}

@end
