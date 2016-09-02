//
//  WKGuideController.m
//  悟空
//
//  Created by 宋钢强 on 16/8/9.
//  Copyright © 2016年 alibaba. All rights reserved.
//


#import "WKGuideController.h"
#import "WKGuideCell.h"
#import "UIView+HMExt.h"


@interface WKGuideController ()

/**
 装着四张背景图片的数组
 */
@property (nonatomic, strong) NSArray *imgsArr;

/**
 *  广告
 */
@property (nonatomic, weak) UIImageView *adImgView;
/**
 * 大文字
 */
@property (nonatomic, weak) UIImageView *bigImgView;
/**
 *  小文字
 */
@property (nonatomic, weak) UIImageView *smallImgView;



@end

@implementation WKGuideController

- (instancetype)init {
    
    // 流水布局
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置大小
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    // 设置方向 水平滚动
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置间距
    flow.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flow];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];;
    
    // 设置分页
    self.collectionView.pagingEnabled = YES;
    // 去掉底部的线
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    // 取消弹簧效果
    self.collectionView.bounces = NO;
    
    
    [self.collectionView registerClass:[WKGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}


#pragma mark - 减速完成的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 1.取出内容在x轴的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    
    // 2.确定滑动的方向
    if (self.adImgView.x > offsetX) {
        self.adImgView.x = self.adImgView.x - 2 * scrollView.width;
        
    } else {
        self.adImgView.x = self.adImgView.x + 2 * scrollView.width;
        
    }
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imgsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WKGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 设置背景图片
    cell.backgroundView = [[UIImageView alloc] initWithImage:self.imgsArr[indexPath.item]];
    
    // 如果是最后一个cell,将按钮显示出来
    if (indexPath.item == (self.imgsArr.count - 1)) {
        cell.exButton.hidden = NO;
    } else {
        cell.exButton.hidden = YES;
    }
    
    return cell;
}

#pragma mark - 懒加载
- (NSArray *)imgsArr {
    
    if (!_imgsArr) {
        _imgsArr = @[
                     [UIImage imageNamed:@"商家1"],
                     [UIImage imageNamed:@"商家2"],
                     [UIImage imageNamed:@"商家3"],
                     ];
    }
    
    return _imgsArr;
}


@end
