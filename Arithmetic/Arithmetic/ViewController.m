//
//  ViewController.m
//  Arithmetic
//
//  Created by song on 2018/4/25.
//  Copyright © 2018年 YiJie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array1 = @[@12,@213,@3332,@1231,@12313,@123,@1313];
    NSArray *array2 = @[@78,@32,@345,@333,@988,@1111];
    
    NSMutableArray *newArray = [self bubbleSort:array1];
    NSLog(@"array ===> %@",newArray);
    NSMutableArray *newArray2 = [self fastSort:[NSMutableArray arrayWithArray:array1]];
    NSLog(@"array2 ===> %@",newArray2);
    NSMutableArray *newArray3 = [self insertSort:[NSMutableArray arrayWithArray:array1]];
    NSLog(@"array3===> %@",newArray3);
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSMutableArray *)bubbleSort:(NSArray *)arr{
    NSMutableArray *temp = [NSMutableArray new];
    temp = [NSMutableArray arrayWithArray:arr];
    for (int i = 0; i<arr.count; i++) {
        for (int j = 0 ; j <  arr.count-1-i; j++) {
            if (temp[j]>temp[j+1]) {
                [temp exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    return temp;
}

-(NSMutableArray *)fastSort:(NSMutableArray *)arr{
    NSMutableArray *temp1 = [NSMutableArray new];
    NSMutableArray *temp2 = [NSMutableArray new];
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 1; i<arr.count; i++) {
        if(arr[i]>arr[0]){
            [temp2 addObject:arr[i]];
            if (temp2.count>1) {
               temp2= [self fastSort:temp2];
            }
        }else{
            [temp1 addObject:arr[i]];
            if (temp1.count>1) {
                temp1= [self fastSort:temp2];
            }
        }
    }
    [temp addObjectsFromArray:temp1];
    [temp addObject:arr[0]];
    [temp addObjectsFromArray:temp2];
    return temp;
}

-(NSMutableArray *)insertSort:(NSArray *)array{
    NSMutableArray *tempArray = [NSMutableArray new];
    [tempArray addObject:array[0]];
    for (int i = 1 ; i < array.count; i++) {
        int a = [array[i] intValue];
        
        for (long j = tempArray.count-1; j>=0; j--) {
            if (a>[tempArray[j] intValue]) {
                [tempArray insertObject:[NSNumber numberWithInt:a] atIndex:j+1];
                break;
            }
        }
    }
    
    return tempArray;
}

//归并排序
//-(NSMutableArray *)mergeSortArr:(NSArray *)array arr2:(NSArray *)array2{

    
//    return tempArray;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
