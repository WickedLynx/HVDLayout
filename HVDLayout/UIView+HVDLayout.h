//
//  UIView+HVDLayout.h
//
//  Created by Harshad on 03/07/14.
//

#import <UIKit/UIKit.h>

@interface UIView (HVDLayout)

// MARK: Fill

- (void)HVD_fillSubview:(UIView *)subview withInsets:(UIEdgeInsets)insets NS_DEPRECATED_IOS(6_0, 7_0);

- (NSArray *)HVD_fillInSuperViewWithInsets:(UIEdgeInsets)insets;
- (NSArray *)HVD_fillVerticallyInSuperviewWithTopMargin:(CGFloat)top bottomMargin:(CGFloat)bottom;
- (NSArray *)HVD_fillHorizontallyInSuperviewWithLeftMargin:(CGFloat)left rightMargin:(CGFloat)right;

// MARK: Center

- (NSArray *)HVD_centerInSuperView;
- (NSLayoutConstraint *)HVD_centerXInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;
- (NSLayoutConstraint *)HVD_centerYInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;

- (void)HVD_centerSubview:(UIView *)subview NS_DEPRECATED_IOS(6_0, 7_0);
- (void)HVD_centerXWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant subview:(UIView *)subview NS_DEPRECATED_IOS(6_0, 7_0);
- (void)HVD_centerYWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant subview:(UIView *)subview NS_DEPRECATED_IOS(6_0, 7_0);

// MARK: Pin inside the superview

- (NSLayoutConstraint *)HVD_pinToBottomOfSuperviewWithMargin:(CGFloat)margin;
- (NSLayoutConstraint *)HVD_pinToTopOfSuperviewWithMargin:(CGFloat)margin;
- (NSLayoutConstraint *)HVD_pinToLeftOfSuperviewWithMargin:(CGFloat)margin;
- (NSLayoutConstraint *)HVD_pinToRightOfSuperviewWithMargin:(CGFloat)margin;

// MARK: Pin relative to siblings

- (NSLayoutConstraint *)HVD_pinToRightOfView:(UIView *)view withMargin:(CGFloat)margin;
- (NSLayoutConstraint *)HVD_pinToLeftOfView:(UIView *)view withMargin:(CGFloat)margin;
- (NSLayoutConstraint *)HVD_pinToTopOfView:(UIView *)view withMargin:(CGFloat)margin;
- (NSLayoutConstraint *)HVD_pinToBottomOfView:(UIView *)view withMargin:(CGFloat)margin;

// MARK: Set dimensions

- (NSLayoutConstraint *)HVD_setWidth:(CGFloat)width;
- (NSLayoutConstraint *)HVD_setHeight:(CGFloat)height;
- (NSLayoutConstraint *)HVD_setWidthRelativeToView:(UIView *)view withMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;
- (NSLayoutConstraint *)HVD_setHeightRelativeToView:(UIView *)view withMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;

// MARK: Relative attributes

- (void)HVD_matchLayoutAttribute:(NSLayoutAttribute)attribute ofSubviews:(NSArray *)subviews;

// MARK: Flexible spaces

- (UIView *)HVD_addFlexibleSpace;

@end
