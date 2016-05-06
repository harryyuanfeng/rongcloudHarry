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
    
    //[self.navigationController push]
    // Do any additional setup after loading the view, typically from a nib.
    
    [[RCIM sharedRCIM] initWithAppKey:@"sfci50a7c2l9i"];
    NSDictionary *parameters = @{@"username": @"harry",@"id": @"001",@"imageUrl": @"bar"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://localhost:3000/getRongToken" parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSString *results = [responseObject valueForKey:@"token"];
        tabBarController *mytabbar = [[tabBarController alloc] init];
        
        [self.navigationController pushViewController:mytabbar animated:YES];
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
