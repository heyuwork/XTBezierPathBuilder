//
//  DrawBezierViewController.m
//  XTBezierPathBuilderDemo
//
//  Created by xietao on 2017/6/12.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "DrawBezierViewController.h"
#import "DrawBezierView.h"

@interface DrawBezierViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bezierLevelLabel;

@property (nonatomic, strong) DrawBezierView *bezierView;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end

@implementation DrawBezierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"点击空白处设置"];
    _bezierView = [[DrawBezierView alloc] initWithFrame:CGRectMake(0,
                                                                   60,
                                                                   self.view.bounds.size.width,
                                                                   self.view.bounds.size.height-60)];
    [self.view addSubview:_bezierView];
    [self.view sendSubviewToBack:_bezierView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - IBAction
- (IBAction)stepperValueChangedAction:(id)sender {
    UIStepper *stepper = sender;
    _bezierLevelLabel.text = [NSString stringWithFormat:@"%.0f阶",stepper.value-1];
    [_bezierView updatePointNumber:stepper.value];
}


- (IBAction)sliderValueChanged:(id)sender {
    UISlider *stepper = sender;
    [_bezierView setBezierProgress:stepper.value];
    [_progressLabel setText:[NSString stringWithFormat:@"%.2f",stepper.value]];
}

- (void)setBezierProgress:(CGFloat)progress {
    static float tempProgress = 0;
    [_slider setValue:tempProgress animated:YES];
    tempProgress+=0.01;
    NSLog(@"%f",tempProgress);
    sleep(1.0);
    
    if (tempProgress<1.0) {
        [self setBezierProgress:0];
    }
    
}

@end
