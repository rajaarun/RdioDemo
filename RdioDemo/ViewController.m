//
//  ViewController.m
//  RdioDemo
//
//  Created by Wcities Inc on 08/07/15.
//  Copyright (c) 2015 Arun. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Rdio *rdio = [AppDelegate rdioInstance];
    
    NSDictionary *params = @{
                             @"vanityName": @"samir",
                             };
    
    [rdio callAPIMethod:@"findUser" withParameters:params success:^(NSDictionary *result) {
        NSLog(@"Success");
        
        if ([[result objectForKey:@"key"] isKindOfClass:[NSString class]]) {
            
            
            NSDictionary *param = @{
                                     @"type": @"artists",
                                     @"friends": @"false",
                                     @"user": [result objectForKey:@"key"],
                                     @"count": @"200"
                                     };
            
            
            [[AppDelegate rdioInstance] callAPIMethod:@"getHeavyRotation" withParameters:param success:^(NSDictionary *result) {
                
                if ([result isKindOfClass:[NSArray class]]) {
                    NSMutableArray *artistNameArray  = [NSMutableArray array];
                    NSArray *array = (NSArray *)result;
                    for (NSDictionary *artist in array) {
                        if ([[artist objectForKey:@"name"] isKindOfClass:[NSString class]]) {
                            [artistNameArray addObject:[artist objectForKey:@"name"]];
                        }
                    }
                    NSLog(@"%@",artistNameArray);
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    return;

                }
                
            } failure:^(NSError *error) {
                
            }];
        }
    } failure:^(NSError *error) {
        NSLog(@"Failure");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
