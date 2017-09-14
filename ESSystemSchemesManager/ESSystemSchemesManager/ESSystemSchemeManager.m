//
//  ESSystemSchemesManager.m
//  ESSystemSchemesManager
//
//  Created by codeLocker on 2017/7/31.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESSystemSchemeManager.h"

@implementation ESSystemSchemeManager
+ (void)openSystemScheme:(ESSystemSchemeType)type {
    NSString *scheme = nil;
    switch (type) {
        case ESSystemSchemeTypeSetting:
            scheme = UIApplicationOpenSettingsURLString;
            break;
        case ESSystemSchemeTypeCellular:
            scheme = @"MOBILE_DATA_SETTINGS_ID";
            break;
        case ESSystemSchemeTypeVPN:
            scheme = @"General&path=Network/VPN";
            break;
        case ESSystemSchemeTypeWIFI:
            scheme = @"WIFI";
            break;
        case ESSystemSchemeTypeLocation:
            scheme = @"LOCATION_SERVICES";
            break;
        case ESSystemSchemeTypeHotPoint:
            scheme = @"INTERNET_TETHERING";
            break;
        case ESSystemSchemeTypeAbout:
            scheme = @"General&path=About";
            break;
        case ESSystemSchemeTypeAccessibility:
            scheme = @"General&path=ACCESSIBILITY";
            break;
        case ESSystemSchemeTypeAirplane:
            scheme = @"AIRPLANE_MODE";
            break;
        case ESSystemSchemeTypeLock:
            scheme = @"General&path=AUTOLOCK";
            break;
        case ESSystemSchemeTypeBrightness:
            scheme = @"Brightness";
            break;
        case ESSystemSchemeTypeBluetooth:
            scheme = @"General&path=Bluetooth";
            break;
        case ESSystemSchemeTypeDateAndTime:
            scheme = @"General&path=DATE_AND_TIME";
            break;
        case ESSystemSchemeTypeFaceTime:
            scheme = @"FACETIME";
            break;
        case ESSystemSchemeTypeGeneral:
            scheme = @"General";
            break;
        case ESSystemSchemeTypeKeyboard:
            scheme = @"General&path=Keyboard";
            break;
        case ESSystemSchemeTypeICloud:
            scheme = @"CASTLE";
            break;
        case ESSystemSchemeTypeICloudBackup:
            scheme = @"CASTLE&path=STORAGE_AND_BACKUP";
            break;
        case ESSystemSchemeTypeLanguage:
            scheme = @"General&path=INTERNATIONAL";
            break;
        case ESSystemSchemeTypeMusic:
            scheme = @"MUSIC";
            break;
        case ESSystemSchemeTypeMusicEqualizer:
            scheme = @"MUSIC&path=EQ";
            break;
        case ESSystemSchemeTypeMusicVolumeLimit:
            scheme = @"MUSIC&path=VolumeLimit";
            break;
        case ESSystemSchemeTypeNetwork:
            scheme = @"General&path=Network";
            break;
        case ESSystemSchemeTypeNIKEIPod:
            scheme = @"NIKE_PLUS_IPOD";
            break;
        case ESSystemSchemeTypeNotes:
            scheme = @"NOTES";
            break;
        case ESSystemSchemeTypeNotification:
            scheme = @"NOTIFICATIONS_ID";
            break;
        case ESSystemSchemeTypePhone:
            scheme = @"Phone";
            break;
        case ESSystemSchemeTypePhotos:
            scheme = @"Photos";
            break;
        case ESSystemSchemeTypeProfiles:
            scheme = @"General&path=ManagedConfigurationList";
            break;
        case ESSystemSchemeTypeReset:
            scheme = @"General&path=Reset";
            break;
        case ESSystemSchemeTypeSafari:
            scheme = @"Safari";
            break;
        case ESSystemSchemeTypeSounds:
            scheme = @"Sounds";
            break;
        case ESSystemSchemeTypeSiri:
            scheme = @"General&path=Assistant";
            break;
        case ESSystemSchemeTypeSoftwareUpdate:
            scheme = @"General&path=SOFTWARE_UPDATE_LINK";
            break;
        case ESSystemSchemeTypeStore:
            scheme = @"STORE";
            break;
        case ESSystemSchemeTypeTwitter:
            scheme = @"TWITTER";
            break;
        case ESSystemSchemeTypeUsage:
            scheme = @"General&path=USAGE";
            break;
        case ESSystemSchemeTypeWallpaper:
            scheme = @"Wallpaper";
            break;
    }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10) {
        NSURL *url = [NSURL URLWithString:@"App-Prefs:root=Bluetooth"];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }else {
        NSURL *url = [NSURL URLWithString:@"prefs:root=Bluetooth"];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
            [[UIApplication sharedApplication] openURL:url];
#pragma GCC diagnostic pop
        }
    }
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"App-Prefs:root=%@",scheme]]];
}

+ (void)callTelephone:(NSString *)telephone  inView:(UIView *)view{
    if (!telephone || ![telephone isKindOfClass:[NSString class]] || telephone.length == 0 || !view) {
        return;
    }
    telephone = [NSString stringWithFormat:@"tel:%@",telephone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:telephone]]];
    [view addSubview:callWebview];
}

+ (void)sendMessageToTelephone:(NSString *)telephone {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",telephone]]];
}

+ (void)sendMessageToTelephones:(NSArray<NSString *> *)telephones title:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController delegate:(id)delegate{
    if (!viewController) {
        return;
    }
    if(![MFMessageComposeViewController canSendText]) {
        return;
    }
    MFMessageComposeViewController * msmVc = [[MFMessageComposeViewController alloc] init];
    msmVc.recipients = telephones;
    msmVc.body = message;
    msmVc.messageComposeDelegate = delegate;
    [viewController presentViewController:msmVc animated:YES completion:nil];
}

+ (void)sendMailToEmail:(NSString *)email {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto://%@",email]]];
}

+ (void)sendMailToEmail:(NSArray<NSString *> *)emails ccRecipients:(NSArray<NSString *> *)ccRecipients subject:(NSString *)subject message:(NSString *)message viewController:(UIViewController *)viewController delegate:(id<MFMailComposeViewControllerDelegate>)delegate {
    if (!viewController) {
        return;
    }
    if(![MFMailComposeViewController canSendMail]) {
        return;
    }
    MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
    //设置邮件主题
    [vc setSubject:subject];
    //设置邮件内容
    [vc setMessageBody:message isHTML:NO];
    //设置收件人列表
    [vc setToRecipients:emails];
    //设置抄送人列表
    [vc setCcRecipients:ccRecipients];
    //设置代理
    vc.mailComposeDelegate = delegate;
    //显示控制器
    [viewController presentViewController:vc animated:YES completion:nil];
}
@end
