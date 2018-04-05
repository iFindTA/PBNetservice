//
//  ViewController.m
//  PBNetService
//
//  Created by nanhujiaju on 2017/9/8.
//  Copyright © 2017年 nanhujiaju. All rights reserved.
//

#import "ViewController.h"
#import "FLKNetService.h"
#import <PBKits/PBKits.h>
#import "PBService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"home:%@", NSHomeDirectory());
    
//    FLKNetConfiguration *cfg = [FLKNetConfiguration defaultConfiguration];
//    cfg.debugDomain = @"http://demo.qiyemixin.com/";
//    [FLKNetworkManager startWithConfiguration:cfg];
    
    //test for protobuf
    NSString *baseString = @"https://v2.api.chinaxqjy.com";
    [PBService configBaseURL:baseString];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 50);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"Protobuf" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(protobufTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //
}

- (IBAction)signInAction:(id)sender {
    
    NSMutableDictionary *auth = [NSMutableDictionary dictionary];
    NSString *password1 = [@"123456" pb_SHA256];
    
    auth[@"uid"] = @"13023622337";
    auth[@"password"] = password1;
    auth[@"mechanism"] = @"sha256";
#if DEBUG
    auth[@"prod_type"] = @"DEV";
    //@"versions/dev/iphone";
#else
    auth[@"prod_type"] = @"PROD";
    
#endif
    
    NSMutableDictionary *clientInfo = [NSMutableDictionary dictionary];
    NSString *moreInfo = nil;
    NSString *pushkitInfo = nil;
    if (moreInfo) {
        clientInfo[@"apns_id"] = moreInfo;
    }
    if(pushkitInfo){
        clientInfo[@"pushkit_id"] = pushkitInfo;
    }
    clientInfo[@"push_type"] = @"ios";
    moreInfo = @"1.0.0";
    if (moreInfo) {
        clientInfo[@"client_version"] = moreInfo;
    }
    UIDevice *device = [UIDevice currentDevice];
    moreInfo = [device systemVersion];
    if (moreInfo) {
        clientInfo[@"os_version"] = moreInfo;
    }
    clientInfo [@"build_version"] = [NSBundle pb_buildVersion];
    clientInfo[@"os_type"] = @"iOS";
    moreInfo = [device model];
    if (moreInfo) {
        clientInfo[@"model"] = moreInfo;
    }
    moreInfo = [device name];
    if (moreInfo) {
        clientInfo[@"user_agent"] = moreInfo;
    }
    auth[@"client_info"] = clientInfo;
    auth[@"channel"] = @"native";
    
    NSString *path = [NSString stringWithFormat:@"/users/3/new/login"];
    
    [[FLKComAPI shared] POST:path parameters:auth progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success--%@--%@",[responseObject class],responseObject);
        
        [self updateTokenWhileSuccessful4Info:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"failure--%@",error);
    }];
    
}

- (void)updateTokenWhileSuccessful4Info:(NSDictionary *)resObj {
    NSString *token = [resObj objectForKey:@"token"];
    //[FLKNetworkManager updateAuthoziedToken:@"688cdc6d2388b5f2ac785269e3473159" forKey:@"Authorization"];
    [FLKNetworkManager updateAuthoziedToken:token forKey:@"Authorization"];
}

#pragma mark --- ProtoBuf test ---

- (void)protobufTest {
    NSLog(@"test for protobuf");
    
    [[PBService shared] test4Protobuf];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
