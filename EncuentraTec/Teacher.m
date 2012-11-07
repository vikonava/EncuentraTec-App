//
//  Teacher.m
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher
@synthesize name = _name, phone = _phone, extension = _extension, cubicle = _cubicle, photo = _photo, website = _website, email = _email, description = _description;

- (id)initWithName:(NSString *)tname phone:(NSString *)tphone extension:(NSString *)ext cubicle:(NSString *)tcubicle photo:(NSString *)photo website:(NSString *)twebsite email:(NSString *)temail description:(NSString *)tdescription {
    [super init];
    self.name = tname;
    self.phone = tphone;
    self.extension = ext;
    self.cubicle = tcubicle;
    self.photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo]]];
    self.website = twebsite;
    self.email = temail;
    self.description = tdescription;
    return self;
}


- (void)dealloc {
    [self.name release];
    [super dealloc];
}

@end

