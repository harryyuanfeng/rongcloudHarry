//
//  chatVC.m
//  ronglcoudHarry
//
//  Created by harryfeng on 5/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "chatVC.h"

@implementation chatVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    
    //self.view.backgroundColor = [UIColor whiteColor];
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    
    [[RCIM sharedRCIM] connectWithToken:@"FgdWUXmnVfiuGkfAKOju0MPxV2b5Ftt3shnq/yTHLkJPBRN86LX8uuksyWT8ywEDXyocc13S+hhdQNBqCT7+AQ==" success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%d", status);
    } tokenIncorrect:^{
        
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
}
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion{
    NSLog(@"getUserInfoWithUserIdn %@",userId);
    if([userId isEqualToString:@"harry1"]){
        NSLog(@"getUserInfoWithUserId 001");
        RCUserInfo*userInfo = [[RCUserInfo alloc] init];
        userInfo.userId = userId;
        
        userInfo.name = @"hi";
        userInfo.portraitUri = @"http://ac-oasq3bau.clouddn.com/1a7aedbfba7333cb.jpg";
        return completion(userInfo);
    }
    return completion(nil);
    
}


- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:conversationVC animated:YES];
}

@end
