//
//  ViewController.m
//  ESSystemSchemesManager
//
//  Created by codeLocker on 2017/7/31.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ViewController.h"
#import "ESSystemSchemeManager.h"
@interface ViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
//    [ESSystemSchemeManager openSystemScheme:ESSystemSchemeTypeTwitter];
//    [ESSystemSchemeManager callTelephone:@"15501628270" inView:self.view];
//    [ESSystemSchemeManager sendMessageToTelephone:@"15501682720"];
//    [ESSystemSchemeManager sendMessageToTelephones:@[@"15501682720"] title:@"title" message:@"message" viewController:self delegate:self];
//    [[ESSystemSchemeManager sendMailToEmail:@""];
//    ]
//
    [ESSystemSchemeManager sendMailToEmail:@[@""] ccRecipients:nil subject:@"subject" message:@"message" viewController:self delegate:self];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {

}

@end
