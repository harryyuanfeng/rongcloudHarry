//
//  groupChatViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 8/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "groupChatViewController.h"

@interface groupChatViewController ()

@end

@implementation groupChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    DataBaseUtillity *dbs = [[DataBaseUtillity alloc] init];
    [dbs GetNormalStudentFriend:@"asldjfasdf" block:^(AVObject *result) {
        AVRelation *relation = [result relationForKey:@"friend"];
        AVQuery *query = [relation query];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (error) {
                // 网络错误
                NSLog(error.description);
            } else {
                NSMutableArray *userIdList = [NSMutableArray new];
                for (AVUser *user in objects) {
                    //[discussionTitle appendString:[NSString stringWithFormat:@"%@%@", user.name,@","]];
                    NSString *rcid = [user valueForKey:@"RCID"];
                    
                }
                [userIdList addObject:@"001"];
                [userIdList addObject:@"002"];
                [userIdList addObject:@"003"];
                [[RCIMClient sharedRCIMClient] createDiscussion:@"hello" userIdList:userIdList success:^(RCDiscussion *discussion) {
                    NSLog(@"create room success");
                    RCConversationViewController *room = [[RCConversationViewController alloc] init];
                    room.targetId                      = discussion.discussionId;
                    room.userName                    = discussion.discussionName;
                    room.conversationType              = ConversationType_DISCUSSION;
                    room.title                         = @"harrygroup";
                } error:^(RCErrorCode status) {
                    NSLog(@"create room error");
                }];
                
                NSLog(@"success");
            }
        }];
    }];
    //AVUser *cuser = [AVUser currentUser];
    
    AVRelation *relation = [[AVUser currentUser] relationForKey:@"friend"];
    AVQuery *query = [relation query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"find objects success");
        // objects 是一个 AVObject 的 NSArray，它包含所有当前 todoFolder 的 tags
    }];
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
