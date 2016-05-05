//
//  ViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "ViewController.h"
#import "tabBarController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tabBarController *mytabbar = [[tabBarController alloc] init];
    [self.navigationController pushViewController:mytabbar animated:YES];
    //[self.navigationController push]
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
