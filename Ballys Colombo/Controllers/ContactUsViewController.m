//
//  ContactUsViewController.m
//  Ballys Colombo
//
//  Created by AppsCreationTech on 9/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "ContactUsViewController.h"
#import "MapLocationViewController.h"
#import "SubMenuViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - MFMailCompose delegate

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onHome:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onAboutUS:(id)sender
{
    [GlobalData sharedGlobalData].g_cardMenu = MENU_ABOUTUS;
    
    SubMenuViewController *submenuView = [[self storyboard]instantiateViewControllerWithIdentifier:SUBMENU_VIEW];
    [[GlobalData sharedGlobalData].navigationController pushViewController:submenuView animated:YES];
}

-(IBAction)onPhone:(id)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:PHONE_HOTELLINE1, PHONE_HOTELLINE2, nil];
    [sheet showInView:self.view.window];
}

#pragma mark- Actionsheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == actionSheet.cancelButtonIndex){
        return;
    }
    
    if (buttonIndex == 0) {
        
//        NSString *phoneNumber = [@"telprompt://" stringByAppendingString:PHONE_HOTELLINE1];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];

        NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",PHONE_HOTELLINE1]];
        
        if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
            [[UIApplication sharedApplication] openURL:phoneUrl];
        } else
        {
            UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [calert show];
        }
        
        return;
    } else if (buttonIndex == 1) {
        
//        NSString *phoneNumber = [@"telprompt://" stringByAppendingString:PHONE_HOTELLINE2];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        
        NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",PHONE_HOTELLINE2]];
        
        if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
            [[UIApplication sharedApplication] openURL:phoneUrl];
        } else
        {
            UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [calert show];
        }
        
        return;
    }
    
}


-(IBAction)onEmail:(id)sender
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        [mailController setToRecipients:@[CONTACT_MAIL]];
        mailController.mailComposeDelegate = self;
        [self presentViewController:mailController animated:YES completion:nil];
    }
}

-(IBAction)onMapLocation:(id)sender
{
    MapLocationViewController *mapView = [[self storyboard]instantiateViewControllerWithIdentifier:MAPLOCATION_VIEW];
    [[GlobalData sharedGlobalData].navigationController pushViewController:mapView animated:YES];
}

@end
