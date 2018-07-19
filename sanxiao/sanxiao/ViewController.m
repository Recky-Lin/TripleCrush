//
//  ViewController.m
//  sanxiao
//
//  Created by ReckyLin on 2018/7/18.
//  Copyright © 2018年 ReckyLam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSInteger itemsPerRow;            //每行个数
@property (nonatomic) NSInteger itemsPerColumn;         //每列个数

@property (nonatomic) CGFloat itemWidth;                //方块宽
@property (nonatomic) CGFloat itemHeight;               //方块高
@property (nonatomic) CGFloat itemSeparatorWidth;       //间隔宽度

@property (nonatomic) CGFloat blank;                    //视图左右边距

@property (nonatomic, strong) NSMutableArray *blockArray;                    //视图左右边距

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _itemsPerRow = 8;
        _itemsPerColumn = 8;
        _itemSeparatorWidth = 5;
        
        _blank = 20;
        
        _itemWidth = (kScreenWidth - 2 * _blank - (_itemSeparatorWidth * (_itemsPerRow - 1))) / _itemsPerRow;
        _itemHeight = _itemWidth;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blockArray = [NSMutableArray array];
    
    //逐行扫描填充
    
    for (int i = 0; i < self.itemsPerRow; i ++) {
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (int j = 0; j < self.itemsPerColumn; j ++) {
            SXBlockView *block = [self generateBlock];
            [block setFrame:CGRectMake(_blank + j * (_itemWidth + _itemSeparatorWidth), _blank + i * (_itemWidth + _itemSeparatorWidth), _itemWidth, _itemHeight)];
            [self.view addSubview:block];
            [tmpArray addObject:block];
        }
        [self.blockArray addObject:tmpArray];
    }
    
    [self checkBlocksNeedCrush];
}

- (SXBlockView *)generateBlock
{
    SXBlockView *view = [SXBlockView new];
    SXBlockModel *config = [[SXBlockModel alloc] init];
    [view setBlockConfig:config];
    
    NSArray *colorArray = @[[UIColor redColor],
                            [UIColor blueColor],
                            [UIColor yellowColor],
                            [UIColor greenColor]];
    [config setBlockColor:colorArray[(arc4random() % 4)]];
    [config setBlockType:SXBlockModelTypeNormal];

    return view;
}

- (void)checkBlocksNeedCrush
{
    UIColor *currentColor;
    
    NSInteger markCount = 0;
    for (int i = 0; i < self.itemsPerRow; i ++) {
        markCount = 0;
        currentColor = nil;
        for (int j = 0; j < self.itemsPerColumn; j ++) {
            SXBlockView *block = self.blockArray[i][j];
            NSLog(@"%@", block.blockConfig.blockColor);
            if ([block.blockConfig.blockColor isEqual:currentColor]) {
                markCount++;
//                currentColor = block.blockConfig.blockColor;
                if (markCount >= 3) {
                    NSLog(@"查询到横向三连，当前方块坐标，%d, %d", i, j);
                }
            }
            else {
                markCount = 0;
                currentColor = block.blockConfig.blockColor;
            }
        }
    }
}


@end
