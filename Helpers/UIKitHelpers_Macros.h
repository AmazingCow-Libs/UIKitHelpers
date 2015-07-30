//----------------------------------------------------------------------------//
//                 █      █                                                   //
//                 ████████                                                   //
//               ██        ██                                                 //
//              ███  █  █  ███    UIKitHelpers_Macros.h                       //
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

#ifndef __N2OBoyz_UIKitHelpers_Helpers__N2OUIKitHelpers_Macros__
#define __N2OBoyz_UIKitHelpers_Helpers__N2OUIKitHelpers_Macros__

// LOG //
#ifdef DEBUG
    //COWLog
    #define COWLog(FORMAT, ...) do { \
        fprintf(stderr,"%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]); \
    } while(0)
    //COWSelfLog
    #define COWSelfLog(FORMAT, ...) do { \
        fprintf(stderr, "%s: ", [NSStringFromClass([self class]) UTF8String]); \
        COWLog(FORMAT, ##__VA_ARGS__);\
    } while(0)

    //COWLog Error
    #define COWLog_Error(FORMAT, ...) do { \
        fprintf(stderr,"%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]); \
        exit(1); \
    } while(0)
#else
    #define COWLog(...) do {} while (0)
    #define COWLog_Error(...) do { exit(1); } while(0)
#endif

// Singleton //
#define COW_UKH_INTERFACE_SINGLETON_OF(_type_) +(_type_ *)instance
#define COW_UKH_IMPLEMENTATION_SINGLETON_OF(_type_) \
    +(_type_ *)instance                             \
    {                                               \
        static _type_ *s_instance = nil;            \
        if(s_instance == nil)                       \
            s_instance = [[_type_ alloc] init];     \
        return s_instance;                          \
}

// String Convertions //
//char * -> NSString
#define COW_UKH_STR_C2NS(_str_) [NSString stringWithFormat:@"%s", _str_]
//std::string -> NSString
#define COW_UKH_STR_CPP2NS(_str_) COW_UKH_STR_C2NS(_str_.c_str())
//NSString -> char *
#define COW_UKH_STR_NS2C(_str_) [_str_ UTF8String]
//NSString -> std::string
#define COW_UKH_STR_NS2CPP(_str_) std::string(COW_UKH_STR_NS2C(_str_))

// CAST //
#define COW_UKH_VAR_CAST(_var_, _type_) ((_type_)(_var_))

// Some Useful Constants //
#define kCOW_UKH_ArrayInvalidIndex -1

// Some Useful MacroFunctions //
#define COW_UKH_UUID() [[NSUUID UUID] UUIDString]

#define COW_UKH_ENCODEOBJ(_coder_, _name_) [_coder_ encodeObject:_name_ forKey:@#_name_]
#define COW_UKH_DECODEOBJ(_decoder_, _name_) _name_ = [_decoder_ decodeObjectForKey:@#_name_]

#endif // defined( __N2OBoyz_UIKitHelpers_Helpers__N2OBoyz_UIKitHelpers_Macros__ )
