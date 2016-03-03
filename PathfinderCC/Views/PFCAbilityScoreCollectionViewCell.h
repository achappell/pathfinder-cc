//
//  PFCAbilityScoreCollectionViewCell.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Character;

@interface PFCAbilityScoreCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) Character *character;

@property (nonatomic, weak) IBOutlet UILabel *strengthLabel;
@property (nonatomic, weak) IBOutlet UILabel *dexterityLabel;
@property (nonatomic, weak) IBOutlet UILabel *constitutionLabel;
@property (nonatomic, weak) IBOutlet UILabel *intelligenceLabel;
@property (nonatomic, weak) IBOutlet UILabel *wisdomLabel;
@property (nonatomic, weak) IBOutlet UILabel *charismaLabel;

@property (nonatomic, weak) IBOutlet UILabel *strengthModLabel;
@property (nonatomic, weak) IBOutlet UILabel *dexterityModLabel;
@property (nonatomic, weak) IBOutlet UILabel *constitutionModLabel;
@property (nonatomic, weak) IBOutlet UILabel *intelligenceModLabel;
@property (nonatomic, weak) IBOutlet UILabel *wisdomModLabel;
@property (nonatomic, weak) IBOutlet UILabel *charismaModLabel;

@property (nonatomic, weak) IBOutlet UILabel *strengthTempAdjLabel;
@property (nonatomic, weak) IBOutlet UILabel *dexterityTempAdjLabel;
@property (nonatomic, weak) IBOutlet UILabel *constitutionTempAdjLabel;
@property (nonatomic, weak) IBOutlet UILabel *intelligenceTempAdjLabel;
@property (nonatomic, weak) IBOutlet UILabel *wisdomTempAdjLabel;
@property (nonatomic, weak) IBOutlet UILabel *charismaTempAdjLabel;

@property (nonatomic, weak) IBOutlet UILabel *strengthTempModLabel;
@property (nonatomic, weak) IBOutlet UILabel *dexterityTempModLabel;
@property (nonatomic, weak) IBOutlet UILabel *constitutionTempModLabel;
@property (nonatomic, weak) IBOutlet UILabel *intelligenceTempModLabel;
@property (nonatomic, weak) IBOutlet UILabel *wisdomTempModLabel;
@property (nonatomic, weak) IBOutlet UILabel *charismaTempModLabel;

- (void)configureViews;
- (void)awakeFromNib;

@end
