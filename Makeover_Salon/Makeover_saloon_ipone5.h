//
//  Makeover_saloon_ipone5.h
//  Makeover_Salon
//
//  Created by MAC 7 on 26/08/13.
//  Copyright (c) 2013 MAC 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBShapedButton.h"
#import <QuartzCore/QuartzCore.h>
#import <RevMobAds/RevMobAds.h>
#import "Chartboost.h"



@interface Makeover_saloon_ipone5 : UIViewController<UIScrollViewDelegate,UIGestureRecognizerDelegate,RevMobAdsDelegate,RevMobAdvertisement,ChartboostDelegate>
{
    UIScrollView *scrollViewDetail;
    UIButton *item1;
    BOOL isEarHoleIsReady;
    BOOL g;
    UIButton *eartrimmingTool;
    NSTimer *timer_spa;
//    RevMobBannerView *ad;
    RevMobAds *revmob;
    RevMobBannerView *revBannerView;
    Chartboost *cb;
    NSTimer *AdTimer1;
     NSTimer *AdTimer2;
    
    
  
   
    
   
  



    
//imageArrays for details display types
    NSArray *imgArray_lipstickColors;
    NSArray *imgArray_earings;
    NSArray *imgArray_hairTypes;
    NSArray *imgArray_eyelashTypes;
    NSArray *imgArray_faceColortypes;
    NSArray *imgArray_hairColortypes;
    NSArray *imgArray_eyeShadowtypes;
    NSArray *imgArray_eyeBrowtypes;
    
    UIImageView *earImgView;
    OBShapedButton *btnToColor;
    BOOL flag_eyeliquid_left;
    BOOL flag_inside_bootlePosition;
    
   
}
//starting makeOver_face_parts start

@property (strong, nonatomic) IBOutlet UIButton *neXt_selectday;
@property (strong, nonatomic) IBOutlet UIButton *neXt_selectGirl;
@property (strong, nonatomic) IBOutlet UIButton *btnDay_makeOver;
@property (strong, nonatomic) IBOutlet UIButton *btnDay_Spa;
@property (strong, nonatomic) IBOutlet UIButton *btnGirl1_makeOver;
@property (strong, nonatomic) IBOutlet UIButton *btnGirl2_makeOver;
@property (strong, nonatomic) IBOutlet UIButton *btnGirl3_makeOver;
@property (strong, nonatomic) IBOutlet UIButton *btnGirl4_makeOver;





@property(nonatomic,strong) NSTimer *AdTimer1;
@property(nonatomic,strong) NSTimer *AdTimer2;
@property (strong, nonatomic) IBOutlet OBShapedButton *btnToColor;
@property (strong, nonatomic) IBOutlet OBShapedButton *btn_currentlyDrawing;
@property (strong, nonatomic) IBOutlet OBShapedButton *btn_drawingCheek;
@property (strong, nonatomic) IBOutlet OBShapedButton *btn_erasingEyeBrow;
@property (strong, nonatomic) IBOutlet OBShapedButton *btn_erasinghairColor;





@property (strong, nonatomic) IBOutlet UIImageView *imgViewBackGround;

@property (strong, nonatomic) IBOutlet UIButton *makeOver_skin_inner;
@property (strong, nonatomic) IBOutlet UIButton *makeOver_back_common;
@property (strong, nonatomic) IBOutlet UIButton *makeOver_tool_draw;
@property (strong, nonatomic) IBOutlet UIButton *makeOver_eye_liquid_bottle;
@property (strong, nonatomic) IBOutlet UIButton *btneye_drop;
@property (strong, nonatomic) IBOutlet UIButton *btneye_drop2;
@property (strong, nonatomic) IBOutlet UIButton *btn_eyeImage;


@property (strong, nonatomic) IBOutlet UIImageView *intermediateView;
@property (strong, nonatomic) IBOutlet UIButton *btn_cheek_2Layer;
@property (strong, nonatomic) IBOutlet UIButton *btn_lip2Layer;
@property (strong, nonatomic) IBOutlet UIButton *btn_eyebrow2layer;
@property (strong, nonatomic) IBOutlet UIButton *btn_hairLayer_2;
//stopping makeOver_face_parts start


//starting modules start

@property (strong, nonatomic) IBOutlet UIButton *btnNext;
@property (strong, nonatomic) IBOutlet UIView *view_selectGirl_makeOver;
@property (strong, nonatomic) IBOutlet UIView *view_selectDay;
@property (strong, nonatomic) IBOutlet UIView *viewMakeOverroom;
@property (strong, nonatomic) IBOutlet UIView *view_shareMakeOverRoom;
@property (strong, nonatomic) IBOutlet UIImageView *imgView_final;







-(IBAction)startGame:(id)sender;
-(IBAction)select_Day:(id)sender;
-(IBAction)selectGirl_makeOverDay:(id)sender;
-(IBAction)backto_girl:(id)sender;
-(IBAction)selectMakeOver_mainTool:(id)sender;
-(IBAction)nextScreen_fromMakeOverrrom:(id)sender;
-(IBAction)backTo_makeUp:(id)sender;
-(IBAction)GotoHome:(id)sender;
-(IBAction)PlayAgain:(id)sender;
-(IBAction)neXt_selectDay:(id)sender;
-(IBAction)neXt_selectGirl_makeOver:(id)sender;


//starting modules stop

//makeOVERROMMCOMMON  start
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview_makeUpKit_bottom;





//makeOVERROMMCOMMON  stop

//makeOver room_lipstick start
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView_lipstick_types;
@property (strong, nonatomic) IBOutlet UIButton *HandlingTool_makeUp;

-(IBAction)showDetail_LipStickView:(id)sender;



//makeOver room_lipstick stop


//makeOver room_hair start
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_hairMakeoVer;


//makeOver room_hair stop


//makeOver room_eye start
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_eye_types;
@property (strong, nonatomic) IBOutlet UIButton *btn_eye_liquid;



//makeOver room_eye stop


//makeOver room_ear start
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_ear_types;
@property (strong, nonatomic) IBOutlet UIButton *btn_erain_collections;

@property (strong, nonatomic) IBOutlet UIButton *btn_earin_tool;
@property (strong, nonatomic) IBOutlet UIButton *tool_view_btn_earing;



//makeOver room_ear stop

//makeOver room_face start
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView_face_types;





//makeOver room_face stop


-(IBAction)selectBrush_first:(id)sender;
-(IBAction)selectBrush_outSide:(id)sender;







#pragma mark
#pragma mark spa variable and functions start


@property (strong, nonatomic) IBOutlet UIView *viewSelectGirl_spaDay;

@property (strong, nonatomic) IBOutlet UIView *viewspaDay;

@property (strong, nonatomic) IBOutlet OBShapedButton *skin_image;
@property (strong, nonatomic) IBOutlet UIButton *tool_clensing1;
@property (strong, nonatomic) IBOutlet UIButton *tool_clensing3;
@property (strong, nonatomic) IBOutlet UIButton *tool_clensing2;

@property (strong, nonatomic) IBOutlet UIButton *tool_steaming1;
@property (strong, nonatomic) IBOutlet UIButton *tool_steaming2;
@property (strong, nonatomic) IBOutlet UIButton *tool_steaming3;


-(IBAction)spaDay:(id)sender;
-(IBAction)selectSpaGirl:(id)sender;
-(IBAction)click_heater_screen1:(id)sender;
-(IBAction)theTouchDown:(UIButton *)button withEvent:(UIEvent *)event;
-(IBAction)theTouchUpInside:(id)sender;
-(IBAction)theTouchUpOutside:(id)sender;
-(IBAction)select_next_spa:(id)sender;



#pragma mark spa variable and functions stop












@end
