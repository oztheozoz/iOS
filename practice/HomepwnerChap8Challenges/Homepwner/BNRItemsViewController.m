//
//  BNRItems.m
//  Homepwner
//
//  Created by Osbert Orr on 10/22/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
@interface BNRItemsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *itemsGT50;
@property (nonatomic, strong) NSArray *itemsLE50;
@end

@implementation BNRItemsViewController
- (instancetype)init {
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        for (int i = 0; i < 30; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
        
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        NSPredicate *predicateGreaterThan50 = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
        NSPredicate *predicateLessEqualTo50 = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
        self.itemsGT50 = [items filteredArrayUsingPredicate:predicateGreaterThan50];
        self.itemsLE50 = [items filteredArrayUsingPredicate:predicateLessEqualTo50];
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        
        cell.textLabel.text = @"No more items!";
        [self.tableView setTableFooterView:cell];
        
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"halo4_master-chief-01-highres"]];
        [self.tableView setBackgroundView:iv];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"Values greater than 50";
    } else {
        return @"Values less than or equal to 50";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"section = %ld", section);
    
    if(section == 0) {
        return [self.itemsGT50 count];
    } else {
        return [self.itemsLE50 count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSLog(@"section = %ld row = %ld", indexPath.section, indexPath.row);
    BNRItem *item;
    
    if(indexPath.section == 0) {
        item = self.itemsGT50[indexPath.row];
    } else {
        item = self.itemsLE50[indexPath.row];
    }
    NSLog(@"item = %@", item.itemName);
    cell.textLabel.text = [item description];
    cell.textLabel.font = [cell.textLabel.font fontWithSize:20.0];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}
@end
