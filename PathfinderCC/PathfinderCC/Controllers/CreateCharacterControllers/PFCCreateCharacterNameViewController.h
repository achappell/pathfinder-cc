//
//  PFCCreateCharacterNameViewController.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/29/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFCCharacter.h"
#import "PFCStore.h"

@interface PFCCreateCharacterNameViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UISegmentedControl *genderSegmentedControl;
@property (nonatomic, weak) IBOutlet UIButton *alignmentButton;
@property (nonatomic, weak) IBOutlet UITextField *ageTextField;
@property (nonatomic, weak) IBOutlet UIPickerView *alignmentPickerView;

@property (nonatomic, strong) PFCCharacter *character;
@property (nonatomic, strong) PFCStore *store;

@end