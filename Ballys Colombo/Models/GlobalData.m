//
//  GlobalData.m
//  TagN
//
//  Created by AppsCreationTech on 2/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData

static GlobalData *_globalData = nil;

+ (GlobalData *) sharedGlobalData
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_globalData == nil) {
            _globalData = [[self alloc] init]; // assignment not done here
        }
    });
    
    return _globalData;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        [self setG_appDelegate:[[UIApplication sharedApplication] delegate]];
    }
    
    return self;
}

#pragma mark - checking validate email

- (BOOL) checkingVaildateEmailWithString:(NSString *)strEmail
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:strEmail];
}

# pragma mark - Trim string

- (NSString *) trimString:(NSString *) string
{   
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - converting date

- (NSDate *)dateFromString:(NSString *)strDate DateFormat:(NSString *)strDateFormat TimeZone:(NSTimeZone *) timeZone
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (strDateFormat == nil || [@"" isEqualToString:strDateFormat]) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    } else {
        [dateFormatter setDateFormat:strDateFormat];
    }
    
    if (timeZone != nil) {
        
        dateFormatter.timeZone = timeZone;
    }
    
    return [dateFormatter dateFromString:strDate];
}

#pragma mark - saving to user defaults

- (void) saveToUserDefaultsWithValue:(id)value
                                 Key:(NSString *)strKey
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        [standardUserDefaults setObject:value forKey:strKey];
        [standardUserDefaults synchronize];
    }
}

- (id) userDefaultWithKey:(NSString *)strKey
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        return [standardUserDefaults objectForKey:strKey];
    }
    
    return nil;
}

- (void) removeValueFromUserDefaults:(NSString *)strKey
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        [standardUserDefaults removeObjectForKey:strKey];
        [standardUserDefaults synchronize];
    }
}

@end
