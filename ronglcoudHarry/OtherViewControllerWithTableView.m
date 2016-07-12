//
//  OtherViewControllerWithTableView.m
//  ronglcoudHarry
//
//  Created by harryfeng on 7/12/16.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "OtherViewControllerWithTableView.h"

@interface OtherViewControllerWithTableView ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableView;
}
@end

@implementation OtherViewControllerWithTableView

-(void)viewDidLoad{
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
     tableView.backgroundColor = [UIColor cyanColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"newFriendCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @"hello";
    //etc.
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}

@end
