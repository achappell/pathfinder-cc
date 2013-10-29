//
//  PFCAbilityScoreCollectionViewCell.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCAbilityScoreCollectionViewCell.h"
#import "PFCAbilityScore.h"

@implementation PFCAbilityScoreCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [self configureViews];
}

- (void)setCharacter:(PFCCharacter *)character
{
    if (_character == character)
        return;
    
    _character = character;
    
    self.strengthLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.strength baseScore] integerValue]];
    self.dexterityLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.dexterity baseScore] integerValue]];
    self.constitutionLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.constitution baseScore] integerValue]];
    self.intelligenceLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.intelligence baseScore] integerValue]];
    self.wisdomLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.wisdom baseScore] integerValue]];
    self.charismaLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.charisma baseScore] integerValue]];
    
    self.strengthModLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.strength abilityModifier] integerValue]];
    self.dexterityModLabel.text = [NSString stringWithFormat:@"%li", (long)[[character.dexterity abilityModifier] integerValue]];
    self.constitutionModLabel.text = [NSString stringWithFormat:@"%li", [[character.constitution abilityModifier] integerValue]];
    self.intelligenceModLabel.text = [NSString stringWithFormat:@"%li", [[character.intelligence abilityModifier] integerValue]];
    self.wisdomModLabel.text = [NSString stringWithFormat:@"%li", [[character.wisdom abilityModifier] integerValue]];
    self.charismaModLabel.text = [NSString stringWithFormat:@"%li", [[character.charisma abilityModifier] integerValue]];
    
    self.strengthTempAdjLabel.text = [NSString stringWithFormat:@"%li", [[character.strength tempAdjustment] integerValue]];
    self.dexterityTempAdjLabel.text = [NSString stringWithFormat:@"%li", [[character.dexterity tempAdjustment] integerValue]];
    self.constitutionTempAdjLabel.text = [NSString stringWithFormat:@"%li", [[character.constitution tempAdjustment] integerValue]];
    self.intelligenceTempAdjLabel.text = [NSString stringWithFormat:@"%li", [[character.intelligence tempAdjustment] integerValue]];
    self.wisdomTempAdjLabel.text = [NSString stringWithFormat:@"%li", [[character.wisdom tempAdjustment] integerValue]];
    self.charismaTempAdjLabel.text = [NSString stringWithFormat:@"%li", [[character.charisma tempAdjustment] integerValue]];
    
    self.strengthTempModLabel.text = [NSString stringWithFormat:@"%li", [[character.strength tempModifier] integerValue]];
    self.dexterityTempModLabel.text = [NSString stringWithFormat:@"%li", [[character.dexterity tempModifier] integerValue]];
    self.constitutionTempModLabel.text = [NSString stringWithFormat:@"%li", [[character.constitution tempModifier] integerValue]];
    self.intelligenceTempModLabel.text = [NSString stringWithFormat:@"%li", [[character.intelligence tempModifier] integerValue]];
    self.wisdomTempModLabel.text = [NSString stringWithFormat:@"%li", [[character.wisdom tempModifier] integerValue]];
    self.charismaTempModLabel.text = [NSString stringWithFormat:@"%li", [[character.charisma tempModifier] integerValue]];
}

- (void)configureViews
{
    self.strengthLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.strengthLabel.layer.borderWidth = 1.0f;
    self.dexterityLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.dexterityLabel.layer.borderWidth = 1.0f;
    self.constitutionLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.constitutionLabel.layer.borderWidth = 1.0f;
    self.intelligenceLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.intelligenceLabel.layer.borderWidth = 1.0f;
    self.wisdomLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.wisdomLabel.layer.borderWidth = 1.0f;
    self.charismaLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.charismaLabel.layer.borderWidth = 1.0f;
    
    self.strengthModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.strengthModLabel.layer.borderWidth = 1.0f;
    self.dexterityModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.dexterityModLabel.layer.borderWidth = 1.0f;
    self.constitutionModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.constitutionModLabel.layer.borderWidth = 1.0f;
    self.intelligenceModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.intelligenceModLabel.layer.borderWidth = 1.0f;
    self.wisdomModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.wisdomModLabel.layer.borderWidth = 1.0f;
    self.charismaModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.charismaModLabel.layer.borderWidth = 1.0f;
    
    self.strengthTempAdjLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.strengthTempAdjLabel.layer.borderWidth = 1.0f;
    self.dexterityTempAdjLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.dexterityTempAdjLabel.layer.borderWidth = 1.0f;
    self.constitutionTempAdjLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.constitutionTempAdjLabel.layer.borderWidth = 1.0f;
    self.intelligenceTempAdjLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.intelligenceTempAdjLabel.layer.borderWidth = 1.0f;
    self.wisdomTempAdjLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.wisdomTempAdjLabel.layer.borderWidth = 1.0f;
    self.charismaTempAdjLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.charismaTempAdjLabel.layer.borderWidth = 1.0f;
    
    self.strengthTempModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.strengthTempModLabel.layer.borderWidth = 1.0f;
    self.dexterityTempModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.dexterityTempModLabel.layer.borderWidth = 1.0f;
    self.constitutionTempModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.constitutionTempModLabel.layer.borderWidth = 1.0f;
    self.intelligenceTempModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.intelligenceTempModLabel.layer.borderWidth = 1.0f;
    self.wisdomTempModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.wisdomTempModLabel.layer.borderWidth = 1.0f;
    self.charismaTempModLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.charismaTempModLabel.layer.borderWidth = 1.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
