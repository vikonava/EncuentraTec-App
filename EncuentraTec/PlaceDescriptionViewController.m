//
//  PlaceDescriptionViewController.m
//  EncuentraTec
//
//  Created by Viko Nava on 11/7/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "PlaceDescriptionViewController.h"
#import "PlaceInfoViewController.h"

@interface PlaceDescriptionViewController ()

@end

@implementation PlaceDescriptionViewController

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
    if (self.place != nil) self.description.text = self.place.description;
    if (self.teacher != nil) self.description.text = self.teacher.description;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_description release];
    [super dealloc];
}
@end
