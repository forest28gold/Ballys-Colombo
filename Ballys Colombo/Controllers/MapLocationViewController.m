//
//  MapLocationViewController.m
//  Ballys Colombo
//
//  Created by AppsCreationTech on 9/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "MapLocationViewController.h"
#import "FLLocation.h"

@interface MapLocationViewController ()

@end

@implementation MapLocationViewController

@synthesize locationMapView;
@synthesize m_btnMap, m_btnSatellite;
@synthesize m_lblMap, m_lblSatellite;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [m_btnMap setImage:[UIImage imageNamed:@"map_map_off.png"] forState:UIControlStateNormal];
    [m_btnSatellite setImage:[UIImage imageNamed:@"map_satellite_on.png"] forState:UIControlStateNormal];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [m_lblMap setFont:[UIFont systemFontOfSize:18.0]];
        [m_lblSatellite setFont:[UIFont boldSystemFontOfSize:17.0]];
    } else {
        [m_lblMap setFont:[UIFont systemFontOfSize:13.0]];
        [m_lblSatellite setFont:[UIFont boldSystemFontOfSize:12.0]];
    }

    

    [self.locationMapView setMapType:MKMapTypeSatellite];
    [self.locationMapView setZoomEnabled:YES];
    [self.locationMapView setScrollEnabled:YES];
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = BALLYS_LATITUDE ;
    region.center.longitude = BALLYS_LONGITUDE;
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [self.locationMapView setRegion:region animated:YES];
    
    FLLocation *ann = [[FLLocation alloc] init];
    ann.title = BALLYS_TITLE;
    ann.subtitle = BALLYS_SUBTITLE;
    ann.coordinate = region.center;
    [self.locationMapView addAnnotation:ann];
    

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
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)onHome:(id)sender
{
//    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)onSatellite:(id)sender
{
    locationMapView.mapType = MKMapTypeSatellite;
    
    [m_btnMap setImage:[UIImage imageNamed:@"map_map_off.png"] forState:UIControlStateNormal];
    [m_btnSatellite setImage:[UIImage imageNamed:@"map_satellite_on.png"] forState:UIControlStateNormal];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [m_lblMap setFont:[UIFont systemFontOfSize:18.0]];
        [m_lblSatellite setFont:[UIFont boldSystemFontOfSize:17.0]];
    } else {
        [m_lblMap setFont:[UIFont systemFontOfSize:13.0]];
        [m_lblSatellite setFont:[UIFont boldSystemFontOfSize:12.0]];
    }
    
}

-(IBAction)onMap:(id)sender
{
    locationMapView.mapType = MKMapTypeStandard;
    
    [m_btnMap setImage:[UIImage imageNamed:@"map_map_on.png"] forState:UIControlStateNormal];
    [m_btnSatellite setImage:[UIImage imageNamed:@"map_satellite_off.png"] forState:UIControlStateNormal];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [m_lblMap setFont:[UIFont boldSystemFontOfSize:18.0]];
        [m_lblSatellite setFont:[UIFont systemFontOfSize:17.0]];
    } else {
        [m_lblMap setFont:[UIFont boldSystemFontOfSize:13.0]];
        [m_lblSatellite setFont:[UIFont systemFontOfSize:12.0]];
    }
    
}

#pragma mark Annotations

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if (annotation == mapView.userLocation) { //returning nil means 'use built in location view'
        return nil;
    }
    
    MKPinAnnotationView *pinAnnotation = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
    
    if (pinAnnotation == nil) {
        pinAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
    } else {
        pinAnnotation.annotation = annotation;
    }
    
    pinAnnotation.canShowCallout = YES;
    pinAnnotation.pinColor = MKPinAnnotationColorRed;
    pinAnnotation.animatesDrop = YES;
    
    UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:self action:@selector(moveToGoogleMap) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:annotation.title forState:UIControlStateNormal];
    pinAnnotation.rightCalloutAccessoryView = rightButton;
    
    return pinAnnotation;
}

-(void) moveToGoogleMap
{
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:BALLYS_GOOGLE_URL]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BALLYS_GOOGLE_URL]];
    }
}

//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
//    MKPinAnnotationView *pinView = nil;
//    if(annotation != mapView.userLocation)
//    {
//        static NSString *defaultPinID = @"com.invasivecode.pin";
//        pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
//        if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
//        
//        pinView.pinColor = MKPinAnnotationColorPurple;
//        pinView.canShowCallout = YES;
//        pinView.animatesDrop = YES;
//    }
//    else {
//        [mapView.userLocation setTitle:@"I am here"];
//    }
//    return pinView;
//}

@end
