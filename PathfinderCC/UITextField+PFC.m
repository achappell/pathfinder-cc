//
//  UITextField+PFC.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 4/21/14.
//  Copyright (c) 2014 Amanda Chappell. All rights reserved.
//

#import "UITextField+PFC.h"

@implementation UITextField (PFC)

- (BOOL)hasValidText
{
    return !([[self text] isEqualToString:@""] || ![self text]);
}

@end
