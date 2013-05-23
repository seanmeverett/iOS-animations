//
//  EvoMotionViewController.h
//  EvoMotion
//
//  Created by Sean Everett on 11/27/11.
//  Copyright 2011 Evolyte LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EvoMotionParticleView.h"

@interface EvoMotionViewController : UIViewController <UIScrollViewDelegate>
{
    UIImageView *explosionView;
    BOOL uncheckedTapped;
    IBOutlet EvoMotionParticleView* fireView;
}

@property (assign) IBOutlet UIImageView *shutterTop;
@property (assign) IBOutlet UIImageView *shutterBottom;
@property (assign) IBOutlet UIImageView *logo;
@property (assign) IBOutlet UIImageView *unchecked;
@property (assign) IBOutlet UIImageView *checked;

@end
