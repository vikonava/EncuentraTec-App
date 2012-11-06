//
//  PlaceInfoViewController.m
//  EncuentraTec
//
//  Created by Viko Nava on 10/29/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "PlaceInfoViewController.h"
#import "Place.h"

@interface PlaceInfoViewController ()

@end

@implementation PlaceInfoViewController

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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.title = self.curPlace.title;
    self.placeImage.image = self.curPlace.photo;
    self.tableViewOptions = [[NSArray alloc] initWithObjects:@"Descripcion", @"Comentarios", nil];
}

- (void)viewWillDisappear:(BOOL)animated {
   [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    return [self.tableViewOptions count];
}
 
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [self.tableViewOptions objectAtIndex:[indexPath row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)dealloc {
    [_optionsTableView release];
    [_tableViewOptions release];
    [_placeImage release];
    [super dealloc];
}

@end
