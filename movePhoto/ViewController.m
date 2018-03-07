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
        if([coordinate isEqualToString:@"x"])
        {
            if([direction isEqualToString:@"+"])
            {
                CGRect tempRect = self.image.frame;
                tempRect.origin.x+=[value integerValue];
                self.image.frame =  tempRect;
            }
            else if ([direction isEqualToString:@"-"])
            {
                CGRect tempRect = self.image.frame;
                tempRect.origin.x-=[value intValue];
                self.image.frame =  tempRect;
            }
            
        }
        if([coordinate isEqualToString:@"y"])
        {
            if([direction isEqualToString:@"+"])
            {
                CGRect tempRect = self.image.frame;
                tempRect.origin.y+=[value integerValue];
                self.image.frame =  tempRect;
            }
            else if ([direction isEqualToString:@"-"])
            {
                CGRect tempRect = self.image.frame;
                tempRect.origin.y-=[value intValue];
                self.image.frame =  tempRect;
            }
            
        }
        
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
        CGRect tempRect = self.image.frame;
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
        self.image.frame =  tempRect;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
