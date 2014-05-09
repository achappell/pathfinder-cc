//
//  PFCCreateCharacterStep1ViewController.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFCStore.h"

@interface PFCCreateCharacterAbilityScoreViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UITextField *strengthTextField;
@property (nonatomic, weak) IBOutlet UITextField *dexterityTextField;
@property (nonatomic, weak) IBOutlet UITextField *constitutionTextField;
@property (nonatomic, weak) IBOutlet UITextField *intelligenceTextField;
@property (nonatomic, weak) IBOutlet UITextField *wisdomTextField;
@property (nonatomic, weak) IBOutlet UITextField *charismaTextField;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *nextBarButtonItem;

@property (nonatomic, strong) PFCStore *store;

-(IBAction)cancel:(id)sender;

- (BOOL)shouldAllowNextNavigation;
- (void)registerForKeyboardNotifications;
- (void)keyboardWasShown:(NSNotification*)aNotification;
- (void)keyboardWillBeHidden:(NSNotification*)aNotification;
- (PFCCharacter *)createCharacter;

@end
