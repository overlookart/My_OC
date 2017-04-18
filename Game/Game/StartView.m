//
//  StartView.m
//  Game
//
//  Created by ledu on 17/4/6.
//  Copyright © 2017年 xzh. All rights reserved.
//

#import "StartView.h"
#import "RoleInfo.h"
#import "HeroScene.h"
#import "MainScence.h"
#import "SelectLevel.h"
#import "RoleMode.h"
#import <SpriteKit/SpriteKit.h>
@interface StartView()<UITextFieldDelegate>
{
    HeroScene *heroScene;
    SelectLevel *selectLevelScence;
    RoleMode *currentRole;
}
@property (nonatomic,strong) UIImageView *bgImgView;
@property (nonatomic,strong) UIImageView *createRoleImgVIew;
@property (nonatomic,strong) UITextField *roleNameTF;
@property (nonatomic,strong) UIButton *startBtn;
@property (nonatomic,strong) RoleInfo *roleInfo;



@end

@implementation StartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createBackgroundImgView];
        [self createRoleView];
        [self initRoleInfoView];
        [self initActionView];
        [self addKeyBoardAction];
        [self createScene];
    }
    return self;
}

///创建背景视图
-(void)createBackgroundImgView{
    self.bgImgView = [[UIImageView alloc]initWithFrame:self.frame];
    self.bgImgView.image = [UIImage imageNamed:@"start_bg"];
    [self addSubview:self.bgImgView];
    self.bgImgView.userInteractionEnabled = YES;
}

///创建角色的视图
-(void)createRoleView{
    self.createRoleImgVIew = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/5.0*3, self.bounds.size.width, 150)];
    self.createRoleImgVIew.image = [UIImage imageNamed:@"create_role"];
    [self.bgImgView addSubview:self.createRoleImgVIew];
    self.roleNameTF = [[UITextField alloc]initWithFrame:CGRectMake(self.bounds.size.width / 6.0*2, 20, self.bounds.size.width / 3.0, 30)];
    self.roleNameTF.borderStyle = UITextBorderStyleRoundedRect;
    self.roleNameTF.delegate = self;
    [self.createRoleImgVIew addSubview:self.roleNameTF];
//    self.roleNameTF.userInteractionEnabled = YES;
    self.createRoleImgVIew.userInteractionEnabled = YES;
    self.startBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width / 4.0, 90, self.bounds.size.width / 2.0, 40)];
    [self.startBtn setImage:[UIImage imageNamed:@"start_btn"] forState:(UIControlStateNormal)];
    [self.createRoleImgVIew addSubview:self.startBtn];
    [self.startBtn addTarget:self action:(@selector(startGame)) forControlEvents:(UIControlEventTouchUpInside)];
}

///进入选关的场景
-(void)startGame{
    self.bgImgView.hidden = YES;
    self.roleInfo.hidden = YES;
    currentRole = [[RoleMode alloc]initWithName:self.roleNameTF.text];
    selectLevelScence = [[SelectLevel alloc]initWithRole:currentRole szie:[UIScreen mainScreen].bounds.size];
    [selectLevelScence upDataInfoWithRole:currentRole];
    [self presentScene:selectLevelScence];
}

-(void)initRoleInfoView{
    self.roleInfo = [[RoleInfo alloc]initWithFrame:self.frame];
    [self addSubview:self.roleInfo];
    self.roleInfo.hidden = YES;
}

-(void)initActionView{

}

-(void)createScene{
    heroScene = [[HeroScene alloc]initWithSize:[UIScreen mainScreen].bounds.size];
}

#pragma mark - ActionViewDelegate

-(void)showHeroInfo{
    
    if (self.scene != heroScene) {
        self.roleInfo.hidden = YES;
        [self presentScene:heroScene transition:[SKTransition pushWithDirection:SKTransitionDirectionLeft duration:0.1]];
    }
    
}

///添加键盘的弹出收回事件
-(void)addKeyBoardAction
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}
///弹出键盘
-(void)keyboardShow:(NSNotification *)notif
{
    NSLog(@"弹出键盘");
    CGRect rect = [[notif.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat y = rect.origin.y;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    
    CGFloat maxY = CGRectGetMaxY(self.frame);
    if (maxY > y - 2) {
        self.createRoleImgVIew.center = CGPointMake(self.center.x, self.center.y  - 40);
    }
    [UIView commitAnimations];
   
}
///收起键盘
-(void)keyboardHide:(NSNotification *)notif
{
    NSLog(@"收回键盘");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    
    self.createRoleImgVIew.center = CGPointMake(self.center.x, self.center.y  + 100);
    
    [UIView commitAnimations];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.roleNameTF resignFirstResponder];
    [selectLevelScence touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [selectLevelScence touchesMoved:touches withEvent:event];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.roleNameTF resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.name = textField.text;
}
@end
