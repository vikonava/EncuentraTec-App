//
//  LoadView.m
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "LoadView.h"

@interface LoadView ()

@end

@implementation LoadView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.activityIndicator startAnimating];
}

- (void)viewDidAppear:(BOOL)animated {
    [self performSegueWithIdentifier:@"infoLoaded" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_activityIndicator release];
    [super dealloc];
}
@end
