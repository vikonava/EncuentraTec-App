//
//  RAILSRequest.h
//  aviationlog
//
//  Created by Viko Nava on 8/31/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RAILSRequest : NSObject

@property (strong) NSMutableDictionary *requestData;
@property (strong) NSString *urlString;

- (id)initWithUrlString:(NSString *)urlString requestData:(NSMutableDictionary *)requestData;
- (id)synchronousPostJsonRequest;
- (id)synchronousGetJsonRequest;
@end
