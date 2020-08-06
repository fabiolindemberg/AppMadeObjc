//
//  ServiceError.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 05/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServiceError : NSObject

@property (nonatomic) int code;
@property (nonatomic) NSString *message;

- (instancetype)initWithParse: (NSDictionary *) parse;

@end

NS_ASSUME_NONNULL_END
