//
//  CommentInfoViewController.h
//  EncuentraTec
//
//  Created by alumno on 11/14/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
@interface CommentInfoViewController : UIViewController

@property (nonatomic, retain)Comment *comment;
@property (nonatomic, retain) NSString *commentInfo;
@property (retain, nonatomic) IBOutlet UITextView *longComment;

@end
