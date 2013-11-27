//
//  PFCCreateCharacterNameViewController.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/29/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCreateCharacterNameViewController.h"

@interface PFCCreateCharacterNameViewController ()

@end

@implementation PFCCreateCharacterNameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.selectedAlignment = PFCAlignmentLawfulGood;
    
    self.alignments = @[PFCAlignmentLawfulGood, PFCAlignmentNeutralGood, PFCAlignmentChaoticGood,
                        PFCAlignmentLawfulNeutral, PFCAlignmentNeutral, PFCAlignmentChaoticNeutral,
                        PFCAlignmentLawfulEvil, PFCAlignmentNeutralEvil, PFCAlignmentChaoticEvil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    self.character.name = self.nameTextField.text;
    self.character.age = [self.ageTextField.text integerValue];
    
    if (self.genderSegmentedControl.selectedSegmentIndex == 0)
        self.character.gender = PFCGenderMale;
    else
        self.character.gender = PFCGenderFemale;
    
    self.character.alignment = self.selectedAlignment;
    [self.store setSelectedCharacter:self.character];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.alignments count];
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.alignments.count > row)
        return [PFCAlignment displayNameForAlignment: self.alignments[row]];
    
    return [PFCAlignment displayNameForAlignment: PFCAlignmentLawfulGood];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.alignments.count > row)
        self.selectedAlignment = self.alignments[row];
    
    [self.alignmentButton setTitle:[PFCAlignment displayNameForAlignment:self.selectedAlignment] forState:UIControlStateNormal];
}

@end
