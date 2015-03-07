//
//  SEQInternalInstrument.m
//  sequencer
//
//  Created by Corné on 07/03/15.
//  Copyright (c) 2015 Corné. All rights reserved.
//

#import "SEQInternalInstrument.h"

@implementation SEQInternalInstrument

-(instancetype)init {
    
    self = [super init];
    if (self ) {
        
        AKFMOscillator *fmOscillator;
        fmOscillator = [[AKFMOscillator alloc] init];
        [self connect:fmOscillator];
        
        AKAudioOutput *audioOutput = [[AKAudioOutput alloc] initWithAudioSource:fmOscillator];
        [self connect:audioOutput];
    }
    
    return self;
}

@end
