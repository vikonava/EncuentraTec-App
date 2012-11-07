//
//  TeacherInfoViewController.m
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "TeacherInfoViewController.h"
#import "Teacher.h"
#import "PlaceDescriptionViewController.h"

@interface TeacherInfoViewController ()

@end

@implementation TeacherInfoViewController

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
    self.title = self.teacher.name;
    self.photo.image = self.teacher.photo;
    self.phone.text = self.teacher.phone;
    self.extension.text = self.teacher.extension;
    self.office.text = self.teacher.cubicle;
    self.menu = [[NSArray alloc] initWithObjects:@"Información Personal", @"Email", @"Website", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_photo release];
    [_phone release];
    [_extension release];
    [_office release];
    [self.menu release];
    [super dealloc];
}

#pragma mark Menu

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menu count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [self.menu objectAtIndex:[indexPath row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"teacherDescription" sender:self];
            break;
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@", self.teacher.email]]];
            break;
        case 2:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.teacher.website]];
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"teacherDescription"]) {
        PlaceDescriptionViewController *description = (PlaceDescriptionViewController *)segue.destinationViewController;
        description.place = nil;
        description.teacher = self.teacher;
    }
}
@end
