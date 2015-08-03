//
//  AppDelegate.h
//  RdioDemo
//
//  Created by Wcities Inc on 08/07/15.
//  Copyright (c) 2015 Arun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rdio/Rdio.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
+ (Rdio *)rdioInstance;

@end

