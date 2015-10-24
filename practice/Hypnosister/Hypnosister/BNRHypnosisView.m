//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Osbert Orr on 10/20/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"
@interface BNRHypnosisView ()
@property (strong, nonatomic) UIColor *circleColor;
@end

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The circle will be the largest that will fit in the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Create concentric circles
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
    
    
    // Set gradient
    /*
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    float scale = 0.6;
    CGSize imageSize = logoImage.size;
    imageSize.height *= scale;
    imageSize.width *= scale;
    
    UIBezierPath *clipPath = [UIBezierPath bezierPath];
    [clipPath moveToPoint:CGPointMake(center.x, center.y - imageSize.height / 2)];
    [clipPath addLineToPoint:CGPointMake(center.x + imageSize.width / 2, center.y + imageSize.height / 2)];
    [clipPath addLineToPoint:CGPointMake(center.x - imageSize.width / 2, center.y + imageSize.height / 2)];
    [clipPath addLineToPoint:CGPointMake(center.x, center.y - imageSize.height / 2)];
    
    CGFloat locations[2] = {0.0, 0.7};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0};
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(center.x - imageSize.width / 2, center.y + imageSize.height / 2);
    CGPoint endPoint = CGPointMake(center.x + imageSize.width / 2, center.y + imageSize.height / 2);
    
    CGContextSaveGState(currentContext);
    [clipPath addClip];
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(currentContext);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    // Set draw image with drop shadow
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    [logoImage drawInRect:CGRectMake(center.x - imageSize.width / 2, center.y - imageSize.height / 2, scale * bounds.size.width, scale * bounds.size.height)];
    CGContextRestoreGState(currentContext);
     */
}

// When a finger touches the screen
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ was touhed", self);
    
    // Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}


@end
