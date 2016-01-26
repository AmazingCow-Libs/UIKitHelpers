//COWTODO: MODIFY THE HEADER.
//
//  UIButton+COWBackgroundColorAdditions.m
//  COWUIKitHelpers
//
//  Created by Mateus Mesquita on 1/26/16.
//  Copyright © 2016 AmazingCow. All rights reserved.
//

//Header
#import "UIButton+COWBackgroundColorAdditions.h"
//Categories
#import "UIImage+COWColorAdditions.h"


// Implementation //
@implementation UIButton (COWBackgroundColorAdditions)

- (void)cow_setBackgroundColor:(UIColor *)color
                      forState:(UIControlState)state;
{
    //Just use the UIImage category to make a image from this color
    //and set it to the button background.
    [self setBackgroundImage:[UIImage cow_imageWithColor:color]
                    forState:state];
}
@end
