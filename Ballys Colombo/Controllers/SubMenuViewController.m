//
//  SubMenuViewController.m
//  Ballys Colombo
//
//  Created by AppsCreationTech on 9/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "SubMenuViewController.h"

@interface SubMenuViewController () <UIWebViewDelegate>

@end

@implementation SubMenuViewController

@synthesize m_webView;
@synthesize m_btnBack, m_btnForward;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *urlAddress = MENU_CASINO_URL;
    
    if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_CASINO]) {
        
        urlAddress = MENU_CASINO_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_ENTERTAINMMENT]) {
        
        urlAddress = MENU_ENTERTAINMMENT_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_PACKAGES]) {
        
        urlAddress = MENU_PACKAGES_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_HOTEL_SPA]) {
        
        urlAddress = MENU_HOTEL_SPA_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_RESTAURANT]) {
        
        urlAddress = MENU_RESTAURANT_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_ABOUTUS]) {
        
        urlAddress = MENU_ABOUTUS_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_SIGNUP]) {
        
        urlAddress = MENU_SIGNUP_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_MAKE_MYTRIP]) {
        
        urlAddress = MENU_MAKE_MYTRIP_URL;
        
    } else if ([[GlobalData sharedGlobalData].g_cardMenu isEqualToString:MENU_TABLE_GAMES]) {
        
        urlAddress = MENU_TABLE_GAMES_URL;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [self.m_webView loadRequest:requestObj];
    
    if ([self.m_webView canGoForward]) {
        [m_btnForward setEnabled:YES];
    } else {
        [m_btnForward setEnabled:NO];
    }
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

-(IBAction)onBack:(id)sender
{
    if ([self.m_webView canGoBack]) {
        
        [self.m_webView goBack];
        
    } else {
       
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    if ([self.m_webView canGoForward]) {
        [m_btnForward setEnabled:YES];
    } else {
        [m_btnForward setEnabled:NO];
    }
}

-(IBAction)onHome:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onForward:(id)sender
{
    if ([self.m_webView canGoForward]) {
        [self.m_webView goForward];
    }
    
    if ([self.m_webView canGoForward]) {
        [m_btnForward setEnabled:YES];
    } else {
        [m_btnForward setEnabled:NO];
    }
}

-(IBAction)onRefresh:(id)sender
{
    [self.m_webView reload];
    
    if ([self.m_webView canGoForward]) {
        [m_btnForward setEnabled:YES];
    } else {
        [m_btnForward setEnabled:NO];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{

//    SVPROGRESSHUD_SHOW;
    
    return true;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    SVPROGRESSHUD_DISMISS;
}

@end
