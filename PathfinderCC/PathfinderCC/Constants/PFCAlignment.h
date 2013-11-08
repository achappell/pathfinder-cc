//
//  PFCAlignment.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/30/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const PFCAlignmentLawfulGood;
extern NSString * const PFCAlignmentNeutralGood;
extern NSString * const PFCAlignmentChaoticGood;
extern NSString * const PFCAlignmentLawfulNeutral;
extern NSString * const PFCAlignmentNeutral;
extern NSString * const PFCAlignmentChaoticNeutral;
extern NSString * const PFCAlignmentLawfulEvil;
extern NSString * const PFCAlignmentNeutralEvil;
extern NSString * const PFCAlignmentChaoticEvil;

@interface PFCAlignment : NSObject

+ (NSString *)displayNameForAlignment:(NSString *)alignment;

@end
