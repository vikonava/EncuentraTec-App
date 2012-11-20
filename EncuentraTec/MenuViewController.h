//
//  MenuViewController.h
//  EncuentraTec
//
//  Created by alumno on 11/20/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) Place *place;
@property ( retain, nonatomic) NSArray *productos;
@property ( retain, nonatomic) NSArray *precios;
@end
