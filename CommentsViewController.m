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
#import "RAILSRequest.h"

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
    self.comments = [[NSMutableArray alloc]init];
    [self getCommentList];
           
    self.selectedPlaceComments = [[NSMutableArray alloc]init];
    self.placeIdAux = [NSString alloc];

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

- (void)getCommentList {
    NSString *filePath = [[NSString alloc]initWithFormat:@""];
    NSArray *response;
    NSString *url;
    if (false) {
        response = [[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    } else {
        
        {
            url = [NSString stringWithFormat:@"places/%@/comments.json",self.placeId];
            RAILSRequest *req = [[RAILSRequest alloc] initWithUrlString:url requestData:[NSMutableDictionary dictionaryWithObject:@"" forKey:@"id"]];
            response = [req synchronousGetJsonRequest];
            [req release];
            
            [response writeToFile:filePath atomically:YES];
        }
        
    }
    Comment *temp;
    for(int i=0; i<[response count]; i++) {
        NSDictionary *t = [response objectAtIndex:i];
        temp = [[Comment alloc] initWithPlaceId:[t objectForKey:@"place_id"] comment:[t objectForKey:@"comment"]];
        
        [self.comments addObject:temp];
        [temp release];
    }
    [filePath release];
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.comments count];
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
        cell.textLabel.text = [[self.comments objectAtIndex:indexPath.row] comment];
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
    self.curComment = [self.comments objectAtIndex:indexPath.row];
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
