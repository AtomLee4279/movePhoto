//
//  ViewController.m
//  movePhoto
//
//  Created by 李一贤 on 2018/3/6.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//点击上下左右箭头触发事件
- (IBAction)clickButton:(UIButton*)sender
{
    switch (sender.tag) {
        case 0:
            NSLog(@"up");
            [self changeImagePosition:@"y" value:@"10" direction:@"-"];
            break;
        case 1:
            NSLog(@"left");
            [self changeImagePosition:@"x" value:@"10" direction:@"-"];
            break;
        case 2:
            NSLog(@"right");
            [self changeImagePosition:@"x" value:@"10" direction:@"+"];
            break;
        case 3:
            NSLog(@"down");
            [self changeImagePosition:@"y" value:@"10" direction:@"+"];
            break;
        case 4:
            NSLog(@"big");
            [self changeImageSize:@"10" type:@"+"];
            break;
        case 5:
            NSLog(@"small");
            [self changeImageSize:@"10" type:@"-"];
            break;
        default:
            break;
    }
        
    
}

//根据入参修改图片坐标位置
- (void)changeImagePosition:(NSString*)coordinate value:(NSString*)value direction:(NSString*)direction
{
    if(([coordinate isEqualToString:@"x"]||[coordinate isEqualToString:@"y"])&&(value)&&([direction isEqualToString:@"+"]||[direction isEqualToString:@"-"]))
    {
        
        CGRect tempRect = self.image.frame;//frame是控件所在的矩形框相对于父控件而言的相对位置和大小；以父控件左上角做为坐标原点
        //改用center属性来修改后续图片的位置；center控制控件中心的位置，以父控件左上角为坐标原点
        CGPoint tempPoint = self.image.center;
        //开启动画
        [UIView beginAnimations:nil context:nil];
        //设置动画时长
        [UIView setAnimationDuration:0.5];
        if([coordinate isEqualToString:@"x"])
        {
            if([direction isEqualToString:@"+"])
            {
                //tempRect.origin.x+=[value integerValue];//改用了center属性修改位置后，center并没有orgin成员变量，需要注释掉
                tempPoint.x +=[value integerValue];//用center成员属性修改图片位置
            }
            else if ([direction isEqualToString:@"-"])
            {
                //tempRect.origin.x-=[value intValue];//改用了center属性修改位置后，center并没有orgin成员变量，需要注释掉
               tempPoint.x -=[value integerValue];//用center成员属性修改图片位置
            }
            
        }
        if([coordinate isEqualToString:@"y"])
        {
            //注意“+”是向下移动，y轴坐标向下加大
            if([direction isEqualToString:@"+"])
            {
                //tempRect.origin.y+=[value integerValue];//改用了center属性修改位置后，center并没有orgin成员变量，需要注释掉
                tempPoint.y +=[value integerValue];//用center成员属性修改图片位置
            }
            else if ([direction isEqualToString:@"-"])
            {
                //tempRect.origin.y-=[value intValue];//改用了center属性修改位置后，center并没有orgin成员变量，需要注释掉
                tempPoint.y -=[value integerValue];//用center成员属性修改图片位置
            }
            
        }
        //self.image.frame =  tempRect;
        self.image.center = tempPoint;
        //提交动画
        [UIView commitAnimations];
    }
    else
    {
        NSLog(@"error");
    }
    
}

//根据入参修改图片尺寸
-(void)changeImageSize:(NSString*)value type:(NSString *)type
{
    if(value&&type)
    {
        //CGRect tempRect = self.image.frame;
        //改用bounds属性来修改后续的图片尺寸；bouns一般控制控件所在的矩形框的位置和大小；并不相对于父控件而言。如此可确保放大/缩小后控件中心点不变
        CGRect tempRect = self.image.bounds;
        if([type isEqualToString:@"+"])
        {
            
            tempRect.size.width = tempRect.size.width+[value integerValue];
            tempRect.size.height = tempRect.size.height+[value integerValue];
        }
        else if ([type isEqualToString:@"-"])
        {
           
            tempRect.size.width = tempRect.size.width-[value integerValue];
            tempRect.size.height = tempRect.size.height-[value integerValue];
        }
        //self.image.frame =  tempRect;//改用bounds修改图片尺寸后，需注释掉
        self.image.bounds = tempRect;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
