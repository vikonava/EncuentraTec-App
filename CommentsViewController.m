//
//  CommentsViewController.m
//  EncuentraTec
//
//  Created by alumno on 11/14/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "CommentsViewController.h"
#import "RAILSRequest.h"
#import "Comment.h"
#import "MainTabBarController.h"
#import "CommentInfoViewController.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController


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
    MainTabBarController *main = (MainTabBarController *)self.tabBarController;
    self.comments = main.comments;
           
    self.selectedPlaceComments = [[NSMutableArray alloc]init];
    self.placeIdAux = [NSString alloc];
    

    if([self.place.title isEqualToString:@"Rectoria"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"1" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"CIAP"])
    {
        NSLog(@"showComments 2");
        self.placeIdAux = [NSString stringWithFormat:@"2" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Gimnasio Tec"])
    {
        NSLog(@"showComments 2");
        self.placeIdAux = [NSString stringWithFormat:@"3" ];
        self.curComment.placeId = self.placeIdAux;
    }
    
    if([self.place.title isEqualToString:@"Estadio Tecnologico"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"4" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Centro de Biotecnologia"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"5" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Aulas 6"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"6" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Aulas 7"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"7" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Aulas 1"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"8" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Aulas 2"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"9" ];
        self.curComment.placeId = self.placeIdAux;
    }
    
    if([self.place.title isEqualToString:@"Aulas 3"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"10" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Aulas 4"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"11" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Starbucks"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"12" ];
        self.curComment.placeId = self.placeIdAux;
    }
    
    if([self.place.title isEqualToString:@"Campos Escamilla"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"13" ];
        self.curComment.placeId = self.placeIdAux;
    }
    
    if([self.place.title isEqualToString:@"Domo acuatico"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"14" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"Biblioteca"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"15" ];
        self.curComment.placeId = self.placeIdAux;
    }
    if([self.place.title isEqualToString:@"CEDES"])
    {
        self.placeIdAux = [NSString stringWithFormat:@"16" ];
        self.curComment.placeId = self.placeIdAux;
    }
    
    //contador de objetos en el arreglo de los comentarios dado un lugar.
    int cont = 0;
    for(int i = 0; i < [self.comments count]; i++)
    {
        NSLog(@"compara %@ vs %@", [[self.comments objectAtIndex:i] placeId],self.placeIdAux);
        if([[[self.comments objectAtIndex:i]placeId]intValue] == [self.placeIdAux intValue])
        {
            NSLog(@"dentro if");
            [self.selectedPlaceComments addObject:[self.comments objectAtIndex:i] ];
            NSLog(@"comenta %@",[[self.selectedPlaceComments objectAtIndex:cont]comment]);
            cont++;
            
        }
        
        
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)dealloc {
    [self.comments release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.selectedPlaceComments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier] autorelease];
    }

    //if([[[self.selectedPlaceComments objectAtIndex:indexPath.row] placeId]intValue] == [self.placeIdAux intValue])
    {
        cell.textLabel.text = [[self.selectedPlaceComments objectAtIndex:indexPath.row] comment];
        cell.textLabel.font = [UIFont fontWithName:@"System" size:10];
    }
    return cell;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.curComment = [self.selectedPlaceComments objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"CommentInfo" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CommentInfo"]) {
        CommentInfoViewController *commentInfo = (CommentInfoViewController *)segue.destinationViewController;
        commentInfo.comment = self.curComment;
    }
}


@end
