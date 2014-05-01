//
//  AppViewController.h
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelJSON.h"
#import "ModelXML.h"
#import "PickerModel.h"
@interface AppViewController : UIViewController
<UIPickerViewDelegate,UIPickerViewDataSource>
@property ModelJSON* objJSON;
@property ModelXML* objXML;
- (IBAction)btnDesrialize:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)btnSerialize:(id)sender;


@end
