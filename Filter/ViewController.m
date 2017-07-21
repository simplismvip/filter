//
//  ViewController.m
//  Filter
//
//  Created by JM Zhao on 2017/6/21.
//  Copyright © 2017年 奕甲智能 Oneplus Smartware. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>
#import "UIImage+Filters.h"
#import "JMFilterContent.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *origin;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.origin = self.imageView.image;
    [self logAllFilters];
}

- (void)logAllFilters {
    
    NSArray *filterNames = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    
    for (NSString *filterName in filterNames) {
        CIFilter *filter = [CIFilter filterWithName:filterName];
        NSLog(@"%@", [filter attributes]);
    }
}

- (IBAction)filter1:(id)sender {

    self.imageView.image = self.origin;
}

- (IBAction)filter2:(id)sender {

    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    UIImage *new = [ima gaussianBlur:5];
    self.imageView.image = new;

}

- (IBAction)filter3:(id)sender {

}

- (IBAction)filter4:(id)sender {
 
}

// max 3.14 -3.14
- (IBAction)filter5:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    NSLog(@"%@", NSStringFromCGSize(ima.size));
    
    UIImage *new = [ima hueAdjust:0.3];
    NSLog(@"new = %@", NSStringFromCGSize(new.size));
    
    self.imageView.image = new;
    
}

- (IBAction)filter6:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    NSLog(@"%@", NSStringFromCGSize(ima.size));
    
    UIImage *new = [ima temperatureAndTint:3000 inputTargetNeutral:100];
    NSLog(@"new = %@", NSStringFromCGSize(new.size));
    
    self.imageView.image = new;
}

- (IBAction)filter7:(id)sender {

}

- (IBAction)filter8:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    UIImage *new = [ima whitePointAdjust:[CIColor colorWithRed:255.0/255.0 green:247.0/255.0 blue:196.0/255.0]];
    self.imageView.image = new;
}

- (IBAction)filter9:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    const CGFloat reds[] = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    CIVector *red = [CIVector vectorWithValues:reds count:10];
    
    const CGFloat greens[] = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    CIVector *green = [CIVector vectorWithValues:greens count:10];
    
    const CGFloat blues[] = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    CIVector *blue = [CIVector vectorWithValues:blues count:10];
    
    UIImage *new = [ima colorCrossPolynomial:red greenCoefficients:green blueCoefficients:blue];
    self.imageView.image = new;

}

- (IBAction)filter10:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    UIImage *new = [ima colorCubeinput:2.0];
    self.imageView.image = new;

}

- (IBAction)filter11:(id)sender {
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    UIImage *new = [ima sepiaTones:1];
    self.imageView.image = new;
}

- (IBAction)filter12:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    UIImage *imaNew = [UIImage imageNamed:@"001"];
    UIImage *new = [ima colorMap:imaNew];
    self.imageView.image = new;
}

- (IBAction)filter13:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    UIImage *new = [ima falseColor:[CIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0] color2:[CIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0]];
    self.imageView.image = new;
}

- (IBAction)filter14:(id)sender {
    

}

- (IBAction)filter15:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    NSLog(@"%@", NSStringFromCGSize(ima.size));
    
    UIImage *new = [ima bloom:30 inputIntensity:0.5];
    NSLog(@"new = %@", NSStringFromCGSize(new.size));
    
    self.imageView.image = new;
}

- (IBAction)filter16:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    NSLog(@"%@", NSStringFromCGSize(ima.size));
    
    UIImage *new = [ima edges:1.5];
    NSLog(@"new = %@", NSStringFromCGSize(new.size));
    
    self.imageView.image = new;

}

- (IBAction)filter17:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    
    // max 1, min 0; -1 -- 1
    UIImage *new = [ima highlightShadowAdjust:.5 shadowAmount:-.7];
    self.imageView.image = new;

}

- (IBAction)filter18:(id)sender {
    
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    UIImage *new = [ima lineOverlay:0.1 sharpness:0.9 intensity:1.0 threshold:0.2 ontrast:10.0];
    self.imageView.image = new;}

- (IBAction)valueChange2:(UISlider *)sender {
    
    // CIHueAdjust 改变源像素的整体色调或色调
    UIImage *ima = [UIImage imageNamed:@"IMG_1709"];
    CIImage *ci = [CIImage imageWithData:UIImageJPEGRepresentation(ima, 0.5)];
    CIFilter *filte = [CIFilter filterWithName:@"CIHueAdjust"];
    [filte setValue:ci forKey:kCIInputImageKey];
    
    NSNumber *number = [NSNumber numberWithFloat:sender.value];
    [filte setValue:number forKey:kCIAttributeTypeAngle]; // 0.00
    UIImage *new = [UIImage imageWithCIImage:filte.outputImage];
    self.imageView.image = new;
    
}

- (IBAction)valueChange3:(UISlider *)sender {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
