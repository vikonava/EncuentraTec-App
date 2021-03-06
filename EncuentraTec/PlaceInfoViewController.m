//
//  PlaceInfoViewController.m
//  EncuentraTec
//
//  Created by Viko Nava on 10/29/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "PlaceInfoViewController.h"
#import "PlaceDescriptionViewController.h"
#import "CommentsViewController.h"
#import "MenuViewController.h"
#import "AddCommentViewController.h"
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
    if([self.curPlace.placeType intValue] == 1 )
    {
        self.tableViewOptions = [[NSArray alloc] initWithObjects:@"Descripcion",@"Agregar Comentario", @"Comentarios", nil];
    }
    else
    {
        self.tableViewOptions = [[NSArray alloc] initWithObjects:@"Descripcion",@"Agregar Comentario", @"Comentarios", @"Menu",nil];
    }
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"placeDescription" sender:self];
        break;
        case 1:
            [self performSegueWithIdentifier:@"addComment" sender:self];
        break;
        case 2:
            [self performSegueWithIdentifier:@"commentsList" sender:self];
        break;
        case 3:
            [self performSegueWithIdentifier:@"menu" sender:self];
        break;
            
            
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"placeDescription"]) {
        PlaceDescriptionViewController *placeDescription = (PlaceDescriptionViewController *)segue.destinationViewController;
        placeDescription.teacher = nil;
        placeDescription.place = self.curPlace;
    }
    
    if ([segue.identifier isEqualToString:@"commentsList"]) {
        CommentsViewController *showComments = (CommentsViewController *)segue.destinationViewController;
        showComments.place = self.curPlace;
        showComments.placeId = self.curPlace.nid;
                
    }
    if ([segue.identifier isEqualToString:@"menu"]) {
        MenuViewController *menu = (MenuViewController *)segue.destinationViewController;
        menu.place = self.curPlace;
        
    }
    if ([segue.identifier isEqualToString:@"addComment"]) {
        AddCommentViewController *add = (AddCommentViewController *)segue.destinationViewController;
        add.place = self.curPlace;
        add.placeId = self.curPlace.nid;
        
    }
    
    
}

- (void)dealloc {
    [_optionsTableView release];
    [_tableViewOptions release];
    [_placeImage release];
    [super dealloc];
}

@end
