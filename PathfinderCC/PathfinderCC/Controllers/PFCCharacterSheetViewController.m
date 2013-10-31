//
//  PFCCharacterSheetViewController.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/27/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCharacterSheetViewController.h"
#import "PFCAbilityScoreCollectionViewCell.h"
#import "PFCCreateCharacterAbilityScoreViewController.h"

@interface PFCCharacterSheetViewController ()

@end

@implementation PFCCharacterSheetViewController

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
    // Do any additional setup after loading the view from its nib.
    
    [self.collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"NoCharacterHeader"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.character = [self.store selectedCharacter];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createCharacter:(id)sender
{
    [self performSegueWithIdentifier:@"CreateCharacter" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
    PFCCreateCharacterAbilityScoreViewController *createViewController = (PFCCreateCharacterAbilityScoreViewController *)navController.topViewController;
    createViewController.store = self.store;
}

#pragma mark - UICollectionViewDataSource

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (self.character)
    {
        PFCAbilityScoreCollectionViewCell *collectionViewCell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"AbilityHeader" forIndexPath:indexPath];
        
        [collectionViewCell setCharacter:self.character];
        
        return collectionViewCell;
    }
    else
    {
        UICollectionViewCell *collectionViewCell = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"NoCharacterHeader" forIndexPath:indexPath];
        
        UIButton *createCharacterButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [createCharacterButton setTitle:@"Create Character" forState:UIControlStateNormal];
        [createCharacterButton sizeToFit];
        createCharacterButton.center = CGPointMake(CGRectGetWidth(collectionViewCell.bounds)/2.0f, CGRectGetHeight(collectionViewCell.bounds)/2.0f);
        [createCharacterButton addTarget:self action:@selector(createCharacter:) forControlEvents:UIControlEventTouchUpInside];
        
        [collectionViewCell addSubview:createCharacterButton];
        
        return collectionViewCell;
    }
}

@end
