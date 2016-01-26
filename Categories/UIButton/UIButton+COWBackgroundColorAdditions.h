//COWTODO: MODIFY THE HEADER.
//
//  UIButton+COWBackgroundColorAdditions.h
//  COWUIKitHelpers
//
//  Created by Mateus Mesquita on 1/26/16.
//  Copyright © 2016 AmazingCow. All rights reserved.
//

// UIKit //
#import <UIKit/UIKit.h>


// Public Interface //
@interface UIButton (COWBackgroundColorAdditions)

- (void)cow_setBackgroundColor:(UIColor *)color
                      forState:(UIControlState)state;

@end
