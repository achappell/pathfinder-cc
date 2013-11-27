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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"NoCharacterHeader"];
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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.character)
    {
        PFCAbilityScoreCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AbilityHeader" forIndexPath:indexPath];
        
        [collectionViewCell setCharacter:self.character];
        
        return collectionViewCell;
    }
    else
    {
        UICollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NoCharacterHeader" forIndexPath:indexPath];
        
        UIButton *createCharacterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [createCharacterButton setTitle:@"Create Character" forState:UIControlStateNormal];
        [createCharacterButton sizeToFit];
        createCharacterButton.center = CGPointMake(CGRectGetWidth(collectionViewCell.bounds)/2.0f, CGRectGetHeight(collectionViewCell.bounds)/2.0f);
        [createCharacterButton addTarget:self action:@selector(createCharacter:) forControlEvents:UIControlEventTouchUpInside];
        
        [collectionViewCell addSubview:createCharacterButton];
        
        return collectionViewCell;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

@end
