//
//  UIView+HVDLayout.h
//
//  Created by Harshad on 03/07/14.
//

#import <UIKit/UIKit.h>

@interface UIView (HVDLayout)

// MARK: Fill

- (void)HVD_fillSubview:(UIView *)subview withInsets:(UIEdgeInsets)insets NS_DEPRECATED_IOS(6_0, 7_0);

- (void)HVD_fillInSuperViewWithInsets:(UIEdgeInsets)insets;
- (void)HVD_fillVerticallyInSuperviewWithTopMargin:(CGFloat)top bottomMargin:(CGFloat)bottom;
- (void)HVD_fillHorizontallyInSuperviewWithLeftMargin:(CGFloat)left rightMargin:(CGFloat)right;

// MARK: Center

- (void)HVD_centerInSuperView;
- (void)HVD_centerXInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;
- (void)HVD_centerYInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;

- (void)HVD_centerSubview:(UIView *)subview NS_DEPRECATED_IOS(6_0, 7_0);
- (void)HVD_centerXWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant subview:(UIView *)subview NS_DEPRECATED_IOS(6_0, 7_0);
- (void)HVD_centerYWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant subview:(UIView *)subview NS_DEPRECATED_IOS(6_0, 7_0);

// MARK: Pin

- (void)HVD_pinToBottomOfSuperviewWithMargin:(CGFloat)margin;
- (void)HVD_pinToTopOfSuperviewWithMargin:(CGFloat)margin;
- (void)HVD_pinToLeftOfSuperviewWithMargin:(CGFloat)margin;
- (void)HVD_pinToRightOfSuperviewWithMargin:(CGFloat)margin;


// MARK: Set dimensions

- (void)HVD_setWidth:(CGFloat)width;
- (void)HVD_setHeight:(CGFloat)height;

// MARK: Relative attributes

- (void)HVD_matchLayoutAttribute:(NSLayoutAttribute)attribute ofSubviews:(NSArray *)subviews;

// MARK: Flexible spaces

- (UIView *)HVD_addFlexibleSpace;

@end
