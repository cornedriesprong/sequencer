//
//  SEQHarmonicGridViewController.m
//  sequencer
//
//  Created by Corné on 07/03/15.
//  Copyright (c) 2015 Corné. All rights reserved.
//

#import "SEQHarmonicGridCollectionView.h"

@implementation SEQHarmonicGridCollectionView

- (void)awakeFromNib {
    
}

#pragma mark - Layout

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGPoint currentOffset = self.contentOffset;
    CGFloat contentWidth = self.contentSize.width;
    CGFloat contentHeight = self.contentSize.height;
    CGFloat centerOffsetX = (contentWidth - self.bounds.size.width)/ 2.0;
    CGFloat centerOffsetY = (contentHeight - self.bounds.size.height)/ 2.0;
    CGFloat distanceFromCenterX = fabs(currentOffset.x - centerOffsetX);
    CGFloat distanceFromCenterY = fabs(currentOffset.y - centerOffsetY);
    
    if (distanceFromCenterX > (contentWidth / 4)) {
        
        self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
    }
    
    if (distanceFromCenterY > (contentHeight / 3)) {
        
        self.contentOffset = CGPointMake(currentOffset.x, centerOffsetY);
    }
}

@end
