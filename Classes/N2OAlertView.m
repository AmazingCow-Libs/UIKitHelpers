//----------------------------------------------------------------------------//
//                   _   _ ____   ___  ____                                   //
//                  | \ | |___ \ / _ \| __ )  ___  _   _ ____                 //
//                  |  \| | __) | | | |  _ \ / _ \| | | |_  /                 //
//                  | |\  |/ __/| |_| | |_) | (_) | |_| |/ /                  //
//                  |_| \_|_____|\___/|____/ \___/ \__, /___|                 //
//                                                 |___/                      //
//                                                                            //
//                                   N2OMatt                                  //
//                              matt@N2OBoyz.com                              //
//                            www.N2OBoyz.com/matt                            //
//                                                                            //
//                         Copyright (C) 2015 N2OBoyz.                        //
//                                                                            //
//      This software is provided 'as-is', without any express or implied     //
//    warranty. In no event will the authors be held liable for any damages   //
//                   arising from the use of this software.                   //
//                                                                            //
//    Permission is granted to anyone to use this software for any purpose,   //
//   including commercial applications, and to alter it and redistribute it   //
//               freely, subject to the following restrictions:               //
//                                                                            //
//     1. The origin of this software must not be misrepresented;             //
//        you must not claim that you wrote the original software.            //
//     2. If you use this software in a product, an acknowledgment in the     //
//        product IS HIGHLY APPRECIATED, both in source and binary forms.     //
//        If you will not acknowledge, just send me a email. We'll be VERY    //
//        happy to see our work being used by other people. :)                //
//        (See opensource.N2OBoyz.com/acknowledgment.html for details).       //
//     3. Altered source versions must be plainly marked as such,             //
//        and must notbe misrepresented as being the original software.       //
//     4. This notice may not be removed or altered from any source           //
//        distribution.                                                       //
//     5. Most important, you must have fun. ;)                               //
//                                                                            //
//         Visit OpenSource.N2OBoyz.com for more open-source projects.        //
//                                                                            //
//                                  Enjoy :)                                  //
//----------------------------------------------------------------------------//

//Headers
#import "N2OAlertView.h"
//Helpers
#import "N2OUIKitHelpers_Macros.h"

////////////////////////////////////////////////////////////////////////////////
// _AlertViewDelegate                                                         //
////////////////////////////////////////////////////////////////////////////////
@interface _AlertViewDelegate : NSObject <UIAlertViewDelegate>
//Properties
@property (nonatomic, copy) N2OAlertViewCallbackBlock callback;
//Singleton
N2O_UKH_INTERFACE_SINGLETON_OF(_AlertViewDelegate);
@end

@implementation _AlertViewDelegate
//Singleton
N2O_UKH_IMPLEMENTATION_SINGLETON_OF(_AlertViewDelegate)
//UIAlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.callback)
        self.callback(buttonIndex, [alertView buttonTitleAtIndex:buttonIndex]);
}
@end

////////////////////////////////////////////////////////////////////////////////
// N2OAlertView                                                               //
////////////////////////////////////////////////////////////////////////////////
// Implementation //
@implementation N2OAlertView

// One Button Alert View //
//Without callback.
+ (void)showOneButtonWithTitle:(NSString *)title
                       message:(NSString *)msg
                   buttonTitle:(NSString *)buttonTitle
{
    [N2OAlertView showOneButtonWithTitle:title
                                 message:msg
                             buttonTitle:buttonTitle
                                callback:nil];
}

//With callback.
+ (void)showOneButtonWithTitle:(NSString *)title
                       message:(NSString *)msg
                   buttonTitle:(NSString *)buttonTitle
                      callback:(N2OAlertViewCallbackBlock)callback
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
    [N2OAlertView showTwoButtonsWithTitle:title
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
                       callback:(N2OAlertViewCallbackBlock)callback
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
