//
//  Teacher.h
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject {
    NSString *name;
    NSString *phone;
    NSString *extension;
    NSString *cubicle;
    NSString *website;
    NSString *email;
    NSString *description;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *extension;
@property (nonatomic, copy) NSString *cubicle;
@property (nonatomic, retain) UIImage *photo;
@property (nonatomic, copy) NSString *website;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *description;
- (id)initWithName:(NSString *)tname phone:(NSString *)tphone extension:(NSString *)ext cubicle:(NSString *)tcubicle photo:(NSString *)photo website:(NSString *)twebsite email:(NSString *)temail description:(NSString *)tdescription;
@end
