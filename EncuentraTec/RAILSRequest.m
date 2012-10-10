//
//  RAILSRequest.m
//  aviationlog
//
//  Created by Viko Nava on 8/31/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "RAILSRequest.h"
#import "SBJson.h"

#define SERVER @"http://rocky-peak-4179.herokuapp.com/"

@implementation RAILSRequest

@synthesize requestData = _requestData;
@synthesize urlString = _urlString;

- (id)initWithUrlString:(NSString *)urlString requestData:(NSMutableDictionary *)requestData {
    if ((self = [super init])) {
        self.requestData = requestData;
        self.urlString = urlString;
    }
    return self;
}

- (id)synchronousPostJsonRequest {
    NSData *jsonRequestData = [[_requestData JSONRepresentation] dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [[NSURL alloc] initWithString:[SERVER stringByAppendingFormat:@"%@", _urlString]];
    
    // Create and Form Request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [url release];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%i", [jsonRequestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonRequestData];
        
    // Create Connection and Obtain Results
    NSData *connectionResponse = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [request release];
    NSString *jsonResponse = [[NSString alloc] initWithData:connectionResponse encoding:NSUTF8StringEncoding];
        
    // Init Parser
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *response = [parser objectWithString:jsonResponse];
    [jsonResponse release];
    [parser autorelease];
    return [response autorelease];
}

- (id)synchronousGetJsonRequest {
    // Get HTTP GEt Type
    NSArray *keys = [_requestData allKeys];
    NSMutableString *httprequest = [[NSMutableString alloc] initWithString:@""];
    for (NSString *key in keys) {
        [httprequest appendFormat:@"%@=%@", key, [_requestData objectForKey:key]];
    }
    
    // Format GET URL
    NSURL *url = [[NSURL alloc] initWithString:[SERVER stringByAppendingFormat:@"%@?%@", _urlString, httprequest]];
    [httprequest release];
    httprequest = nil;
    
    // Create Request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [url release];
    url = nil;
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    // Create Connection and Obtain Results
    NSData *connectionResponse = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    [request release];
    request = nil;
    NSString *jsonResponse = [[NSString alloc] initWithData:connectionResponse encoding:NSUTF8StringEncoding];
    
    // Init Parser
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *response = [parser objectWithString:jsonResponse];
    [jsonResponse release];
    jsonResponse = nil;
    [parser release];
    parser = nil;
    return [response autorelease];
}
@end
