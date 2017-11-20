//
//  FLLocation.h
//  HelloMapKitWorld
//
//  Created by AppsCreationTech on 5/30/11.
//  Copyright (c) 2011 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface FLLocation : NSObject <MKAnnotation> {
    
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
