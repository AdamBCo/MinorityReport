//
//  ViewController.m
//  MinorityReport
//
//  Created by Adam Cooper on 10/2/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFuture;
@property (weak, nonatomic) IBOutlet UILabel *thePrecogs;
@property CGPoint originalCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    self.originalCenter = self.theFuture.center;
}

- (IBAction)onDrag:(UIPanGestureRecognizer *)panGesture{
    CGPoint point = [panGesture locationInView:self.view];
    self.theFuture.center = point;
    NSLog(@"Up Drag");
    
    if(panGesture.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:1.0 animations:^{
            self.theFuture.backgroundColor = [UIColor yellowColor];
            self.theFuture.center = self.originalCenter;
        }];
    } else {
        
        if (CGRectContainsPoint(self.thePrecogs.frame, point)) {
            self.theFuture.backgroundColor = [UIColor redColor];
            self.theFuture.text = @"The ficticious and incriminating future.";
            [self.theFuture sizeToFit];
        }
    }
    
}

@end
