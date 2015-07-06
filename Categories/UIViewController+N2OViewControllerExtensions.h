//
//  UIViewController+N2OViewControllerExtensions.h
//  TiagoAlmeida_iOSAuto
//
//  Created by Mateus Mesquita on 7/6/15.
//  Copyright (c) 2015 N2OBoyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (N2OViewControllerExtensions)

+ (UINavigationController *)createInsideNavController;
- (UINavigationController *)embedInNavController;

@end
