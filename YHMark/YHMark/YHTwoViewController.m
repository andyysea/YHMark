
//
//  YHTwoViewController.m
//  YHMark
//
//  Created by junde on 2017/3/1.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHTwoViewController.h"
#import "YHTwoViewModel.h"
#import "UIColor+hexValue.h"

#define Height_Window  [UIScreen mainScreen].bounds.size.height
#define Width_Window  [UIScreen mainScreen].bounds.size.width

static NSString *cellId = @"cellId";

@interface YHTwoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

/** 集合视图 */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 模型数组 */
@property (nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation YHTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    [self setupUI];
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"--> %@",@(indexPath.item).description);
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   
    return self.modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    YHTwoViewModel *model = self.modelArray[indexPath.row];
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%@",model.title];
    label.frame = CGRectMake(0, 0, ([self widthForLabel:label.text fontSize:16] + 10), 22);
    label.font = [UIFont systemFontOfSize:16];
    label.layer.cornerRadius = 2.0;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 1.0;
    label.layer.borderColor = [UIColor colorWithHexString:model.color].CGColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithHexString:model.color];
    [cell.contentView addSubview:label];
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YHTwoViewModel *model = self.modelArray[indexPath.row];
    CGFloat width = [self widthForLabel:[NSString stringWithFormat:@"%@",model.title] fontSize:16];
    return CGSizeMake(width+10,22);
}

/**
 *  计算文字长度
 */
- (CGFloat)widthForLabel:(NSString *)text fontSize:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil]];
    return size.width;
}



#pragma mark - 加载数据
- (void)loadData {
    
    _modelArray = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"listData.plist" ofType:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dict in dataArray) {
        YHTwoViewModel *model = [[YHTwoViewModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [self.modelArray addObject:model];
    }
    
}

#pragma mark - 设置界面元素
- (void)setupUI {
    self.title = @"UICollectionView 标签";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO; // 取消导航栏的缩进
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 100, Width_Window - 30, Height_Window - 150) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
}

@end
