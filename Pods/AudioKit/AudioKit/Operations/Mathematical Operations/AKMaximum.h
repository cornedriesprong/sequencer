//
//  AKMaximum.h
//  AudioKit
//
//  Created by Aurelius Prochazka on 12/22/12.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "AKMultipleInputMathOperation.h"

/** Produces a signal that is the maximum of any number of input signals.
 
 Takes any number of audio signals and outputs an audio signal that is the maximum of all of the inputs.
 */

@interface AKMaximum : AKMultipleInputMathOperation


@end