//
//  ListMenuViewController.m
//  Ballys Colombo
//
//  Created by AppsCreationTech on 9/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "ListMenuViewController.h"
#import "MainMenuViewController.h"
#import "CoverFlowMenuViewController.h"
#import "ContactUsViewController.h"
#import "SubMenuViewController.h"

@interface ListMenuViewController ()

@property (nonatomic, strong) CoverFlowMenuViewController *frontSideViewController;

@end

@implementation ListMenuViewController

@synthesize frontSideViewController = _frontSideViewController;
@synthesize m_collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)flipCoverflowViewBtnPressed:(id)sender {
//    self.frontSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CoverFlowMenuViewController"];
//    [UIView transitionWithView:self.view.superview
//                      duration:1.0
//                       options:UIViewAnimationOptionTransitionFlipFromLeft
//                    animations:^{
//                        [self.view.superview addSubview:self.frontSideViewController.view];
//                        [self.view removeFromSuperview];
//                    }
//                    completion:NULL];
//    self.frontSideViewController.view.frame = self.frontSideViewController.view.superview.bounds;
//}
//
//- (IBAction)flipCoverflowViewBtnPressed:(id)sender {
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
//                           forView:self.view.superview
//                             cache:YES];
//    
//    self.frontSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CoverFlowMenuViewController"];
//    [UIView commitAnimations];
//    [self.view.superview addSubview:self.frontSideViewController.view];
//    [self.view removeFromSuperview];
//    self.frontSideViewController.view.frame = self.frontSideViewController.view.superview.bounds;
//}

- (IBAction)flipCoverflowViewBtnPressed:(id)sender {
    self.frontSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CoverFlowMenuViewController"];
    [UIView transitionFromView:self.view toView:self.frontSideViewController.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    self.frontSideViewController.view.frame = self.frontSideViewController.view.superview.bounds;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[GlobalData sharedGlobalData].g_cardData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    CardData* cardDataInfo = [GlobalData sharedGlobalData].g_cardData[indexPath.row];
    
    UIImageView* _cardImage = (UIImageView*)[_cell viewWithTag:1];
    [_cardImage setImage:[UIImage imageNamed:cardDataInfo.cardBack]];
    
    
    UILabel* _cardTitle = (UILabel*)[_cell viewWithTag:2];
    _cardTitle.text = cardDataInfo.cardName;
    
    return _cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardData* cardDataInfo = [GlobalData sharedGlobalData].g_cardData[indexPath.row];
    
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
