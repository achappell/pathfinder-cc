//
//  PFCCharacterListViewController.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/29/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCCharacterListViewController.h"
#import "PFCFetchedResultsControllerDataSource.h"
#import "PFCCharacter.h"
#import "PFCCreateCharacterAbilityScoreViewController.h"

@interface PFCCharacterListViewController () <PFCFetchedResultsControllerDataSourceDelegate>

@property (nonatomic, strong) PFCFetchedResultsControllerDataSource* fetchedResultsControllerDataSource;

@end

@implementation PFCCharacterListViewController

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
    [self setupFetchedResultsController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.fetchedResultsControllerDataSource.paused = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.fetchedResultsControllerDataSource.paused = YES;
}

- (void)setupFetchedResultsController
{
    self.fetchedResultsControllerDataSource = [[PFCFetchedResultsControllerDataSource alloc] initWithTableView:self.tableView];
    self.fetchedResultsControllerDataSource.fetchedResultsController = [PFCCharacter allCharactersFetchedResultsControllerInManagedObjectContext:self.store.managedObjectContext];
    self.fetchedResultsControllerDataSource.delegate = self;
    self.fetchedResultsControllerDataSource.reuseIdentifier = @"Cell";
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
    PFCCreateCharacterAbilityScoreViewController *createViewController = (PFCCreateCharacterAbilityScoreViewController *)navController.topViewController;
    createViewController.store = self.store;
}

#pragma mark - PFCFetchedResultsControllerDataSourceDelegate

- (void)configureCell:(id)theCell withObject:(id)object
{
    UITableViewCell* cell = theCell;
    PFCCharacter* character = object;
    cell.textLabel.text = character.name;
}

- (void)deleteObject:(id)object
{
    PFCCharacter* character = object;
    NSString* actionName = [NSString stringWithFormat:NSLocalizedString(@"Delete \"%@\"", @"Delete undo action name"), character.name];
    [self.undoManager setActionName:actionName];
    [character.managedObjectContext deleteObject:character];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
