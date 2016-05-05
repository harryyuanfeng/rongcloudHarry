//
//  tabBarController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "tabBarController.h"

@implementation tabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *view1 = [[UIViewController alloc] init];
    UIViewController *view2 = [[UIViewController alloc] init];
    UIViewController *view3 = [[UIViewController alloc] init];
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:view1];
    [tabViewControllers addObject:view2];
    [tabViewControllers addObject:view3];
    
    [self setViewControllers:tabViewControllers];
    //can't set this until after its added to the tab bar
    view1.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"view1"
                                  image:[UIImage imageNamed:@"view1"]
                                    tag:1];
    view2.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"view2"
                                  image:[UIImage imageNamed:@"view3"]
                                    tag:2];
    view3.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"view3"
                                  image:[UIImage imageNamed:@"view3"]
                                    tag:3];
}

@end
