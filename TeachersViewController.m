//
//  TeachersViewController.m
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "TeachersViewController.h"
#import "Teacher.h"
#import "RAILSRequest.h"
#import "MainTabBarController.h"
#import "TeacherInfoViewController.h"

@interface TeachersViewController ()

@end

@implementation TeachersViewController

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
    MainTabBarController *main = (MainTabBarController *)self.tabBarController;
    self.teachers = main.teachers;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)dealloc {
    [self.teachers release];
    [_searchBar release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark Table View Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.teachers count];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[self.teachers objectAtIndex:indexPath.row] name];
    cell.textLabel.font = [UIFont fontWithName:@"System" size:10];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.searchBar resignFirstResponder];
    self.curTeacher = [self.teachers objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"teacherInfo" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"teacherInfo"]) {
        TeacherInfoViewController *teacherInfo = (TeacherInfoViewController *)segue.destinationViewController;
        teacherInfo.teacher = self.curTeacher;
    }
}

@end
