//
//  PFCCharacterListDataSource.m
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/29/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCFetchedResultsControllerDataSource.h"

@interface PFCFetchedResultsControllerDataSource ()

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation PFCFetchedResultsControllerDataSource

- (id)initWithTableView:(UITableView*)tableView
{
    self = [super init];
    if (self) {
        self.tableView = tableView;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)setFetchedResultsController:(NSFetchedResultsController*)fetchedResultsController
{
    _fetchedResultsController = fetchedResultsController;
    fetchedResultsController.delegate = self;
    [fetchedResultsController performFetch:NULL];
}

#pragma mark = UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return (NSInteger)self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    id<NSFetchedResultsSectionInfo> section = self.fetchedResultsController.sections[(NSUInteger)sectionIndex];
    return (NSInteger)section.numberOfObjects;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    id object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    id cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier
                                              forIndexPath:indexPath];
    [self.delegate configureCell:cell withObject:object];
    return cell;
}

- (BOOL)tableView:(UITableView*)tableView canEditRowAtIndexPath:(NSIndexPath*)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.delegate deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
    }
}

#pragma mark NSFetchedResultsControllerDelegate

- (void)controllerWillChangeContent:(NSFetchedResultsController*)controller
{
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController*)controller
{
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController*)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath*)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath*)newIndexPath
{
    if (type == NSFetchedResultsChangeInsert)
    {
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else if (type == NSFetchedResultsChangeMove)
    {
        [self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
    }
    else if (type == NSFetchedResultsChangeDelete)
    {
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else if (type == NSFetchedResultsChangeUpdate)
    {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        NSAssert(NO,@"");
    }
}

- (id)selectedItem
{
    NSIndexPath* path = self.tableView.indexPathForSelectedRow;
    return path ? [self.fetchedResultsController objectAtIndexPath:path] : nil;
}


- (void)setPaused:(BOOL)paused
{
    _paused = paused;
    if (paused)
    {
        self.fetchedResultsController.delegate = nil;
    }
    else
    {
        self.fetchedResultsController.delegate = self;
        [self.fetchedResultsController performFetch:NULL];
        [self.tableView reloadData];
    }
}

@end
