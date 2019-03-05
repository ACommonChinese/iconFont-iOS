//
//  BMFont.m
//  TestIconFont
//
//  Created by liuweizhen on 2019/3/4.
//  Copyright © 2019 daliu All rights reserved.
//

#import "BMFont.h"
#import <CoreText/CoreText.h>

@implementation BMFontItem

+ (BMFontItem *)itemWithFamily:(NSString *)family code:(NSString *)code {
    BMFontItem *item = [[BMFontItem alloc] init];
    item.family = family;
    item.code = code;
    return item;
}

@end

@implementation BMFont

+ (BMFontItem *)home {
    return [BMFontItem itemWithFamily:@"iconfont" code:@"\U0000e778"];
}

+ (BMFontItem *)book {
    return [BMFontItem itemWithFamily:@"iconfont" code:@"\U0000e601"];
}

+ (BMFontItem *)zebra {
    return [BMFontItem itemWithFamily:@"iconfont" code:@"\U0000e602"];
}

+ (BMFontItem *)aliPay {
    return [BMFontItem itemWithFamily:@"iconfont" code:@"\U0000e603"];
}

+ (BMFontItem *)weChat {
    return [BMFontItem itemWithFamily:@"iconfont" code:@"\U0000e604"];
}

+ (void)registerFontWithURL:(NSURL *)url {
    NSAssert([[NSFileManager defaultManager] fileExistsAtPath:[url path]], @"Font file doesn't exist");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    CTFontManagerRegisterGraphicsFont(newFont, NULL);
    CGFontRelease(newFont);
}

+ (UIFont *)fontName:(NSString *)name size:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:name size:size];
    if (font == nil) {
        NSURL *fontFileUrl = [[NSBundle mainBundle] URLForResource:name withExtension:@"ttf"];
        [self registerFontWithURL:fontFileUrl];
        font = [UIFont fontWithName:name size:size];
    }
    return font; // <UICTFont: 0x7fee63613a00> font-family: "iconfont"; font-weight: normal; font-style: normal; font-size: 60.00pt
}

+ (UIImage *)fontImage:(BMFontItem *)item size:(CGFloat)size color:(UIColor *)color {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    UIFont *font = [self fontName:item.family size:realSize];
    
    UIGraphicsBeginImageContext(CGSizeMake(realSize, realSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSString *code = item.code;
    if ([code respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        /**
         * 如果这里抛出异常，请打开断点列表，右击All Exceptions -> Edit Breakpoint -> All修改为Objective-C
         * See: http://stackoverflow.com/questions/1163981/how-to-add-a-breakpoint-to-objc-exception-throw/14767076#14767076
         */
        [code drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: color}];
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, color.CGColor);
        [code drawAtPoint:CGPointMake(0, 0) withFont:font];
#pragma clang pop
    }
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    return image;
}

@end
