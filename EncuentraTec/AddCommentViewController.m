//
//  AddCommentViewController.m
//  EncuentraTec
//
//  Created by alumno on 11/21/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "AddCommentViewController.h"
#import "RAILSRequest.h"

@interface AddCommentViewController ()

@end

@implementation AddCommentViewController

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
    NSLog(@"%@",self.placeId);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)oprimioBoton:(id)sender {
    
    NSString *filePath = [[NSString alloc] initWithFormat:@"" ];
    NSString *commentText = [[NSString alloc] initWithFormat:@"%@",self.commentTextField.text ];
    NSArray *response;
    NSString *url;
    if (false) {
        response = [[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    } else {
       
        url = [NSString stringWithFormat:@"places/%@/comments.json",self.placeId];
        RAILSRequest *req = [[RAILSRequest alloc] initWithUrlString:url requestData:[NSMutableDictionary dictionaryWithObject:[NSMutableDictionary dictionaryWithObject:commentText forKey:@"comment"]  forKey:@"comment"]];
        response = [req synchronousPostJsonRequest];
        [req release];
        
    }

}
- (void)dealloc {
    [_commentTextField release];
    [super dealloc];
}
@end
