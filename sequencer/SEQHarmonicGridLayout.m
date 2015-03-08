//
//  SEQHarmonicGridLayout.m
//  sequencer
//
//  Created by Corné on 07/03/15.
//  Copyright (c) 2015 Corné. All rights reserved.
//

#define space 5

#import "SEQHarmonicGridLayout.h"

@implementation SEQHarmonicGridLayout {
    
    NSInteger cellWidth;
    NSInteger cellHeight;
}

-(id)init {
    
    if (self = [super init]) {
        
        cellWidth = [UIScreen mainScreen].bounds.size.width/5 - space;
        cellHeight = [UIScreen mainScreen].bounds.size.height/3 - space;
    }
    
    return self;
}

-(CGSize)collectionViewContentSize {
    
    NSInteger xSize = [self.collectionView numberOfItemsInSection:0] * (cellWidth + space);
    NSInteger ySize = [self.collectionView numberOfSections] * (cellHeight + space);
    
    return CGSizeMake(xSize, ySize);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path {
    
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    attributes.size = CGSizeMake(cellWidth,cellHeight);
    int xValue = cellWidth/2 + path.row * (cellWidth + space);
    int yValue = cellHeight + path.section * (cellHeight + space);
    attributes.center = CGPointMake(xValue, yValue);
    
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSInteger minRow = (rect.origin.x > 0)?  rect.origin.x/(cellWidth + space) : 0;
    NSInteger maxRow = rect.size.width/(cellWidth + space) + minRow;
    NSMutableArray* attributes = [NSMutableArray array];
    
    for(NSInteger i=0 ; i < self.collectionView.numberOfSections; i++) {
        
        for (NSInteger j=minRow ; j < maxRow; j++) {
            
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    
    return attributes;
}

@end
