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

#ifndef __N2OBoyz_UIKitHelpers_Helpers__N2OUIKitHelpers_Macros__
#define __N2OBoyz_UIKitHelpers_Helpers__N2OUIKitHelpers_Macros__

// LOG //
#ifdef DEBUG
    //N2OLog
    #define N2OLog(FORMAT, ...) do { \
        fprintf(stderr,"%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]); \
    } while(0)
    //N2OSelfLog
    #define N2OSelfLog(FORMAT, ...) do { \
        fprintf(stderr, "%s: ", [NSStringFromClass([self class]) UTF8String]); \
        N2OLog(FORMAT, ##__VA_ARGS__);\
    } while(0)

    //N2OLog Error
    #define N2OLog_Error(FORMAT, ...) do { \
        fprintf(stderr,"%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]); \
        exit(1); \
    } while(0)
#else
    #define N2OLog(...) do {} while (0)
    #define N2OLog_Error(...) do { exit(1); } while(0)
#endif

// Singleton //
#define N2O_UKH_INTERFACE_SINGLETON_OF(_type_) +(_type_ *)instance
#define N2O_UKH_IMPLEMENTATION_SINGLETON_OF(_type_) \
    +(_type_ *)instance                             \
    {                                               \
        static _type_ *s_instance = nil;            \
        if(s_instance == nil)                       \
            s_instance = [[_type_ alloc] init];     \
        return s_instance;                          \
}

// String Convertions //
//char * -> NSString
#define N2O_UKH_STR_C2NS(_str_) [NSString stringWithFormat:@"%s", _str_]
//std::string -> NSString
#define N2O_UKH_STR_CPP2NS(_str_) N2O_UKH_STR_C2NS(_str_.c_str())
//NSString -> char *
#define N2O_UKH_STR_NS2C(_str_) [_str_ UTF8String]
//NSString -> std::string
#define N2O_UKH_STR_NS2CPP(_str_) std::string(N2O_UKH_STR_NS2C(_str_))

// CAST //
#define N2O_UKH_VAR_CAST(_var_, _type_) ((_type_)(_var_))

// Some Useful Constants //
#define kN2O_UKH_ArrayInvalidIndex -1

// Some Useful MacroFunctions //
#define N2O_UKH_UUID() [[NSUUID UUID] UUIDString]

#define N2O_UKH_ENCODEOBJ(_coder_, _name_) [_coder_ encodeObject:_name_ forKey:@#_name_]
#define N2O_UKH_DECODEOBJ(_decoder_, _name_) _name_ = [_decoder_ decodeObjectForKey:@#_name_]

#endif // defined( __N2OBoyz_UIKitHelpers_Helpers__N2OBoyz_UIKitHelpers_Macros__ )
