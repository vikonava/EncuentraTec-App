//
//  AddCommentViewController.h
//  EncuentraTec
//
//  Created by alumno on 11/21/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"

@interface AddCommentViewController : UIViewController

@property (retain, nonatomic) Place *place;
@property (retain, nonatomic) IBOutlet UITextField *commentTextField;
@property(retain, nonatomic) NSString *placeId;

- (IBAction)oprimioBoton:(id)sender;

@end
