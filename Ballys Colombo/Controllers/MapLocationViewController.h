//
//  MapLocationViewController.h
//  Ballys Colombo
//
//  Created by AppsCreationTech on 9/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapLocationViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *locationMapView;

@property (nonatomic, strong) IBOutlet UIButton *m_btnMap;
@property (nonatomic, strong) IBOutlet UIButton *m_btnSatellite;
@property (nonatomic, strong) IBOutlet UILabel *m_lblMap;
@property (nonatomic, strong) IBOutlet UILabel *m_lblSatellite;

@end
