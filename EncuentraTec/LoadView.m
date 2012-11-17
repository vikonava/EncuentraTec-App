//
//  LoadView.m
//  EncuentraTec
//
//  Created by Viko Nava on 11/6/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "LoadView.h"
#import "Teacher.h"
#import "Place.h"
#import "Comment.h"
#import "RAILSRequest.h"
#import "MainTabBarController.h"

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
    self.teachers = [[NSMutableArray alloc] init];
    self.places = [[NSMutableArray alloc] init];
    self.comments = [[NSMutableArray alloc]init];
    [self getTeacherList];
    NSLog(@"Teachers Done");
    [self getPlaceList];
    NSLog(@"Places Done");
    [self getCommentList];
    NSLog(@"Comments Done");
    [self performSegueWithIdentifier:@"infoLoaded" sender:self];
}


- (void)getCommentList {
    NSString *filePath = [[NSString alloc]initWithFormat:@"%@", [self dataFilePath:@"comments.plist"]];
    NSArray *response;
    NSString *url;
    int numberOfPlaces = [self.places count];
    if (false) {
        response = [[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    } else {
        for(int i = 1;i<=numberOfPlaces;i++)
        {
            url = [NSString stringWithFormat:@"places/%d/comments.json",i];
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
        
        NSLog(@" place id: %@",temp.placeId);
        [self.comments addObject:temp];
        [temp release];
    }
    [filePath release];

}


- (void)getTeacherList {
    NSString *filePath = [[NSString alloc] initWithFormat:@"%@", [self dataFilePath:@"teachers.plist"]];
    NSArray *response;
    //if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
    if (false) {
        response = [[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    } else {
        RAILSRequest *req = [[RAILSRequest alloc] initWithUrlString:@"professors.json" requestData:[NSMutableDictionary dictionaryWithObject:@"" forKey:@"id"]];
        response = [req synchronousGetJsonRequest];
        [req release];
        
        [response writeToFile:filePath atomically:YES];
    }
    
    Teacher *temp;
    for(int i=0; i<[response count]; i++) {
        NSDictionary *t = [response objectAtIndex:i];
        temp = [[Teacher alloc] initWithName:[t objectForKey:@"name"] phone:[t objectForKey:@"phone"] extension:[t objectForKey:@"extension"] cubicle:[t objectForKey:@"cubicle"] photo:[t objectForKey:@"image_url"] website:[t objectForKey:@"website"] email:[t objectForKey:@"email"] description:[t objectForKey:@"description"]];
        
        [self.teachers addObject:temp];
        [temp release];
    }
    [filePath release];
}

- (void)getPlaceList {
    NSString *filePath = [[NSString alloc] initWithFormat:@"%@", [self dataFilePath:@"places.plist"]];
    NSArray *response;
    //if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
    if (false) {
        response = [[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    } else {
        RAILSRequest *req = [[RAILSRequest alloc] initWithUrlString:@"places.json" requestData:[NSMutableDictionary dictionaryWithObject:@"" forKey:@"id"]];
        response = [req synchronousGetJsonRequest];
        [req release];
        
        [response writeToFile:filePath atomically:YES];
    }
    
    Place *temp;
    for(int i=0; i<[response count]; i++) {
        NSDictionary *t = [response objectAtIndex:i];
        temp = [[Place alloc] initWithTitle:[t objectForKey:@"title"] andCoordinate:CLLocationCoordinate2DMake([[t objectForKey:@"latitude"] floatValue] , [[t objectForKey:@"longitude"] floatValue]) imageNamed:[t objectForKey:@"image"] subtitle:[t objectForKey:@"schedule"] photo:[t objectForKey:@"photo"] description:[t objectForKey:@"description"]];
        
        [self.places addObject:temp];
        [temp release];
    }
    [filePath release];
}

#pragma mark Places Persistance

- (NSString *)dataFilePath:(NSString *)filename {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:filename];
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

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MainTabBarController *main = (MainTabBarController *)segue.destinationViewController;
    main.teachers = self.teachers;
    main.places = self.places;
    main.comments = self.comments;
    //[self.teachers release];
    //[self.places release];
}

@end
