//
//  SearchParameter.h
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchParameter : NSObject

@property (nonatomic) NSString *q;
@property (nonatomic) NSString *pageToken;

- (NSString*) toString;
@end

/*
 struct SearchParameter {
     let q: String?
     let pageToken: String?
     
     func toString() -> String {
         return q != nil ? "&q=\(q!)" : "&pageToken\(pageToken!)"
     }
 }
 */

NS_ASSUME_NONNULL_END
