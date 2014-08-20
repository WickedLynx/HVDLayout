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

- (NSArray *)HVD_fillInSuperViewWithInsets:(UIEdgeInsets)insets {
    NSMutableArray *constraints = [[self HVD_fillVerticallyInSuperviewWithTopMargin:insets.top bottomMargin:insets.bottom] mutableCopy];
    [constraints addObjectsFromArray:[self HVD_fillHorizontallyInSuperviewWithLeftMargin:insets.left rightMargin:insets.right]];
    return constraints;
}

- (NSArray *)HVD_fillVerticallyInSuperviewWithTopMargin:(CGFloat)top bottomMargin:(CGFloat)bottom {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSDictionary *views = NSDictionaryOfVariableBindings(self, superview);
    NSDictionary *metrics = @{@"top": @(top), @"bottom" : @(bottom)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[self(==superView@500)]-bottom-|" options:0 metrics:metrics views:views];
    [superview addConstraints:constraints];
    return constraints;
}

- (NSArray *)HVD_fillHorizontallyInSuperviewWithLeftMargin:(CGFloat)left rightMargin:(CGFloat)right {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSDictionary *views = NSDictionaryOfVariableBindings(self, superview);
    NSDictionary *metrics = @{@"left": @(left), @"right" : @(right)};
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[self(==superView@500)]-right-|" options:0 metrics:metrics views:views];
    [superview addConstraints:constraints];
    return constraints;
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

- (NSArray *)HVD_centerInSuperView {
    NSMutableArray *addedConstraints = [NSMutableArray arrayWithCapacity:2];
    [addedConstraints addObject:[self HVD_centerXInSuperViewWithMultiplier:1.0f constant:0.0f]];
    [addedConstraints addObject:[self HVD_centerYInSuperViewWithMultiplier:1.0f constant:0.0f]];
    return addedConstraints;
}

- (NSLayoutConstraint *)HVD_centerXInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterX multiplier:multiplier constant:constant];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_centerYInSuperViewWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterY multiplier:multiplier constant:constant];
    [superview addConstraint:constraint];
    return constraint;
}

// MARK: Pin in superview

- (NSLayoutConstraint *)HVD_pinToBottomOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-margin];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_pinToTopOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1.0f constant:margin];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_pinToLeftOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:margin];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_pinToRightOfSuperviewWithMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:-margin];
    [superview addConstraint:constraint];
    return constraint;
}

// MARK: Pin relative to siblings

- (NSLayoutConstraint *)HVD_pinToRightOfView:(UIView *)view withMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0f constant:margin];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_pinToLeftOfView:(UIView *)view withMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:-margin];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_pinToTopOfView:(UIView *)view withMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0f constant:-margin];
    [superview addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_pinToBottomOfView:(UIView *)view withMargin:(CGFloat)margin {
    UIView *superview = self.superview;
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:margin];
    [superview addConstraint:constraint];
    return constraint;
}

// MARK: Set dimensions

- (NSLayoutConstraint *)HVD_setHeight:(CGFloat)height {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:height];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)HVD_setWidth:(CGFloat)width {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:width];
    [self addConstraint:constraint];
    return constraint;
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
