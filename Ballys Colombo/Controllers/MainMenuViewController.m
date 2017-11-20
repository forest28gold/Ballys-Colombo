//
//  MainMenuViewController.m
//  Ballys Colombo
//
//  Created by AppsCreationTech on 9/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "MainMenuViewController.h"
#import "CoverFlowMenuViewController.h"
#import "ListMenuViewController.h"

@interface MainMenuViewController ()

@property (nonatomic, strong) CoverFlowMenuViewController *frontSideViewController;

@end

@implementation MainMenuViewController

@synthesize containerView = _containerView;
@synthesize frontSideViewController = _frontSideViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    [GlobalData sharedGlobalData].g_cardData = [[NSMutableArray alloc] init];
    
    NSArray *nameArray = [[NSArray alloc] initWithObjects:MENU_CASINO, MENU_ENTERTAINMMENT, MENU_PACKAGES, MENU_HOTEL_SPA, MENU_RESTAURANT, MENU_TABLE_GAMES, MENU_SIGNUP, MENU_MAKE_MYTRIP, MENU_CONTACTUS, nil];
    NSArray *backArray = [[NSArray alloc] initWithObjects:BACK_CASINO, BACK_ENTERTAINMMENT, BACK_PACKAGES, BACK_HOTEL_SPA, BACK_RESTAURANT, BACK_TABLE_GAMES, BACK_SIGNUP, BACK_MAKE_MYTRIP, BACK_CONTACTUS, nil];
    NSArray *linkArray = [[NSArray alloc] initWithObjects:MENU_CASINO_URL, MENU_ENTERTAINMMENT_URL, MENU_PACKAGES_URL, MENU_HOTEL_SPA_URL, MENU_RESTAURANT_URL, MENU_TABLE_GAMES_URL, MENU_SIGNUP_URL, MENU_MAKE_MYTRIP_URL, MENU_CONTACTUS_URL, nil];
    
    for (int i = 0; i < [nameArray count]; i ++) {
        
        CardData *cardData = [[CardData alloc] init];
        
        cardData.cardName = nameArray[i];
        cardData.cardBack = backArray[i];
        cardData.cardLink = linkArray[i];
        
        [[GlobalData sharedGlobalData].g_cardData addObject:cardData];
        
    }
    
    self.frontSideViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CoverFlowMenuViewController"];
    self.frontSideViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.containerView addSubview:self.frontSideViewController.view];
    
    [GlobalData sharedGlobalData].navigationController = self.navigationController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setContainerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
