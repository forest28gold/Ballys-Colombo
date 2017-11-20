//
//  CoverFlowMenuViewController.m
//  Ballys Colombo
//
//  Created by AppsCreationTech on 9/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "CoverFlowMenuViewController.h"
#import "MainMenuViewController.h"
#import "ListMenuViewController.h"
#import "CoverFlowView.h"
#import "ContactUsViewController.h"
#import "SubMenuViewController.h"

@interface CoverFlowMenuViewController ()

@property (nonatomic, strong) ListMenuViewController *backSideViewController;

@end

@implementation CoverFlowMenuViewController

@synthesize backSideViewController = _backSideViewController;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    
    NSMutableArray *sourceImages = [[NSMutableArray alloc] init];
    for (int i = 0; i <[[GlobalData sharedGlobalData].g_cardData count]; i++) {
        
        CardData *cardData = [GlobalData sharedGlobalData].g_cardData[i];
        
        UIImage *image = [UIImage imageNamed:cardData.cardBack];
        [sourceImages addObject:image];
    }
    
    if ([GlobalData sharedGlobalData].g_coverflow == nil) {
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            
            [GlobalData sharedGlobalData].g_coverflow = [CoverFlowView coverFlowViewWithFrame:self.view.frame andImages:sourceImages sideImageCount:6 sideImageScale:1.2 middleImageScale:1.5];
            
            [GlobalData sharedGlobalData].g_coverLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height * 2/3, self.view.frame.size.width, 100)];
            [GlobalData sharedGlobalData].g_coverLabel.font = [UIFont boldSystemFontOfSize:20.0];
            
        } else {
            
            [GlobalData sharedGlobalData].g_coverflow = [CoverFlowView coverFlowViewWithFrame:self.view.frame andImages:sourceImages sideImageCount:6 sideImageScale:1 middleImageScale:1.2];
            
            [GlobalData sharedGlobalData].g_coverLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height * 2.1/3, self.view.frame.size.width, 100)];
            [GlobalData sharedGlobalData].g_coverLabel.font = [UIFont boldSystemFontOfSize:13.0];
        }
        
        [self.view addSubview:[GlobalData sharedGlobalData].g_coverflow];
        [GlobalData sharedGlobalData].g_coverflow.delegate = self;
        
        [GlobalData sharedGlobalData].g_coverLabel.text = MENU_CASINO;
        [GlobalData sharedGlobalData].g_coverLabel.textAlignment = NSTextAlignmentCenter;
        [GlobalData sharedGlobalData].g_coverLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:[GlobalData sharedGlobalData].g_coverLabel];
        
    } else {
        [self.view addSubview:[GlobalData sharedGlobalData].g_coverflow];
        [self.view addSubview:[GlobalData sharedGlobalData].g_coverLabel];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)flipListViewBtnPressed:(id)sender {
//    self.backSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListMenuViewController"];
//    [UIView transitionWithView:self.view.superview
//                      duration:1.0
//                       options:UIViewAnimationOptionTransitionFlipFromLeft
//                    animations:^{
//                        [self.view.superview addSubview:self.backSideViewController.view];
//                        [self.view removeFromSuperview];
//                    }
//                    completion:NULL];
//    self.backSideViewController.view.frame = self.backSideViewController.view.superview.bounds;
//}

- (IBAction)flipListViewBtnPressed:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.view.superview
                             cache:YES];
    
    self.backSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListMenuViewController"];
    [UIView commitAnimations];
    [self.view.superview addSubview:self.backSideViewController.view];
    [self.view removeFromSuperview];
    self.backSideViewController.view.frame = self.backSideViewController.view.superview.bounds;
}

//- (IBAction)flipListViewBtnPressed:(id)sender {
//    self.backSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListMenuViewController"];
//    [UIView transitionFromView:self.view toView:self.backSideViewController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
//    self.backSideViewController.view.frame = self.backSideViewController.view.superview.bounds;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)flowCover:(CoverFlowView *)view changedSelect:(int)index
{
    NSLog(@"Changed Index %d",index);
    
    CardData* cardDataInfo = [GlobalData sharedGlobalData].g_cardData[index];
    
    [GlobalData sharedGlobalData].g_coverLabel.text = cardDataInfo.cardName;
}

- (void)flowCover:(CoverFlowView *)view didSelect:(int)index
{
    NSLog(@"Selected Index %d",index);
    
    CardData* cardDataInfo = [GlobalData sharedGlobalData].g_cardData[index];
    
    if ([cardDataInfo.cardName isEqualToString:MENU_CONTACTUS]) {
        
        ContactUsViewController *contactView = [[self storyboard]instantiateViewControllerWithIdentifier:CONTACTUS_VIEW];
        [[GlobalData sharedGlobalData].navigationController pushViewController:contactView animated:YES];
        
    } else {
        
        [GlobalData sharedGlobalData].g_cardMenu = cardDataInfo.cardName;
        
        SubMenuViewController *submenuView = [[self storyboard]instantiateViewControllerWithIdentifier:SUBMENU_VIEW];
        [[GlobalData sharedGlobalData].navigationController pushViewController:submenuView animated:YES];
        
    }
    
}

@end
