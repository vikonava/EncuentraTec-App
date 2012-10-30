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
    self.title = self.curPlace.title;
    self.placeImage.image = self.curPlace.photo;
    self.tableViewOptions = [[NSArray alloc] initWithObjects:@"Descripcion", @"Comentarios", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table View Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    if (section == 0)
        return [self.tableViewOptions count];
    else
        return 1;
}
 
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    if ([indexPath section] == 0) {
        cell.textLabel.text = [self.tableViewOptions objectAtIndex:[indexPath row]];
    } else {
        cell.textLabel.text = @"Regresar al Mapa";
    }
    return cell;
}

- (void)dealloc {
    [_optionsTableView release];
    [_tableViewOptions release];
    [_placeImage release];
    [super dealloc];
}
@end
