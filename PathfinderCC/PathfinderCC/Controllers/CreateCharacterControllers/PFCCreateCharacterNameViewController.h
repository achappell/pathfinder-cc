//
//  PFCCreateCharacterNameViewController.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/29/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFCCharacter.h"

@interface PFCCreateCharacterNameViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UISegmentedControl *genderSegmentedControl;
@property (nonatomic, weak) IBOutlet UIButton *alignmentButton;
@property (nonatomic, weak) IBOutlet UITextField *ageTextField;

@property (nonatomic, strong) PFCCharacter *character;

@end
