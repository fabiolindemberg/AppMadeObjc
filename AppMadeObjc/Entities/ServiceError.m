//
//  ServiceError.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 05/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "ServiceError.h"

@implementation ServiceError

- (instancetype)initWithParse:(NSDictionary *)parse {
    
    self = [super init];
    
    if (self) {
        self.code = [parse[@"code"] intValue];
        self.message = parse[@"message"];
    }
                        
    return self;
}

@end
