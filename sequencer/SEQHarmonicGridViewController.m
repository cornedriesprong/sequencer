//
//  ViewController.m
//  sequencer
//
//  Created by Corné on 07/03/15.
//  Copyright (c) 2015 Corné. All rights reserved.
//

#import "AKFoundation.h"
#import "SEQHarmonicGridViewController.h"
#import "SEQHarmonicGridCollectionView.h"
#import "SEQHarmonicGridCell.h"
#import "SEQHarmonicGridLayout.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface SEQHarmonicGridViewController ()

@property (weak, nonatomic) IBOutlet SEQHarmonicGridCollectionView *collectionView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSArray *colors;

@end

@implementation SEQHarmonicGridViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.items = @[@"F", @"C", @"G", @"D", @"A", @"E", @"B", @"F#", @"C#", @"G#", @"D#", @"A#"];
    self.colors = @[UIColor.redColor, UIColor.greenColor, UIColor.blueColor, UIColor.cyanColor, UIColor.yellowColor, UIColor.magentaColor, UIColor.orangeColor, UIColor.purpleColor, UIColor.brownColor, UIColor.whiteColor, UIColor.grayColor, UIColor.lightGrayColor];
    
    SEQHarmonicGridLayout *layout = [[SEQHarmonicGridLayout alloc] init];
    
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.showsHorizontalScrollIndicator = YES;
    self.collectionView.showsVerticalScrollIndicator = YES;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.view.backgroundColor = [UIColor blackColor];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SEQHarmonicGridCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([SEQHarmonicGridCell class])];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    
    // rows
    return 9;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    // columns
    return 48;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SEQHarmonicGridCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SEQHarmonicGridCell class]) forIndexPath:indexPath];
    
    cell.label.text = self.items[(indexPath.row + (indexPath.section * 4)) % 12];
    cell.backgroundColor = self.colors[(indexPath.row + (indexPath.section * 4)) % 12];
    cell.alpha = 0.75;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end
