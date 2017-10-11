//
//  WXScanQRModule.m
//  WeexDemo
//
//  Created by zhanshu1 on 2017/10/9.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "WXScanQRModule.h"
#import <AVFoundation/AVFoundation.h>
#import <WeexPluginLoader/WeexPluginLoader.h>
#import "SGQRCodeScanningVC.h"
@implementation WXScanQRModule

@synthesize weexInstance;
WX_PlUGIN_EXPORT_MODULE(weexScanQR, WXScanQRModule)
WX_EXPORT_METHOD(@selector(scanQR:callBack:))
- (void)scanQR:(NSString *)title callBack:(WXModuleCallback)callback
{
    
    self.callBack=callback;
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_sync(dispatch_get_main_queue(), ^{
                         SGQRCodeScanningVC *vc = [[SGQRCodeScanningVC alloc] init];
                        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc ];
                       nav.navigationBar.barStyle=UIBarStyleBlack;
                        vc.callBack = self.callBack;
                        vc.navigationItem.title =title.length?title:@"扫一扫";
                        [[weexInstance.viewController navigationController] presentViewController:nav animated:YES completion:nil];
                    });
                    // 用户第一次同意了访问相机权限
                    NSLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    
                } else {
                    // 用户第一次拒绝了访问相机权限
                    NSLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    self.callBack(@{@"status":@"error",@"msg":@"用户第一次拒绝了访问相机权限"});
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            SGQRCodeScanningVC *vc = [[SGQRCodeScanningVC alloc] init];
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc ];
             nav.navigationBar.barStyle=UIBarStyleBlack;
            
            vc.callBack = self.callBack;
            vc.navigationItem.title =title.length?title:@"扫一扫";
            [[weexInstance.viewController navigationController] presentViewController:nav animated:YES completion:nil];
        } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [[weexInstance.viewController navigationController] presentViewController:alertC animated:YES completion:nil];
            self.callBack(@{@"status":@"error",@"msg":@"用户拒绝当前应用访问相机"});
            
        } else if (status == AVAuthorizationStatusRestricted) {
            NSLog(@"因为系统原因, 无法访问相册");
             self.callBack(@{@"status":@"error",@"msg":@"因为系统原因, 无法访问相册"});
        }
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alertA];
        [[weexInstance.viewController navigationController] presentViewController:alertC animated:YES completion:nil];
       self.callBack(@{@"status":@"error",@"msg":@"未检测到您的摄像头"});
    }
}

@end

