
//COWTODO: Add license header.

//Header
#import "UINavigationController+COWShadowlessNavigationBar.h"
//COW Categories.
#import "UIImage+COWColorAdditions.h"

@implementation UINavigationController (COWShadowlessNavigationBar)

- (void)cow_setShadowlessNavigationBarWithColor:(UIColor *)color
{
    UINavigationBar *navigationBar = self.navigationBar;

    //Tint the NavigationBar.
    [navigationBar setBackgroundImage:[UIImage cow_imageWithColor:color]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];

    //Remove the shadow.
    [navigationBar setShadowImage:[UIImage new]];
}

@end
