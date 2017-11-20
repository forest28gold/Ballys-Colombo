//
//  Global.h
//
//  Created by AppsCreationTech on 2/3/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#ifndef Ballys_Global_h
#define Ballys_Global_h

#define COVERFLOWMENU_VIEW                                          @"CoverFlowMenuViewController"
#define LISTMENU_VIEW                                               @"ListMenuViewController"
#define MAINMENE_VIEW                                               @"MainMenuViewController"
#define SUBMENU_VIEW                                                @"SubMenuViewController"
#define CONTACTUS_VIEW                                              @"ContactUsViewController"
#define MAPLOCATION_VIEW                                            @"MapLocationViewController"


#define MENU_CASINO                                                 @"CASINO"
#define MENU_ENTERTAINMMENT                                         @"ENTERTAINMENT"
#define MENU_PACKAGES                                               @"PACKAGES"
#define MENU_HOTEL_SPA                                              @"HOTEL & SPA"
#define MENU_RESTAURANT                                             @"RESTAURANT"
#define MENU_CONTACTUS                                              @"CONTACT US"
#define MENU_SIGNUP                                                 @"SIGN UP"
#define MENU_MAKE_MYTRIP                                            @"MAKE MY TRIP"
#define MENU_TABLE_GAMES                                            @"TABLE GAMES"
#define MENU_ABOUTUS                                                @"ABOUT US"

#define BACK_CASINO                                                 @"menu_casino.png"
#define BACK_ENTERTAINMMENT                                         @"menu_entertainment.png"
#define BACK_PACKAGES                                               @"menu_package.png"
#define BACK_HOTEL_SPA                                              @"menu_hotel_spa.png"
#define BACK_RESTAURANT                                             @"menu_restaurant.png"
#define BACK_SIGNUP                                                 @"menu_signup.png"
#define BACK_MAKE_MYTRIP                                            @"menu_make_mytrip.png"
#define BACK_TABLE_GAMES                                            @"menu_table_game.png"
#define BACK_CONTACTUS                                              @"menu_contactus.png"


// Contacts

#define CONTACT_MAIL                                                @"info@ballyscolombo.com"
#define PHONE_HOTELLINE1                                            @"+94115556555"
#define PHONE_HOTELLINE2                                            @"+94112331151"
#define BALLYS_GOOGLE_URL                                           @"https://www.google.com/maps/@6.932187,79.850239,229m/data=!3m1!1e3?hl=en-US"
#define BALLYS_LATITUDE                                             6.9322457
#define BALLYS_LONGITUDE                                            79.8502439
#define BALLYS_TITLE                                                @"Bally's Club"
#define BALLYS_SUBTITLE                                             @"D. R. Wijewardena Mawatha, Colombo, Sri Lanka"


// Main Menu

#define MENU_CASINO_URL                                             @"http://www.ballyscolombo.com/"
#define MENU_ENTERTAINMMENT_URL                                     @"http://www.ballyscolombo.com/daily-entertainment/"
#define MENU_PACKAGES_URL                                           @"http://www.ballyscolombo.com/bronze-package/"
#define MENU_HOTEL_SPA_URL                                          @"http://www.ballyscolombo.com/hotel/"
#define MENU_RESTAURANT_URL                                         @"http://www.ballyscolombo.com/restaurants/"
#define MENU_CONTACTUS_URL                                          @"http://www.ballyscolombo.com/contact/"
#define MENU_ABOUTUS_URL                                            @"http://www.ballyscolombo.com/about-us-2/"
#define MENU_SIGNUP_URL                                             @"http://www.ballyscolombo.com/register/"
#define MENU_MAKE_MYTRIP_URL                                        @"http://www.ballyscolombo.com/make-my-trip/"
#define MENU_TABLE_GAMES_URL                                        @"http://www.ballyscolombo.com/table-games/"

// show SVProgressHUD

#define SVPROGRESSHUD_SHOW                                          [SVProgressHUD showWithStatus:@"Please wait..." maskType:SVProgressHUDMaskTypeClear]
#define SVPROGRESSHUD_DISMISS                                       [SVProgressHUD dismiss]
#define SVPROGRESSHUD_SUCCESS(status)                               [SVProgressHUD showSuccessWithStatus:status]
#define SVPROGRESSHUD_ERROR(status)                                 [SVProgressHUD showErrorWithStatus:status]
#define SVPROGRESSHUD_NETWORK_ERROR                                 [SVProgressHUD showErrorWithStatus:NETWORK_ERR_MESSAGE]

#endif
