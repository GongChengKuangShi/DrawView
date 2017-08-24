//
//  DrawView.h
//  ViewTransparent
//
//  Created by xiangronghua on 2017/8/24.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DrawViewTypeOne,
    DrawViewTypeTwo,
    DrawViewTypeThree,
}DrawViewType;

@interface DrawView : UIView

@property (nonatomic, assign) DrawViewType type;

@end
