//
//  BaseViewController.h
//  csl.cloud.ios
//
//  Created by 蔡三李 on 2023/5/27.
//
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void) initNavigationBarTransparent;

- (void) setBackgroundColor:(UIColor *)color;

- (void) setTranslucentCover;

- (void) initLeftBarButton:(NSString *)imageName;

- (void) setStatusBarHidden:(BOOL) hidden;

- (void) setStatusBarBackgroundColor:(UIColor *)color;

- (void) setNavigationBarTitle:(NSString *)title;

- (void) setNavigationBarTitleColor:(UIColor *)color;

- (void) setNavigationBarBackgroundColor:(UIColor *)color;

- (void) setNavigationBarBackgroundImage:(UIImage *)image;

- (void) setStatusBarStyle:(UIStatusBarStyle)style;

- (void) setNavigationBarShadowImage:(UIImage *)image;

- (void) back;

- (CGFloat) navagationBarHeight;

- (void) setLeftButton:(NSString *)imageName;

- (void) setBackgroundImage:(NSString *)imageName;

@end
