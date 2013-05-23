//
//  EvoMotionParticleView.h
//  EvoMotion
//
//  Created by Sean Everett on 11/27/11.
//  Copyright 2011 Evolyte LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvoMotionParticleView : UIView

-(void)setEmitterPositionFromTouch: (UITouch*)t;
-(void)setIsEmitting:(BOOL)isEmitting;

@end
