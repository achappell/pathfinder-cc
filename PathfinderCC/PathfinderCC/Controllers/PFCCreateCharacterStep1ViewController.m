//
//  PFCCreateCharacterStep1ViewController.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCreateCharacterStep1ViewController.h"
#import "PFCCharacter.h"
#import "PFCAbilityScore.h"
#import "PFCCharacterSheetViewController.h"

@interface PFCCreateCharacterStep1ViewController ()

@property (nonatomic, weak) UITextField *activeField;

@end

@implementation PFCCreateCharacterStep1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    if ([[self.strengthTextField text] isEqualToString:@""] || ![self.strengthTextField text])
        return NO;
    if ([[self.dexterityTextField text] isEqualToString:@""] || ![self.dexterityTextField text])
        return NO;
    if ([[self.constitutionTextField text] isEqualToString:@""] || ![self.constitutionTextField text])
        return NO;
    if ([[self.intelligenceTextField text] isEqualToString:@""] || ![self.intelligenceTextField text])
        return NO;
    if ([[self.wisdomTextField text] isEqualToString:@""] || ![self.wisdomTextField text])
        return NO;
    if ([[self.charismaTextField text] isEqualToString:@""] || ![self.charismaTextField text])
        return NO;
    
    return YES;
}

#pragma mark - Keyboard Events

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
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

-(IBAction)next:(id)sender
{
    // create character with ability scores
    NSNumber *strength = @([self.strengthTextField.text integerValue]);
    PFCAbilityScore *strengthScore = [PFCAbilityScore insertItemWithBaseScore:strength type:PFCAbilityTypeStrength inManagedObjectContext:self.store.managedObjectContext];
    
    NSNumber *dexterity = @([self.dexterityTextField.text integerValue]);
    PFCAbilityScore *dexterityScore = [PFCAbilityScore insertItemWithBaseScore:dexterity type:PFCAbilityTypeDexterity inManagedObjectContext:self.store.managedObjectContext];
    
    NSNumber *constitution = @([self.constitutionTextField.text integerValue]);
    PFCAbilityScore *constitutionScore = [PFCAbilityScore insertItemWithBaseScore:constitution type:PFCAbilityTypeConstitution inManagedObjectContext:self.store.managedObjectContext];
    
    NSNumber *intelligence = @([self.intelligenceTextField.text integerValue]);
    PFCAbilityScore *intelligenceScore = [PFCAbilityScore insertItemWithBaseScore:intelligence type:PFCAbilityTypeIntelligence inManagedObjectContext:self.store.managedObjectContext];
    
    NSNumber *wisdom = @([self.wisdomTextField.text integerValue]);
    PFCAbilityScore *wisdomScore = [PFCAbilityScore insertItemWithBaseScore:wisdom type:PFCAbilityTypeWisdom inManagedObjectContext:self.store.managedObjectContext];
    
    NSNumber *charisma = @([self.charismaTextField.text integerValue]);
    PFCAbilityScore *charismaScore = [PFCAbilityScore insertItemWithBaseScore:charisma type:PFCAbilityTypeCharisma inManagedObjectContext:self.store.managedObjectContext];
    
    PFCCharacter *character = [PFCCharacter insertItemWithAbilityScores:[NSSet setWithObjects:strengthScore, dexterityScore, constitutionScore, intelligenceScore, wisdomScore, charismaScore, nil] inManagedObjectContext:self.store.managedObjectContext];
    
}

#pragma mark = Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PFCCharacterSheetViewController *viewController = (PFCCharacterSheetViewController *)sender;
    self.store = viewController.store;
}

@end
