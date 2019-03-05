//
//  ViewController.m
//  TestIconFont
//
//  Created by liuweizhen on 2019/3/4.
//  Copyright © 2019 daliu All rights reserved.
//

#import "ViewController.h"
#import "BMFont.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUp];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    UIImage *image = [[BMFont fontImage:BMFont.book size:22 color:[UIColor redColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:nil action:NULL];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)loadView {
    [super loadView];
    
    [self setUp];
}

- (void)setUp {
    CGFloat length = 60;
    CGFloat padding = 15.0;
    UIImageView *imageView0 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 80, length, length)];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView0.frame)+padding, length, length)];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView1.frame)+padding, length, length)];
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView2.frame)+padding, length, length)];
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView3.frame)+padding, length, length)];
    [self.view addSubview:imageView0];
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    [self.view addSubview:imageView3];
    [self.view addSubview:imageView4];
    UIColor *color   = [UIColor blueColor];
    UIImage *image0  = [BMFont fontImage:BMFont.home size:length color:color];
    UIImage *image1  = [BMFont fontImage:BMFont.book size:length color:color];
    UIImage *image2  = [BMFont fontImage:BMFont.zebra size:length color:color];
    UIImage *image3  = [BMFont fontImage:BMFont.aliPay size:length color:color];
    UIImage *image4  = [BMFont fontImage:BMFont.weChat size:length color:color];
    imageView0.image = image0;
    imageView1.image = image1;
    imageView2.image = image2;
    imageView3.image = image3;
    imageView4.image = image4;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView4.frame)+10, UIScreen.mainScreen.bounds.size.width-20, 60)];
    [self.view addSubview:label];
    [self.view addSubview:label];
    label.textColor = [UIColor purpleColor];
    label.font = [BMFont fontName:@"iconfont" size:25];
    label.text = [NSString stringWithFormat:@"iconfont %@ -- %@ -- %@ -- %@ -- %@", BMFont.home.code, BMFont.book.code, BMFont.zebra.code, BMFont.aliPay.code, BMFont.weChat.code];
    // label.text = @"iconfont  \U0000e60c";
}

@end
