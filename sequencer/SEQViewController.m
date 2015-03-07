//
//  ViewController.m
//  sequencer
//
//  Created by Corné on 07/03/15.
//  Copyright (c) 2015 Corné. All rights reserved.
//

#import "SEQViewController.h"
#import "AKFoundation.h"
#import "SEQInternalInstrument.h"
#import <AVFoundation/AVAudioPlayer.h>

@implementation SEQViewController
{
    SEQInternalInstrument *internalInstrument;
    BOOL isInternalInstrumentPlaying;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    internalInstrument = [[SEQInternalInstrument alloc] init];
    [AKOrchestra addInstrument:internalInstrument];
    
    [AKOrchestra start];
}

- (IBAction)toggleInstrument:(id)sender {
    
    if(isInternalInstrumentPlaying) {
        
        [internalInstrument stop];
        isInternalInstrumentPlaying = NO;
        
    } else {
        
        [internalInstrument play];
        isInternalInstrumentPlaying = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
