//
//  PFCCharacterSheetViewController.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFCCharacter.h"
#import "PFCStore.h"

@interface PFCCharacterSheetViewController : UICollectionViewController

@property (nonatomic, strong) PFCCharacter *character;
@property (nonatomic, strong) PFCStore *store;

@end
