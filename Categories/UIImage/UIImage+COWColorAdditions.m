//COWTODO: MODIFY THE HEADER.
//
//  UIImage+Color.m
//  COWUIKitHelpers
//
//  Created by Mateus Mesquita on 1/26/16.
//  Copyright © 2016 AmazingCow. All rights reserved.
//

//Header
#import "UIImage+COWColorAdditions.h"


// Implementation //
@implementation UIImage (COWColorAdditions)

+ (UIImage *)cow_imageWithColor:(UIColor *)color
{
    //Create a 1px rect.
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    //Init the graphics context.
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //"Draw" the color...
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    //Set the image.
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //End the context.
    UIGraphicsEndImageContext();
    
    return image;
}

@end
