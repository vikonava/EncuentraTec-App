//
//  Comment.h
//  EncuentraTec
//
//  Created by alumno on 11/14/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject {
    NSString *placeId;
    NSString *comment;
}

@property (nonatomic, copy )NSString *placeId;
@property (nonatomic, copy )NSString *comment;


- (id)initWithPlaceId:(NSString *)tplaceId comment:(NSString *)tcomment;

@end
