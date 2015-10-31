//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Osbert Orr on 10/28/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

typedef struct {
    CGPoint center;
    float radius;
} Circle;

@interface BNRDrawView ()
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@property (nonatomic, strong) NSMutableDictionary<NSValue *, UITouch *> *first2SimultaneousTouches;
@property (nonatomic, strong) NSMutableArray *finishedCircles;
@property (nonatomic) Circle circleInProgress;
@end

@implementation BNRDrawView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.first2SimultaneousTouches = [[NSMutableDictionary alloc] init];
        self.finishedCircles = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    
    return self;
}

- (void)strokeLine:(BNRLine *)line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    NSLog(@"Draw line from (%.1f, %.1f) to (%.1f, %.1f)", line.begin.x, line.begin.y, line.end.x, line.end.y);
    [bp stroke];
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect");
    // Draw finished lines in black
    [[UIColor blackColor] set];
    
    BNRLine *line;
    
    for (line in self.finishedLines) {
        [[self getColorForDegrees:line.angle] set];
        [self strokeLine:line];
    }
    
    for (NSValue *value in self.finishedCircles) {
        Circle tempCircle;
        [value getValue:&tempCircle];
        [[UIColor blueColor] set];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:tempCircle.center radius:tempCircle.radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
        [path stroke];
        
    }
    
    for (NSValue *key in self.linesInProgress) {
        line = self.linesInProgress[key];
        [[self getColorForDegrees:line.angle] set];
        [self strokeLine:line];
    }
    
    if (self.circleInProgress.radius != 0) {
        [[UIColor blueColor] set];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.circleInProgress.center radius:self.circleInProgress.radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
        [path stroke];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSEnumerator *enumerator = [touches objectEnumerator];
    UITouch *aTouch;
    NSValue *key;
    
    while([self.first2SimultaneousTouches count] < 2 && [touches count] > 1) {
        if (aTouch = [enumerator nextObject]) {
            key = [NSValue valueWithNonretainedObject:aTouch];
            [self.first2SimultaneousTouches setObject:aTouch forKey:key];
        } else {
            break;
        }
    }
    
    [self setCircleProperties:touches];
    
    for (UITouch *t in touches) {
        key = [NSValue valueWithNonretainedObject:t];
        
        // Continue to add other lines
        if ([self.first2SimultaneousTouches objectForKey:key]) {
            continue;
        }
        
        CGPoint location = [t locationInView:self];
        NSLog(@"Touches began location (x,y) = (%.1f, %.1f)", location.x, location.y);
        
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        
        self.linesInProgress[key] = line;
    }
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        
        // Update touches tracking circle
        if ([self.first2SimultaneousTouches objectForKey:key]) {
            [self.first2SimultaneousTouches setObject:t forKey:key];
            [self setCircleProperties:touches];
        } else {
        
        BNRLine *line = self.linesInProgress[key];
        
        line.end = [t locationInView:self];
        line.angle = [self angleInDegreesOf:line];
        NSLog(@"Touches moved location (x,y) = (%.1f, %.1f)", line.end.x, line.end.y);
        }
    }
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        
        // Update touches tracking circle
        if ([self.first2SimultaneousTouches objectForKey:key]) {
            [self.first2SimultaneousTouches removeObjectForKey:key];
            
            if ([self.first2SimultaneousTouches count] == 0) {
                Circle tempCircle = self.circleInProgress;
                NSValue *value = [[NSValue alloc] initWithBytes:&tempCircle objCType:@encode(Circle)];
                [self.finishedCircles addObject:value];
                tempCircle.center = CGPointMake(0, 0);
                tempCircle.radius = 0;
                self.circleInProgress = tempCircle;
            }
        } else {
            BNRLine *line = self.linesInProgress[key];
            
            [self.finishedLines addObject:line];
            [self.linesInProgress removeObjectForKey:key];
        }
    }
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Let's put in a log statement to see the order of events
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
        [self.first2SimultaneousTouches removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

- (float)angleInDegreesOf:(BNRLine *)line {
    float opposite = line.end.y - line.begin.y;
    float adjacent = line.end.x - line.begin.x;
    float angleInRadians = atan2f(opposite, adjacent);
    float angleInDegrees = angleInRadians * 180 / M_PI;
    
    angleInDegrees = (angleInDegrees < 0) ? fabsf(angleInDegrees) : 360 - angleInDegrees;
    NSLog(@"opposite = %f, adjacent = %f, opposite/adjacent = %f, angleInDegrees = %f", opposite, adjacent, opposite / adjacent, angleInDegrees);
    
    return angleInDegrees;
}

- (UIColor *)getColorForDegrees:(float)angleInDegrees {
    int intAngleInDegrees = (int)angleInDegrees;
    NSLog(@"angleInDegrees = %f, intAngleInDegrees = %d", angleInDegrees, intAngleInDegrees);
    float red = (float)(intAngleInDegrees % 100) / 100;
    float green = (float)((intAngleInDegrees * 360) % 100) / 100;
    float blue = (float)((intAngleInDegrees * 500) % 100) / 100;
    
    NSLog(@"red = %f, green = %f, blue = %f", red, green, blue);
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (void)setCircleProperties:(NSSet<UITouch *> *)touches {
    NSEnumerator *enumerator = [touches objectEnumerator];
    UITouch *aTouch;
    
    if ([self.first2SimultaneousTouches count] == 2) {
        enumerator = [self.first2SimultaneousTouches objectEnumerator];
        Circle aCircle;
        
        CGPoint location[2];
        for (int i = 0; (aTouch = [enumerator nextObject]) != nil; i++) {
            location[i] = [aTouch locationInView:self];
        }
        
        aCircle.center = CGPointMake((location[0].x + location[1].x) / 2, (location[0].y + location[1].y) / 2);
        aCircle.radius = sqrtf(powf(aCircle.center.x - location[0].x, 2) + powf(aCircle.center.y - location[0].y, 2));
        self.circleInProgress = aCircle;
    }
}
@end
