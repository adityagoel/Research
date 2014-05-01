//
//  AppViewController.m
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import "AppViewController.h"
#import "ModelJSON.h"
#import "PickerModel.h"

@interface AppViewController ()

@end

@implementation AppViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger rowCount = 0;
    switch (component) {
        case 0:
            rowCount = 2;
            break;
        case 1:
            rowCount = 7;
        default:
            break;
            
    }
    return rowCount;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString* title;
    
    switch (component) {
        case 0:
            if (row == 1)
                title = @"XML";
            else
                title = @"JSON";
            break;
            
        case 1:
            switch (row) {
                case 0:
                    title = @"100";
                    break;
                case 1:
                    title = @"150";
                    break;
                case 2:
                    title = @"200";
                    break;
                case 3:
                    title = @"250";
                    break;
                case 4:
                    title = @"300";
                    break;
                case 5:
                    title = @"350";
                    break;
                case 6:
                    title = @"400";
                    break;
                default:
                    break;
            }
            
            
        default:
            break;
    }
    
    return title;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Outlets

- (IBAction)btnDesrialize:(id)sender {
    
    
    int count = [PickerModel numberOfObjects:[_picker selectedRowInComponent:1]];
    
    
    switch ([_picker selectedRowInComponent:0]) {
        case 0:
            _objJSON = [[ModelJSON alloc]init];
            [_objJSON fetchJSONDataOfCount:count];
            [_objJSON DeserializeJSONWithData];
            break;
          case 1:
            _objXML = [[ModelXML alloc]init];
            [_objXML fetchXMLDataOfCount:count];
            [_objXML DeserializeJXMLWithData];
        default:
            break;
    }
    
    
    
    
    
}
- (IBAction)btnSerialize:(id)sender {
    
    
    int count = [PickerModel numberOfObjects:[_picker selectedRowInComponent:1]];
    NSMutableArray* arrayItems;
    NSMutableSet* setItems;
    switch ([_picker selectedRowInComponent:0]) {
        case 0:
            arrayItems = [_objJSON getNumberOfObjects:count];
            [_objJSON SerializeJSONOfCount:arrayItems];
            break;
        case 1:
            setItems = [_objXML getNumberOfObjects:count];
            [_objXML SerializeXMLWithSet:setItems];
            //[_objXML ConvertDictionarytoXML:dicItems withStartElement:@"feed"];
        default:
            break;
    }
    
    
}
@end
