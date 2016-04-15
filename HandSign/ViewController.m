//
//  ViewController.m
//  HandSign
//
//  Created by 珍玮 on 16/4/14.
//  Copyright © 2016年 ZhenWei. All rights reserved.
//

#import "ViewController.h"
#import "ACEDrawingView/ACEDrawingView.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()<ACEDrawingViewDelegate>{
    ACEDrawingView *_drawingView;
}
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backStepBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *redoStepBtn;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _drawingView = [[ACEDrawingView alloc] initWithFrame:self.view.frame];
    _drawingView.backgroundColor = [UIColor greenColor];
    [self.view insertSubview:_drawingView belowSubview:_toolBar];
    
    _drawingView.delegate = self;
    
    _drawingView.lineAlpha = 1.0;
    _drawingView.lineWidth = 10.0;
    _drawingView.lineColor = [UIColor whiteColor];
    
    
}

-(void)updateBtnStatus{
    
    _backStepBtn.enabled = _drawingView.canUndo;
    _redoStepBtn.enabled = _drawingView.canRedo;
    
}


- (IBAction)clearAllAction:(id)sender {
    
    [_drawingView clear];
    
}
- (IBAction)backLastStep:(id)sender {
    
    [_drawingView undoLatestStep];
    [self updateBtnStatus];
}
- (IBAction)redoLatestStep:(id)sender {
    
    [_drawingView redoLatestStep];
    [self updateBtnStatus];
}

-(void)drawingView:(ACEDrawingView *)view didEndDrawUsingTool:(id<ACEDrawingTool>)tool{
    [self updateBtnStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
