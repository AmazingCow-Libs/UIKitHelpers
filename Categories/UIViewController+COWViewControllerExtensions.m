//
//  UIViewController+N2OViewControllerExtensions.m
//  TiagoAlmeida_iOSAuto
//
//  Created by Mateus Mesquita on 7/6/15.
//  Copyright (c) 2015 N2OBoyz. All rights reserved.
//

#import "UIViewController+N2OViewControllerExtensions.h"

@implementation UIViewController (N2OViewControllerExtensions)

+ (UINavigationController *)createInsideNavController
{
    return [[[self alloc] init] embedInNavController];
}
- (UINavigationController *)embedInNavController
{
    return [[UINavigationController alloc] initWithRootViewController:self];
}
@end
