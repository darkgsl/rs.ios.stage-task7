//
//  UIColor+HexToColor.h
//  rs.ios.stage-task7
//
//  Created by Sergey Gomolko on 7/3/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HexToColor)
+(UIColor *)colorWithHex:(UInt32) hex alpha:(float)alpha;
@end

NS_ASSUME_NONNULL_END
