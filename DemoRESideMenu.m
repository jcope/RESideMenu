//
//  DemoRESideMenu.m
//  iOS8
//
//  Created by Jeremy Cope on 5/13/14.
//  Copyright (c) 2014 Emma Technologies, L.L.C. All rights reserved.
//

#import "DemoRESideMenu.h"
//Include the Example Source
#import "DEMOFirstViewController.h"
#import "DEMORightMenuViewController.h"
#import "DEMOLeftMenuViewController.h"

@interface DemoRESideMenu ()
@property UIViewController* homeVC;
@property RESideMenu* app;
@end

@implementation DemoRESideMenu

- (id)init{
    if (self = [super init]) {
        _app = [self createDemoApp];
    }
    return self;
}
//This was copied from the RESideMenu DemoAppDelegate
-(RESideMenu*)createDemoApp{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[DEMOFirstViewController alloc] init]];
    
    DEMOLeftMenuViewController *leftMenuViewController = [[DEMOLeftMenuViewController alloc] init];
    DEMORightMenuViewController *rightMenuViewController = [[DEMORightMenuViewController alloc] init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:rightMenuViewController];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    return sideMenuViewController;
}
#pragma mark -
#pragma mark DemmoApp Delegate
-(NSString*)appName{
    return @"RE Side Menu";
}
-(NSString*)appDetail{
    return @"iOS 7 style side menu with parallax effect inspired by Dribbble shots.";
}
-(UIImage*)appImage{
    return [UIImage imageNamed:@"RESideMenuScreenShot.png"];
}
-(UIViewController*)mainViewController{
    return _app;
}

#pragma mark -
#pragma mark RESideMenu Delegate
- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}
@end
