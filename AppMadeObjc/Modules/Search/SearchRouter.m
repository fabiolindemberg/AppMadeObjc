//
//  SearchRouter.m
//  AppMadeObjc
//
//  Created by Fabio Lindemberg on 06/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "SearchRouter.h"
#import "DetailRouter.h"

@implementation SearchRouter

+ (void) pushDetailWithIdentifier: (NSString *) identifier {
    [DetailRouter pushWithIdentifier: identifier];
}

@end
