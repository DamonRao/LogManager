//
//  ViewController.m
//  Demo
//
//  Created by Damon on 2019/8/12.
//  Copyright © 2019年 DR. All rights reserved.
//

#import "ViewController.h"
#import "DRLogManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DRLogInfo(@"LogInfo level");
    DRLogWarn(@"LogWarn level");
    DRLogDebug(@"LogDebug level");
    DRLogWarn(@"LogWarn level");
}


@end
