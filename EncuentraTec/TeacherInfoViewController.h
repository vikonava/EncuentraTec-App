//
//  TeacherInfoViewController.h
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher.h"

@interface TeacherInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) Teacher *teacher;
@property (retain, nonatomic) IBOutlet UIImageView *photo;
@property (retain, nonatomic) IBOutlet UILabel *phone;
@property (retain, nonatomic) IBOutlet UILabel *extension;
@property (retain, nonatomic) IBOutlet UILabel *office;
@property (retain, nonatomic) NSArray *menu;
@end
