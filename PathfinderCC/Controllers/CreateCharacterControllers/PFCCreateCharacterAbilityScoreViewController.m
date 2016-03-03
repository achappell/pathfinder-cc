//
//  PFCCreateCharacterStep1ViewController.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCreateCharacterAbilityScoreViewController.h"
#import "PFCCreateCharacterNameViewController.h"
#import "UITextField+PFC.h"
#import "PathfinderCC-Swift.h"

@interface PFCCreateCharacterAbilityScoreViewController ()

@property (nonatomic, weak) UITextField *activeField;

@end

@implementation PFCCreateCharacterAbilityScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self registerForKeyboardNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL)shouldAllowNextNavigation
{
    BOOL shouldAllowNextNavigation = NO;
    
    if ([self.strengthTextField hasValidText] && [self.dexterityTextField hasValidText] && [self.constitutionTextField hasValidText] && [self.intelligenceTextField hasValidText] && [self.wisdomTextField hasValidText] && [self.charismaTextField hasValidText])
        shouldAllowNextNavigation = YES;
    
    return shouldAllowNextNavigation;
}

- (Character *)createCharacter
{
    // create character with ability scores
    NSNumber *strength = @([self.strengthTextField.text integerValue]);
    AbilityScore *strengthScore = [AbilityScore insertItemWithBaseScore:strength type:AbilityTypeStrength];
    
    NSNumber *dexterity = @([self.dexterityTextField.text integerValue]);
    AbilityScore *dexterityScore = [AbilityScore insertItemWithBaseScore:dexterity type:AbilityTypeDexterity];
    
    NSNumber *constitution = @([self.constitutionTextField.text integerValue]);
    AbilityScore *constitutionScore = [AbilityScore insertItemWithBaseScore:constitution type:AbilityTypeConstitution];
    
    NSNumber *intelligence = @([self.intelligenceTextField.text integerValue]);
    AbilityScore *intelligenceScore = [AbilityScore insertItemWithBaseScore:intelligence type:AbilityTypeIntelligence];
    
    NSNumber *wisdom = @([self.wisdomTextField.text integerValue]);
    AbilityScore *wisdomScore = [AbilityScore insertItemWithBaseScore:wisdom type:AbilityTypeWisdom];
    
    NSNumber *charisma = @([self.charismaTextField.text integerValue]);
    AbilityScore *charismaScore = [AbilityScore insertItemWithBaseScore:charisma type:AbilityTypeCharisma];
    
    Character *character = [Character insertItemWithAbilityScores:[NSSet setWithObjects:strengthScore, dexterityScore, constitutionScore, intelligenceScore, wisdomScore, charismaScore, nil]];
    
    return character;
}

#pragma mark - Keyboard Events

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [info[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

#pragma mark = UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.strengthTextField)
    {
        [self.dexterityTextField becomeFirstResponder];
    }
    else if (textField == self.dexterityTextField)
    {
        [self.constitutionTextField becomeFirstResponder];
    }
    else if (textField == self.constitutionTextField)
    {
        [self.intelligenceTextField becomeFirstResponder];
    }
    else if (textField == self.intelligenceTextField)
    {
        [self.wisdomTextField becomeFirstResponder];
    }
    else if (textField == self.wisdomTextField)
    {
        [self.charismaTextField becomeFirstResponder];
    }
    else
    {
        [textField resignFirstResponder];
    }
    
    self.nextBarButtonItem.enabled = [self shouldAllowNextNavigation];
    
    return YES;
}

#pragma mark = IBActions

-(IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark = Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Character *character = [self createCharacter];
    
    PFCCreateCharacterNameViewController *viewController = (PFCCreateCharacterNameViewController *)segue.destinationViewController;
    viewController.character = character;
    viewController.store = self.store;
}

@end
