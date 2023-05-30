//
//  BaseViewController.m
//  csl.cloud.ios
//
//  Created by 蔡三李 on 2023/5/27.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void) viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:<#animated#>];
    [self initNavigationBarTransparent];
}

- (void)setBackgroundColor:(UIColor *)color {
    self.view.backgroundColor = color;
}

- (void)setNavigationBarTitleColor:(UIColor *)color {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
}

- (void)initLeftBarButton:(NSString *)imageName {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed: imageName] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    leftButton.tintColor = UIColor.whiteColor;
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)setNavigationBarBackgroundImage:(UIImage *)image {
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)setStatusBarStyle:(UIStatusBarStyle)style {
    [UIApplication sharedApplication].statusBarStyle = style;
}

- (void)initNavigationBarTransparent {
    [self setNavigationBarTitleColor: UIColor.whiteColor];
    [self setNavigationBarBackgroundImage: [UIImage new]];
}

- (void)setNavigationBarTitle:(NSString *)title {
    self.navigationItem.title = title;
}

- (void)setNavigationBarBackgroundColor:(UIColor *)color {
    [self.navigationController.navigationBar setBackgroundColor: color];
}

- (void)setBackgroundImage:(NSString *)imageName {
    UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.bounds];
    background.clipsToBounds = YES;
    background.contentMode = UIViewContentModeScaleAspectFit;
    background.image = [UIImage imageNamed:imageName];
    [self.view addSubview:background];
    
}

- (void) back {
    [self.navigationController popViewControllerAnimated:true];
}

- (void) dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) setLeftButton:(NSString *)imageName {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    leftButton.frame = CGRectMake(15.0f, statusBarHeight + 11, 20.0f, 20.0f);
    [leftButton setBackgroundImage:[UIImage imageNamed: imageName] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
}

- (void)setStatusBarHidden:(BOOL)hidden {
//    [[UIApplication sharedApplication] setStatusBarHidden: hidden];
    [self prefersStatusBarHidden];
}

- (void)setStatusBarBackgroundColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame];
        statusBar.backgroundColor = color;
        [[UIApplication sharedApplication].keyWindow addSubview:statusBar];
    } else {
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar.backgroundColor = color;
        }
    }
}

- (CGFloat)navagationBarHeight {
    return self.navigationController.navigationBar.frame.size.height;
}

- (void)setTranslucentCover {
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect: blurEffect];
    visualEffectView.frame = self.view.bounds;
    visualEffectView.alpha = 1;
    [self.view addSubview:visualEffectView];
}

- (void)setNavigationBarShadowImage:(UIImage *)image {
    [self.navigationController.navigationBar setShadowImage: image];
}

@end

