//
//  EvoMotionViewController.m
//  EvoMotion
//
//  Created by Sean Everett on 11/27/11.
//  Copyright 2011 Evolyte LLC. All rights reserved.
//

#import "EvoMotionViewController.h"

@implementation EvoMotionViewController

@synthesize shutterTop;
@synthesize shutterBottom;
@synthesize logo;
@synthesize unchecked;
@synthesize checked;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //shutter animation rolling up
    CGRect shutterBottomFrame = shutterBottom.frame;
    shutterBottomFrame.origin.y = -shutterBottomFrame.size.height;
    
    [UIView animateWithDuration:2.0
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         shutterBottom.frame = shutterBottomFrame;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Shutter done!");
                     }];
    
    //logo animation coming in from bottom
    CGRect logoFrame = logo.frame;
    logoFrame.origin.y = -logoFrame.size.height + 450;
    
    [UIView animateWithDuration:2.0
                          delay:2.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         logo.frame = logoFrame;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Logo done!");
                     }];
    
    //unchecked animation coming in from bottom
    CGRect uncheckedFrame = unchecked.frame;
    uncheckedFrame.origin.y = uncheckedFrame.size.height;
    
    [UIView animateWithDuration:1.25
                          delay:2.0
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         unchecked.frame = uncheckedFrame;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Unchecked done!");
                     }];
    
    //checked animation coming in from bottom
    CGRect checkedFrame = checked.frame;
    checkedFrame.origin.y = checkedFrame.size.height;
    
    [UIView animateWithDuration:1.25
                          delay:2.0
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         checked.frame = checkedFrame;
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Checked done!");
                     }];
    
    if (uncheckedTapped) return;
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setEmitterPositionFromTouch: [touches anyObject]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setEmitterPositionFromTouch: [touches anyObject]];
    [fireView setIsEmitting:YES];
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    CGRect uncheckedFrame = unchecked.frame;
    if (CGRectContainsPoint(uncheckedFrame, touchLocation)) {
        NSLog(@"unchecked tapped!");
    } else {
        NSLog(@"unchecked not tapped.");
        return;
    }
    
    uncheckedTapped = true;
    
    NSMutableArray *explosions = [NSMutableArray array];
	for (int i = 1; i <= 25; i++)
		[explosions addObject:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"explosions_%d", i] ofType:@"png"]]];

    explosionView = [[UIImageView alloc] initWithFrame:CGRectMake(130.0, 130.0, 64.0, 64.0)]; 
    explosionView.animationImages = explosions;
	explosionView.animationDuration = 1.25;
    explosionView.animationRepeatCount = 1;
	[self.view addSubview:explosionView];
	[explosionView startAnimating];
    
     
    [UIView animateWithDuration:.25 
                          delay:0.0 
                        options:0
                    animations:^{                      
                                unchecked.alpha = 0.0;
                                } completion:^(BOOL finished) {
                                [unchecked removeFromSuperview];
                                unchecked = nil;
    }];                 
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setIsEmitting:NO];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [fireView setIsEmitting:NO];
}


@end
