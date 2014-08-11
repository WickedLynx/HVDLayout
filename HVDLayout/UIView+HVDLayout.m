//
//  UIView+HVDLayout.m
//
//  Created by Harshad on 03/07/14.
//

#import "UIView+HVDLayout.h"

@implementation UIView (HVDLayout)

// MARK: Fill the view

- (void)HVD_fillSubview:(UIView *)subview withInsets:(UIEdgeInsets)insets {
    if (([subview.superview isEqual:self])) {

        [subview setTranslatesAutoresizingMaskIntoConstraints:NO];

        NSDictionary *views = NSDictionaryOfVariableBindings(self, subview);
        NSDictionary *metrics = @{@"top" : @(insets.top), @"left" : @(insets.left), @"bottom" : @(insets.bottom), @"right" : @(insets.right)};

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[subview(==self@500)]-right-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[subview(==self@500)]-bottom-|" options:0 metrics:metrics views:views]];
    }
}

- (void)HVD_fillInSuperViewWithInsets:(UIEdgeInsets)insets {
    if (self.superview != nil) {
        [self HVD_fillVerticallyInSuperviewWithTopMargin:insets.top bottomMargin:insets.bottom];
        [self HVD_fillHorizontallyInSuperviewWithLeftMargin:insets.left rightMargin:insets.right];
    }
}

- (void)HVD_fillVerticallyInSuperviewWithTopMargin:(CGFloat)top bottomMargin:(CGFloat)bottom {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        NSDictionary *views = NSDictionaryOfVariableBindings(self);
        NSDictionary *metrics = @{@"top": @(top), @"bottom" : @(bottom)};
        [superView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[self]-bottom-|" options:0 metrics:metrics views:views]];
    }
}

- (void)HVD_fillHorizontallyInSuperviewWithLeftMargin:(CGFloat)left rightMargin:(CGFloat)right {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        NSDictionary *views = NSDictionaryOfVariableBindings(self);
        NSDictionary *metrics = @{@"left": @(left), @"right" : @(right)};
        [superView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[self]-right-|" options:0 metrics:metrics views:views]];
    }
}

// MARK: Center

- (void)HVD_centerSubview:(UIView *)subview {
    [self HVD_centerXWithMultiplier:1.0f constant:0.0f subview:subview];
    [self HVD_centerYWithMultiplier:1.0f constant:0.0f subview:subview];
}

- (void)HVD_centerXWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant subview:(UIView *)subview {
    if ([subview.superview isEqual:self]) {

        [subview setTranslatesAutoresizingMaskIntoConstraints:NO];

        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:multiplier constant:constant]];
    }
}

- (void)HVD_centerYWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant subview:(UIView *)subview {
    if ([subview.superview isEqual:self]) {

        [subview setTranslatesAutoresizingMaskIntoConstraints:NO];

        [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:multiplier constant:constant]];
    }
}

- (void)HVD_centerInSuperView {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self HVD_centerXInSuperViewWithMultiplier:1.0f constant:0.0f];
        [self HVD_centerYInSuperViewWithMultiplier:1.0f constant:0.0f];
    }
}

- (void)HVD_centerXInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:multiplier constant:constant]];
    }
}

- (void)HVD_centerYInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterY multiplier:multiplier constant:constant]];
    }
}

// MARK: Pin

- (void)HVD_pinToBottomOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin]];
    }
}

- (void)HVD_pinToTopOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeTop multiplier:0.0f constant:margin]];
    }
}

- (void)HVD_pinToLeftOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeLeft multiplier:0.0f constant:margin]];
    }
}

- (void)HVD_pinToRightOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superView = self.superview;
    if (superView != nil) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        [superView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeRight multiplier:0.0f constant:-margin]];
    }
}

// MARK: Set dimensions

- (void)HVD_setHeight:(CGFloat)height {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:height]];
}

- (void)HVD_setWidth:(CGFloat)width {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:width]];
}

// MARK: Relative attributes

- (void)HVD_matchLayoutAttribute:(NSLayoutAttribute)attribute ofSubviews:(NSArray *)subviews {

    if ([subviews count] > 1) {
        UIView *firstSubview = nil;
        for (UIView *subview in subviews) {
            if (firstSubview == nil) {
                firstSubview = subview;
                continue;
            }

            [self addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:attribute relatedBy:NSLayoutRelationEqual toItem:firstSubview attribute:attribute multiplier:1.0f constant:0.0f]];
        }
        
    }
}

// MARK: Flexible space

- (UIView *)HVD_addFlexibleSpace {
    UIView *space = [UIView new];
    [space setBackgroundColor:[UIColor clearColor]];
    [space setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:space];
    return space;
}

@end
