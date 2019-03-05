//
//  BMFont.h
//  TestIconFont
//
//  Created by liuweizhen on 2019/3/4.
//  Copyright © 2019 daliu All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMFontItem : NSObject

@property (nonatomic, copy) NSString *family;
@property (nonatomic, copy) NSString *code;

+ (BMFontItem *)itemWithFamily:(NSString *)family code:(NSString *)code;

@end

@interface BMFont : NSObject

+ (BMFontItem *)home;
+ (BMFontItem *)book;
+ (BMFontItem *)zebra;
+ (BMFontItem *)aliPay;
+ (BMFontItem *)weChat;

+ (UIFont *)fontName:(NSString *)name size:(CGFloat)size;
+ (UIImage *)fontImage:(BMFontItem *)item size:(CGFloat)size color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
