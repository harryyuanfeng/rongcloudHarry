//
//  OtherViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 11/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "OtherViewController.h"
#import "DBCameraViewController.h"
#import "DBCameraContainerViewController.h"
#import "WevViewViewController.h"
#import "LoadMoreViewController.h"
#import "YouMengViewController.h"
@interface OtherViewController ()<DBCameraViewControllerDelegate>

@end
UIButton *DBCamera;
UIButton *WebViewButton;
UIButton *loadMore;
UIButton *youmeng;
@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    DBCamera = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    [DBCamera addTarget:self action:@selector(openCamera) forControlEvents:UIControlEventTouchDown];
    [DBCamera setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [DBCamera setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [DBCamera setTitle:@"DBcamera" forState:UIControlStateNormal];
    [DBCamera setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:DBCamera];
    
    WebViewButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 240, 200, 30)];
    [WebViewButton addTarget:self action:@selector(clickWebViewButton) forControlEvents:UIControlEventTouchDown];
    [WebViewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [WebViewButton setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [WebViewButton setTitle:@"WebViewButton" forState:UIControlStateNormal];
    [WebViewButton setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:WebViewButton];
    
    loadMore = [[UIButton alloc] initWithFrame:CGRectMake(100, 280, 200, 30)];
    [loadMore addTarget:self action:@selector(clickLoadMore) forControlEvents:UIControlEventTouchDown];
    [loadMore setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loadMore setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [loadMore setTitle:@"loadMore" forState:UIControlStateNormal];
    [loadMore setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:loadMore];
    
    youmeng = [[UIButton alloc] initWithFrame:CGRectMake(100, 280, 200, 30)];
    [youmeng addTarget:self action:@selector(clickyoumeng) forControlEvents:UIControlEventTouchDown];
    [youmeng setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [youmeng setTitleColor:[UIColor redColor] forState:UIControlEventTouchDown];
    [youmeng setTitle:@"loadMore" forState:UIControlStateNormal];
    [youmeng setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:youmeng];
    
    
    // Do any additional setup after loading the view.
}

-(void)clickyoumeng{
    
}

-(void)clickWebViewButton{
    WevViewViewController *webview = [[WevViewViewController alloc] init];
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)clickLoadMore{
    LoadMoreViewController *webview = [[LoadMoreViewController alloc] init];
    [self.navigationController pushViewController:webview animated:YES];
}

- (void) openCamera
{
    DBCameraContainerViewController *cameraContainer = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    [cameraContainer setFullScreenMode];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraContainer];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void) openCameraWithoutSegue
{
    DBCameraViewController *cameraController = [DBCameraViewController initWithDelegate:self];
    [cameraController setUseCameraSegue:NO];
    
    DBCameraContainerViewController *container = [[DBCameraContainerViewController alloc] initWithDelegate:self];
    [container setCameraViewController:cameraController];
    [container setFullScreenMode];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:container];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void) openCameraWithoutContainer
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[DBCameraViewController initWithDelegate:self]];
    [nav setNavigationBarHidden:YES];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DBCameraViewControllerDelegate

- (void) camera:(id)cameraViewController didFinishWithImage:(UIImage *)image withMetadata:(NSDictionary *)metadata
{
    [cameraViewController restoreFullScreenMode];
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void) dismissCamera:(id)cameraViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
    [cameraViewController restoreFullScreenMode];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
