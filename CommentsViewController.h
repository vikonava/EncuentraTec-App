//
//  CommentsViewController.h
//  EncuentraTec
//
//  Created by alumno on 11/14/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
#define kFilename @"comments.plist"

@interface CommentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,retain) NSMutableArray *comments;
@property (nonatomic, retain) Comment *curComment;
@end
