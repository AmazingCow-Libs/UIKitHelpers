//----------------------------------------------------------------------------//
//               █      █                                                     //
//               ████████                                                     //
//             ██        ██                                                   //
//            ███  █  █  ███        UIColor+COWHexStringAdditions.m           //
//            █ █        █ █        UIKitHelpers                              //
//             ████████████                                                   //
//           █              █       Copyright (c) 2015, 2016                  //
//          █     █    █     █      AmazingCow - www.AmazingCow.com           //
//          █     █    █     █                                                //
//           █              █       N2OMatt - n2omatt@amazingcow.com          //
//             ████████████         www.amazingcow.com/n2omatt                //
//                                                                            //
//                  This software is licensed as GPLv3                        //
//                 CHECK THE COPYING FILE TO MORE DETAILS                     //
//                                                                            //
//    Permission is granted to anyone to use this software for any purpose,   //
//   including commercial applications, and to alter it and redistribute it   //
//               freely, subject to the following restrictions:               //
//                                                                            //
//     0. You **CANNOT** change the type of the license.                      //
//     1. The origin of this software must not be misrepresented;             //
//        you must not claim that you wrote the original software.            //
//     2. If you use this software in a product, an acknowledgment in the     //
//        product IS HIGHLY APPRECIATED, both in source and binary forms.     //
//        (See opensource.AmazingCow.com/acknowledgment.html for details).    //
//        If you will not acknowledge, just send us a email. We'll be         //
//        *VERY* happy to see our work being used by other people. :)         //
//        The email is: acknowledgment_opensource@AmazingCow.com              //
//     3. Altered source versions must be plainly marked as such,             //
//        and must notbe misrepresented as being the original software.       //
//     4. This notice may not be removed or altered from any source           //
//        distribution.                                                       //
//     5. Most important, you must have fun. ;)                               //
//                                                                            //
//      Visit opensource.amazingcow.com for more open-source projects.        //
//                                                                            //
//                                  Enjoy :)                                  //
//----------------------------------------------------------------------------//

//Header
#import "UIColor+COWHexStringAdditions.h"
//COW Macros
#import "COW_Cast_Macros.h"


// Implementation //
@implementation UIColor (COWHexStringAdditions)

+ (UIColor *)cow_colorWithHexString:(NSString *)hexString
{
    //Check if string is valid.
    if(!hexString || hexString.length != 6)
    {
        #if UIKITHELPERS_UICOLORCOW_HEXSTRINGADDITIONS_ASSERT_ON_INVALID_VALUES != 0
            NSAssert2(NO,
                      @"UIColor+COWHexStringAdditions cow_colorWithHexString: Invalid hexString was given - Expected lengh(6) - Found %@ size: %ld",
                      hexString,
                      hexString.length);
        #endif
        
        return nil;
    }
    
    NSRange redRange   = NSMakeRange(0, 2);
    NSRange greenRange = NSMakeRange(2, 2);
    NSRange blueRange  = NSMakeRange(4, 2);
    
    return [UIColor cow_colorWithHexRed:[hexString substringWithRange:redRange]
                               hexGreen:[hexString substringWithRange:greenRange]
                                hexBlue:[hexString substringWithRange:blueRange]];
}

+ (UIColor *)cow_colorWithHexRed:(NSString *)redHexString
                        hexGreen:(NSString *)greenHexString
                         hexBlue:(NSString *)blueHexString
{
    //Must have all components.
    if(!redHexString || !greenHexString || !blueHexString)
        return nil;
    
    int iRed, iGreen, iBlue;
    
    sscanf([redHexString   UTF8String], "%x", &iRed);
    sscanf([greenHexString UTF8String], "%x", &iGreen);
    sscanf([blueHexString  UTF8String], "%x", &iBlue);
    
    return [UIColor colorWithRed:iRed   / 255.0
                           green:iGreen / 255.0
                            blue:iBlue  / 255.0
                           alpha:1];
}

- (NSString *)cow_hexString
{
    CGFloat fRed, fGreen, fBlue;
    int     iRed, iGreen, iBlue;
    
    //Try to get the color components. If any error happened
    //just return a nil value.
    if(![self getRed:&fRed green:&fGreen blue:&fBlue alpha:NULL])
        return nil;
    
    //Convert integer and scale to [0,255].
    iRed   = COW_UKH_VAR_CAST(fRed   * 255, int);
    iGreen = COW_UKH_VAR_CAST(fGreen * 255, int);
    iBlue  = COW_UKH_VAR_CAST(fBlue  * 255, int);
    
    return [NSString stringWithFormat:@"%02x%02x%02x",iRed, iGreen, iBlue];
}

@end
