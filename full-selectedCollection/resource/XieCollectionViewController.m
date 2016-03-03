//
//  XieCollectionViewController.m
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/2/29.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "XieCollectionViewController.h"
#import "XieBottomView.h"
#import "XieCollectionViewCell.h"


#define ScreenWidth         [UIScreen mainScreen].bounds.size.width
#define ScreenHeight        [UIScreen mainScreen].bounds.size.height


@interface XieCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) UICollectionView *collectionView;             // 主体 collectionView  视图

@property (nonatomic, strong) NSMutableArray *cellDataArray;

@property (nonatomic, assign) BOOL isEditingMode;                           // 是否处于编辑模式

@property (nonatomic, strong) XieBottomView *bottomView;                    // 编辑模式下底部操作视图

@property (nonatomic, strong) UIView *noDataView;                           // 没有数据时的展示图

@property (nonatomic, strong) UIBarButtonItem *rightEditItem;               // 右上角编辑按钮


@end

@implementation XieCollectionViewController

static NSString *managerCellIdentifier = @"cookbookManagerViewCell";


-(UIBarButtonItem *)rightEditItem
{
    if (!_rightEditItem) {
        
        UIButton *rightEditButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightEditButton.frame = CGRectMake(0, 0, 20, 20);
        [rightEditButton setImage:[UIImage imageNamed:@"ic_p3_edit"] forState:UIControlStateNormal];
        [rightEditButton setImage:[UIImage imageNamed:@"ic_p3_close"] forState:UIControlStateSelected];
        [rightEditButton addTarget:self action:@selector(enterEditModeBtn:) forControlEvents:UIControlEventTouchUpInside];
        rightEditButton.showsTouchWhenHighlighted = YES;
        _rightEditItem = [[UIBarButtonItem alloc] initWithCustomView:rightEditButton];
    }
    return _rightEditItem;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initProperty];
    
    // 加载UI界面
    [self initUI];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


#pragma mark - UI
- (void)initUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isEditingMode = NO;
    
    [self customNavigationUI];
    
    // collection View
    [self loadCollectionView];
    
    [self loadEditingBottomView];
    
    [self loadNoDataView];
    
}

- (void)customNavigationUI {
    
    self.navigationItem.title = @"集合视图多选";
    
    if (self.cellDataArray.count != 0) {
        
        self.navigationItem.rightBarButtonItem = self.rightEditItem;
    }
    
}

- (void)loadCollectionView
{
    // collectionView
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake((self.view.bounds.size.width-20)/3, (self.view.bounds.size.width-20)/3 + 50);
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:self.collectionView];
    
    
    [self.collectionView registerClass:[XieCollectionViewCell class] forCellWithReuseIdentifier:managerCellIdentifier];
}



- (void)loadEditingBottomView
{
    _bottomView = [[XieBottomView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 60) withLeftName:@"删除" leftImage:[UIImage imageNamed:@"ic_p3_delete_deselected"] rightName:@"保存" rightImage:[UIImage imageNamed:@"ic_p3_save_deselected"]];
    
    [_bottomView.leftTap addTarget:self action:@selector(deleteCookbook)];
    
    [_bottomView.rightTap addTarget:self action:@selector(saveCookbook)];
    
    _bottomView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_bottomView];
}

- (void)loadNoDataView
{
    self.noDataView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.noDataView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label  = [[UILabel alloc] init];
    label.frame = CGRectMake(self.view.bounds.size.width/2-100, 200, 200, 30);
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"没有数据";
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.noDataView addSubview:label];
    
    [self.view addSubview:self.noDataView];
    
    self.noDataView.hidden = YES;

}



- (void)initProperty
{
    NSMutableArray *contacts = [NSMutableArray array];
    
    NSString *strData = @"要死就一定死在你手里";
    
    for (NSInteger i = 0; i < 10; ++i) {
        
        NSString *str = [strData substringWithRange:NSMakeRange(i, 1)];
        
        NSDictionary *dict = @{@"data":str,
                               @"selected":@0};
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dict];
        
        [contacts addObject:dic];
    }
    
    self.cellDataArray = contacts;
}




#pragma mark - UICollectionViewDateSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:managerCellIdentifier forIndexPath:indexPath];
    
    [cell cellInfoWithDictionary:self.cellDataArray[indexPath.row] withEditingMode:self.isEditingMode];
    
    return cell;
    
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self clickCollectionCell:indexPath];
}






#pragma mark - Opreation
// 左上角返回
- (void)clickArrowBackBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}


// 右上角编辑模式
- (void)enterEditModeBtn:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    self.isEditingMode = sender.selected;
    
    [self enterEditingModeAnimate];
    
    //    [self.collectionView reloadData];
    [self refreshCellData];
}


// collection  cell  点击
- (void)clickCollectionCell:(NSIndexPath *)indexPath
{
    NSMutableDictionary *item = self.cellDataArray[indexPath.row];
    
    if (self.isEditingMode) {
        
        //编辑模式
        
        if ([item[@"selected"] intValue])
        {
            [item setObject:@(0) forKey:@"selected"];
        }
        else
        {
            [item setObject:@(1) forKey:@"selected"];
        }
        
    }
    else{
        
        //非编辑模式
        
        NSLog(@"点击cell 执行事件");
        
    }
    
    [self refreshCellData];
}


// 编辑模式下，删除操作
- (void)deleteCookbook
{
    NSLog(@"删除");
    
    int i = 0;
    
    NSMutableArray *deleteData = [NSMutableArray array];
    
    for (NSDictionary *dic in _cellDataArray) {
        
        if ([dic[@"selected"] intValue])
        {
            i++;
            
            [deleteData addObject:dic];
        }
    }
    
    if (i != 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确认删除选中项么？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            // 执行删除操作
            [_cellDataArray removeObjectsInArray:deleteData];
            
            [self refreshCellData];
            
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:cancelAction];
        
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

// 编辑模式下，保存操作
- (void)saveCookbook
{
    NSLog(@"保存");
    
    int i = 0;
    
    for (NSDictionary *dic in _cellDataArray) {
        
        if ([dic[@"selected"] intValue])
        {
            i++;
        }
    }
    
    if (i != 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确认删除选中项么？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            // 执行保存操作
            
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [alert addAction:cancelAction];
        
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
    
}

#pragma mark privite method


// 刷新cell数据
-(void)refreshCellData
{
    [self.collectionView reloadData];
    if (self.cellDataArray.count == 0) {
        self.noDataView.hidden = NO;
        self.navigationItem.rightBarButtonItem = nil;
    }
    else
    {
        self.noDataView.hidden = YES;
        self.navigationItem.rightBarButtonItem = self.rightEditItem;
    }
}



#pragma mark - 编辑模式动画
- (void)enterEditingModeAnimate
{
    if (_isEditingMode) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.bottomView.center = CGPointMake(self.view.center.x, ScreenHeight-30);
            
            self.collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-60);
            
        }];
        
    }
    else
    {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.bottomView.center = CGPointMake(self.view.center.x, ScreenHeight+30);
            
            self.collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            
        }];
        
    }
    
}



@end
