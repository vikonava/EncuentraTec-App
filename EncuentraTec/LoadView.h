//
//  LoadView.h
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadView : UIViewController
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (retain, nonatomic) NSMutableArray *teachers;
@property (retain, nonatomic) NSMutableArray *places;

@end
