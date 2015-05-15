//
//  ViewController.m
//  AttributeLabel
//
//  Created by dongshangxian on 15/5/14.
//  Copyright (c) 2015年 Sankuai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *onlyLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *attStr = @"好吃到总也吃不够的样子。觉得开了好多分店以后，排队等位的时间也变短了，一会儿就能排上了。不过就是不知道夏天去吃会不会很热。依旧推荐九格锅底，麻辣牛肉，贡<span style=\"font-color:orange;\"\">菜也不错</span>，还有竹荪，下次想尝尝猪蹄～其实广味香肠也不错，还有菜花。\n豆奶也是我的最爱哦～";
    
    
    
    // 1> 生成文本附件
    NSTextAttachment *textAttach = [[NSTextAttachment alloc] init];
    
    // 2> 使用文本附件创建属性文本
    NSAttributedString *strA = [[NSAttributedString alloc]initWithString:attStr];
    
    self.onlyLabel.attributedText = strA;
    
    
    UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 400, 320, 30)];
    
//    testLabel.backgroundColor = [UIColor lightGrayColor];
    
    testLabel.textAlignment = NSTextAlignmentCenter;
    
    
    NSMutableString *mstr = [NSMutableString string];
    
    NSString* str = @"今天天<气不>错呀";
    
    [mstr appendString:str];
    
    NSRange range1 = [str rangeOfString:@"<"];
    NSRange range2 = [str rangeOfString:@">"];
    
    [mstr replaceOccurrencesOfString:@"<" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mstr.length)];
    [mstr replaceOccurrencesOfString:@">" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, mstr.length)];
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:mstr];
    
    NSUInteger location = range1.location;
    NSUInteger length = range2.location - range1.location-1;
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:[UIColor orangeColor]
     
                          range:NSMakeRange(location, length)];
    
    testLabel.attributedText = AttributedStr;
    
    [self.view addSubview:testLabel];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
