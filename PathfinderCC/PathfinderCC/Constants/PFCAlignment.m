//
//  PFCAlignment.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/30/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCAlignment.h"

NSString * const PFCAlignmentLawfulGood = @"PFCAlignmentLawfulGood";
NSString * const PFCAlignmentNeutralGood = @"PFCAlignmentNeutralGood";
NSString * const PFCAlignmentChaoticGood = @"PFCAlignmentChaoticGood";
NSString * const PFCAlignmentLawfulNeutral = @"PFCAlignmentLawfulNeutral";
NSString * const PFCAlignmentNeutral = @"PFCAlignmentNeutral";
NSString * const PFCAlignmentChaoticNeutral = @"PFCAlignmentChaoticNeutral";
NSString * const PFCAlignmentLawfulEvil = @"PFCAlignmentLawfulEvil";
NSString * const PFCAlignmentNeutralEvil = @"PFCAlignmentNeutralEvil";
NSString * const PFCAlignmentChaoticEvil = @"PFCAlignmentChaoticEvil";

@implementation PFCAlignment

+ (NSString *)displayNameForAlignment:(NSString *)alignment
{
    NSString *displayName;
    
    if ([alignment isEqualToString:PFCAlignmentLawfulGood])
    {
        displayName = @"Lawful Good";
    }
    else if ([alignment isEqualToString:PFCAlignmentNeutralGood])
    {
        displayName = @"Neutral Good";
    }
    else if ([alignment isEqualToString:PFCAlignmentChaoticGood])
    {
        displayName = @"Chaotic Good";
    }
    else if ([alignment isEqualToString:PFCAlignmentLawfulNeutral])
    {
        displayName = @"Lawful Neutral";
    }
    else if ([alignment isEqualToString:PFCAlignmentNeutral])
    {
        displayName = @"Neutral";
    }
    else if ([alignment isEqualToString:PFCAlignmentChaoticNeutral])
    {
        displayName = @"Chaotic Neutral";
    }
    else if ([alignment isEqualToString:PFCAlignmentLawfulEvil])
    {
        displayName = @"Lawful Evil";
    }
    else if ([alignment isEqualToString:PFCAlignmentNeutralEvil])
    {
        displayName = @"Neutral Evil";
    }
    else if ([alignment isEqualToString:PFCAlignmentChaoticEvil])
    {
        displayName = @"Chaotic Evil";
    }
    
    return displayName;
}

@end

