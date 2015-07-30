//----------------------------------------------------------------------------//
//                 █      █                                                   //
//                 ████████                                                   //
//               ██        ██                                                 //
//              ███  █  █  ███    COWAlertView.m                              //
//              █ █        █ █    UIKitHelpers                                //
//               ████████████                                                 //
//             █              █   Copyright (c) 2015 AmazingCow               //
//            █     █    █     █  www.AmazingCow.com                          //
//            █     █    █     █                                              //
//             █              █   N2OMatt - n2omatt@amazingcow.com            //
//               ████████████     www.amazingcow.com/n2omatt                  //
//                                                                            //
//                                                                            //
//                  This software is licensed as LGPL-v3                      //
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
//        The email is: acknowledgment.opensource@AmazingCow.com              //
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

//Headers
#import "COWAlertView.h"
//Helpers
#import "UIKitHelpers_Macros.h"

////////////////////////////////////////////////////////////////////////////////
// _AlertViewDelegate                                                         //
////////////////////////////////////////////////////////////////////////////////
@interface _AlertViewDelegate : NSObject <UIAlertViewDelegate>
//Properties
@property (nonatomic, copy) COWAlertViewCallbackBlock callback;
//Singleton
COW_UKH_INTERFACE_SINGLETON_OF(_AlertViewDelegate);
@end

@implementation _AlertViewDelegate
//Singleton
COW_UKH_IMPLEMENTATION_SINGLETON_OF(_AlertViewDelegate)
//UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.callback)
        self.callback(buttonIndex, [alertView buttonTitleAtIndex:buttonIndex]);
}
@end

////////////////////////////////////////////////////////////////////////////////
// COWAlertView                                                               //
////////////////////////////////////////////////////////////////////////////////
// Implementation //
@implementation COWAlertView

// One Button Alert View //
//Without callback.
+ (void)showOneButtonWithTitle:(NSString *)title
                       message:(NSString *)msg
                   buttonTitle:(NSString *)buttonTitle
{
    [COWAlertView showOneButtonWithTitle:title
                                 message:msg
                             buttonTitle:buttonTitle
                                callback:nil];
}

//With callback.
+ (void)showOneButtonWithTitle:(NSString *)title
                       message:(NSString *)msg
                   buttonTitle:(NSString *)buttonTitle
                      callback:(COWAlertViewCallbackBlock)callback
{
    _AlertViewDelegate *delegate = [_AlertViewDelegate instance];
    delegate.callback = callback;

    [[[UIAlertView alloc] initWithTitle:title
                                message:msg
                               delegate:delegate
                      cancelButtonTitle:buttonTitle
                      otherButtonTitles:nil] show];
}


// Two Button Alert View //
//Without callback.
+ (void)showTwoButtonsWithTitle:(NSString *)title
                        message:(NSString *)msg
                    cancelTitle:(NSString *)cancelTitle
                   confirmTitle:(NSString *)confirmTitle
{
    [COWAlertView showTwoButtonsWithTitle:title
                                  message:msg
                              cancelTitle:cancelTitle
                             confirmTitle:confirmTitle
                                 callback:nil];
}
//With callback.
+ (void)showTwoButtonsWithTitle:(NSString *)title
                        message:(NSString *)msg
                    cancelTitle:(NSString *)cancelTitle
                   confirmTitle:(NSString *)confirmTitle
                       callback:(COWAlertViewCallbackBlock)callback
{
    _AlertViewDelegate *delegate = [_AlertViewDelegate instance];
    delegate.callback = callback;

    [[[UIAlertView alloc] initWithTitle:title
                                message:msg
                               delegate:delegate
                      cancelButtonTitle:cancelTitle
                      otherButtonTitles:confirmTitle, nil] show];
}

@end
