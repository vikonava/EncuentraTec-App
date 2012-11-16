//
//  Comment.m
//  EncuentraTec
//
//  Created by alumno on 11/14/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "Comment.h"

@implementation Comment

@synthesize placeId;
@synthesize comment;


-(id)initWithPlaceId:(NSString *)tplaceId comment:(NSString *)tcomment{
    [super init];
    self.placeId = tplaceId;
    self.comment = tcomment;
    return self;
}

- (void)dealloc {
	[placeId release];
    [comment release];
	[super dealloc];
}

@end
