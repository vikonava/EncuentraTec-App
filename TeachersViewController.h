//
//  TeachersViewController.h
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher.h"
#define kFilename @"teachers.plist"

@interface TeachersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *teachers;
@property (nonatomic, retain) Teacher *curTeacher;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

@end
