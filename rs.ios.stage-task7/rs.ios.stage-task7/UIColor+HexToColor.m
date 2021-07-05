//
//  UIColor+HexToColor.m
//  rs.ios.stage-task7
//
//  Created by Sergey Gomolko on 7/3/21.
//

#import "UIColor+HexToColor.h"

@implementation UIColor (HexToColor)
+(UIColor *)colorWithHex:(UInt32) hex alpha:(float)alpha{
  int r = (hex >> 16) & 0xFF;
  int g = (hex >> 8) & 0xFF;
  int b = (hex) & 0xFF;
  
  return [UIColor colorWithRed:r / 255.0f
                         green:g / 255.0f
                          blue:b / 255.0f
                         alpha: alpha];
}
@end
