#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

%hook Beans
- (void)setHidden:(BOOL)arg1 {
   if (arg1 == true) {
      return %orig(true);
   }
   UIButton *b = NULL;
   UIView *t0 = self;
   if([t0.subviews count] > 0){
      UIView *t1 = t0.subviews[0];
      if([t1.subviews count] > 1){
         UIView *t2 = t1.subviews[1];
         if([t2.subviews count] > 3){
            b = t2.subviews[3];
         }
      }
   }
   if (b != NULL && b.enabled == true){
      b.enabled = false;
      UIView *thing = t0.superview;
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      [button setTitle:@"Post Late BeReal." forState:UIControlStateNormal];
      button.frame = CGRectMake(214, 558, 160, 30);
      [thing addSubview:button];
      for (id target in b.allTargets) {
         NSArray *actions = [b actionsForTarget:target forControlEvent:UIControlEventTouchUpInside];
         for (NSString *action in actions) {
            [button addTarget:target action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
         }
      }
   }
   if (b != NULL && b.enabled == false) {
      return %orig(true);
   }
   return %orig(arg1);
}
%end

%hook UIButton
- (void)setHidden:(BOOL)arg1 {
   if(self.frame.size.height == 54){
      return %orig(false);
   }else{
      return %orig(arg1);
   }
}
- (void)setUserInteractionEnabled:(BOOL)arg1 {
   if (self.frame.size.height == 32) {
      return %orig(true);
   }
   return %orig(arg1);
}
%end

%ctor {
	%init(Beans = objc_getClass("BeReal.FeedPostCellBlurView"));

}
