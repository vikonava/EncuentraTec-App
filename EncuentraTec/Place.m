//
//  Place.m
//  Tec Friends
//
//  Created by Viko Nava on 9/26/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "Place.h"

@implementation Place
@synthesize title, coordinate, image, subtitle, photo, placeType, nid;
 
- (id)initWithTitle:(NSString *)ttl placeType:(NSString *)tipo  andCoordinate:(CLLocationCoordinate2D)c2d imageNamed:(NSString *)imagen subtitle:(NSString *)subt photo:(NSString *)photourl description:(NSString *)placeDescription id:(NSString *)nnid{
	[super init];
	self.title = ttl;
    self.subtitle = subt;
	coordinate = c2d;
    self.image = [UIImage imageNamed:imagen];
    self.photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photourl]]];
    self.description = placeDescription;
    self.placeType = tipo;
    self.nid = nnid;
	return self;
}
 
- (void)dealloc {
	[title release];
    [subtitle release];
	[super dealloc];
}

@end
