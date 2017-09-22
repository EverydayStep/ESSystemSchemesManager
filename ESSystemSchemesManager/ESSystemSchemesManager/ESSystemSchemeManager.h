//
//  ESSystemSchemeManager.h
//  ESSystemSchemeManager
//
//  Created by codeLocker on 2017/7/31.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

typedef NS_ENUM(NSInteger, ESSystemSchemeType) {
    /** 设置 */
    ESSystemSchemeTypeSetting,
    /** 蜂窝数据 */
    ESSystemSchemeTypeCellular,
    /** VPN */
    ESSystemSchemeTypeVPN,
    /** WIFI */
    ESSystemSchemeTypeWIFI,
    /** 定位 */
    ESSystemSchemeTypeLocation,
    /** 个人热点 */
    ESSystemSchemeTypeHotPoint,
    /** 关于本机 */
    ESSystemSchemeTypeAbout,
    /** 辅助功能 */
    ESSystemSchemeTypeAccessibility,
    /** 飞行模式 */
    ESSystemSchemeTypeAirplane,
    /** 锁定 */
    ESSystemSchemeTypeLock,
    /** 亮度 */
    ESSystemSchemeTypeBrightness,
    /** 蓝牙 */
    ESSystemSchemeTypeBluetooth,
    /** 日期时间设置 */
    ESSystemSchemeTypeDateAndTime,
    /** FaceTime */
    ESSystemSchemeTypeFaceTime,
    /** 通用 */
    ESSystemSchemeTypeGeneral,
    /** 键盘设置 */
    ESSystemSchemeTypeKeyboard,
    /** iCloud */
    ESSystemSchemeTypeICloud,
    /** iCloud备份 */
    ESSystemSchemeTypeICloudBackup,
    /** 语言 */
    ESSystemSchemeTypeLanguage,
    /** 音乐 */
    ESSystemSchemeTypeMusic,
    /** 音乐均衡器 */
    ESSystemSchemeTypeMusicEqualizer,
    /** 音乐音量限制 */
    ESSystemSchemeTypeMusicVolumeLimit,
    /** 网络 */
    ESSystemSchemeTypeNetwork,
    /** Nike+iPod */
    ESSystemSchemeTypeNIKEIPod,
    /** Notes */
    ESSystemSchemeTypeNotes,
    /** 通知 */
    ESSystemSchemeTypeNotification,
    /** 手机 */
    ESSystemSchemeTypePhone,
    /** 相册 */
    ESSystemSchemeTypePhotos,
    /** Profiles */
    ESSystemSchemeTypeProfiles,
    /** Reset */
    ESSystemSchemeTypeReset,
    /** Safari */
    ESSystemSchemeTypeSafari,
    /** Sounds */
    ESSystemSchemeTypeSounds,
    /** Siri */
    ESSystemSchemeTypeSiri,
    /** 软件更新 */
    ESSystemSchemeTypeSoftwareUpdate,
    /** Store */
    ESSystemSchemeTypeStore,
    /** Twitter */
    ESSystemSchemeTypeTwitter,
    /** Usage */
    ESSystemSchemeTypeUsage,
    /** Wallpaper */
    ESSystemSchemeTypeWallpaper
};

@interface ESSystemSchemeManager : NSObject
/**
 跳转系统Scheme

 @param type scheme
 */
+ (void)openSystemScheme:(ESSystemSchemeType)type;

/**
 打开Safari

 @param url 连接地址
 */
+ (void)openSafari:(NSURL *)url;

/**
 拨打电话

 @param telephone 电话号码
 @param view webview容器
 */
+ (void)callTelephone:(NSString *)telephone inView:(UIView *)view;

/**
 发送短信,跳转到系统短信界面

 @param telephone 电话号码
 */
+ (void)sendMessageToTelephone:(NSString *)telephone;

/**
 发送短信,不跳转到系统短信界面

 @param telephones 电话号码数组
 @param title 标题
 @param message 短信内容
 @param viewController  显示短信界面vc
 @param delegate 发送结果处理代理
 */
+ (void)sendMessageToTelephones:(NSArray<NSString *> *)telephones title:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController delegate:(id<MFMessageComposeViewControllerDelegate>)delegate;

/**
 发送邮件

 @param email 邮箱地址
 */
+ (void)sendMailToEmail:(NSString *)email;

/**
 发送邮件

 @param emails 收件人
 @param ccRecipients 抄送人
 @param subject 主题
 @param message 文本
 @param viewController 显示短信界面vc
 @param delegate 发送结果处理代理
 */
+ (void)sendMailToEmail:(NSArray<NSString *> *)emails ccRecipients:(NSArray<NSString *> *)ccRecipients subject:(NSString *)subject message:(NSString *)message viewController:(UIViewController *)viewController delegate:(id<MFMailComposeViewControllerDelegate>)delegate;
@end
