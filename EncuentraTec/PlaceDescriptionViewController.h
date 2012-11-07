//
//  PlaceDescriptionViewController.h
//  EncuentraTec
//
//  Created by Viko Nava on 11/7/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
#import "Teacher.h"

@interface PlaceDescriptionViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextView *description;
@property (retain, nonatomic) Place *place;
@property (retain, nonatomic) Teacher *teacher;
@end
