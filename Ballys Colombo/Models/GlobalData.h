//
//  GlobalData.h
//  TagN
//
//  Created by AppsCreationTech on 2/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoverFlowView.h"

@interface GlobalData : NSObject

@property (strong, nonatomic) NSMutableArray            *g_cardData;
@property (nonatomic, retain) AppDelegate               *g_appDelegate;
@property (nonatomic, retain) UINavigationController    *navigationController;
@property (nonatomic, retain) CoverFlowView             *g_coverflow;
@property (nonatomic, retain) UILabel                   *g_coverLabel;
@property (nonatomic, retain) NSString                  *g_cardMenu;

+ (GlobalData *) sharedGlobalData;

- (BOOL) checkingVaildateEmailWithString:(NSString *)strEmail;
- (NSString *) trimString:(NSString *)string;
- (NSDate *)dateFromString:(NSString *)strDate DateFormat:(NSString *)strDateFormat
                  TimeZone:(NSTimeZone *)timeZone;
- (void) saveToUserDefaultsWithValue:(id)value
                                 Key:(NSString *)strKey;
- (id) userDefaultWithKey:(NSString *)strKey;

- (void) removeValueFromUserDefaults:(NSString *)strKey;

@end
