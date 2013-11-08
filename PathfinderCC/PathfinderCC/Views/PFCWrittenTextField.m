//
//  PFCWrittenTextField.m
//  PathfinderCC
//
//  Created by Dalton Claybrook on 11/8/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import "PFCWrittenTextField.h"
#import <QuartzCore/QuartzCore.h>

static CGFloat const kFieldNameHeight = 20.0f;

#pragma mark - Initializers

@implementation PFCWrittenTextField

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self PFCWrittenTextFieldCommonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self PFCWrittenTextFieldCommonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self PFCWrittenTextFieldCommonInit];
    }
    return self;
}

#pragma mark - Overrides

- (void)drawRect:(CGRect)rect
{
    CGRect fieldNameRect = [self fieldNameRectForBounds:self.bounds];
    if (CGRectEqualToRect(fieldNameRect, CGRectZero)) return;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);

    CGContextMoveToPoint(context, CGRectGetMinX(fieldNameRect), CGRectGetMinY(fieldNameRect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(fieldNameRect), CGRectGetMinY(fieldNameRect));
    CGContextStrokePath(context);
    if (self.fieldName)
    {
        [self.fieldName drawInRect:fieldNameRect];
    }
    [super drawRect:rect];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    if (bounds.size.height < kFieldNameHeight) return CGRectZero;
    
    return CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height-kFieldNameHeight);
}

#pragma mark - Properties

- (void)setBorderStyle:(UITextBorderStyle)borderStyle
{
    [super setBorderStyle:UITextBorderStyleNone];   // Only supported border style is none.
}

#pragma mark - Private

- (void)PFCWrittenTextFieldCommonInit
{
    self.borderStyle = UITextBorderStyleNone;
    self.fieldName = [[NSAttributedString alloc] initWithString:@"Field Name" attributes:@{ NSFontAttributeName : [UIFont italicSystemFontOfSize:12.0f] }];
}

- (CGRect)fieldNameRectForBounds:(CGRect)bounds
{
    if (bounds.size.height < kFieldNameHeight) return CGRectZero;
    
    return CGRectMake(bounds.origin.x, CGRectGetMaxY(bounds)-kFieldNameHeight, bounds.size.width, kFieldNameHeight);
}

@end
