//
//  PlaceInfoViewController.h
//  EncuentraTec
//
//  Created by Viko Nava on 10/29/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"

@interface PlaceInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) Place *curPlace;
@property (nonatomic, retain) NSArray *tableViewOptions;
@property (retain, nonatomic) IBOutlet UITableView *optionsTableView;
@property (retain, nonatomic) IBOutlet UIImageView *placeImage;

@end
