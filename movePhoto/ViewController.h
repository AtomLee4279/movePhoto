//
//  ViewController.h
//  movePhoto
//
//  Created by 李一贤 on 2018/3/6.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,weak)IBOutlet UIButton* image;

- (IBAction)clickButton:(UIButton*)sender;

- (void)changeImagePosition:(NSString*)coordinate value:(NSString*)value direction:(NSString*)direction;

-(void)changeImageSize:(NSString*)value type:(NSString*)type;
@end

