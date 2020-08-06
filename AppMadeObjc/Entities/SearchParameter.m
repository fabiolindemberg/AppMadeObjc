//
//  SearchParameter.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "SearchParameter.h"

@implementation SearchParameter

- (NSString*) toString {
    
    NSString *searchCriteria = [NSString stringWithFormat: @"q=%@", self.q];
    NSString *pageToken = [NSString stringWithFormat: @"&pageToken=%@", self.pageToken];
    return [NSString stringWithFormat: @"%@", self.q != nil ? searchCriteria : pageToken];
}

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
