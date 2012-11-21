//
//  CommentsViewController.h
//  EncuentraTec
//
//  Created by alumno on 11/14/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
#import "Place.h"
#define kFilename @"comments.plist"

@interface CommentsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,retain) NSMutableArray *comments;
@property (nonatomic, retain) NSMutableArray *selectedPlaceComments;
@property (nonatomic, retain) Comment *curComment;
@property (retain, nonatomic) Place *place;
@property (retain, nonatomic) NSString *placeIdAux;

@property(retain, nonatomic) NSString *placeId;
@end
