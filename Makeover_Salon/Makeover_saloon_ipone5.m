
//
//  Makeover_saloon_ipone5.m
//  Makeover_Salon
//
//  Created by MAC 7 on 26/08/13.
//  Copyright (c) 2013 MAC 7. All rights reserved.
//

#import "Makeover_saloon_ipone5.h"
#import <QuartzCore/QuartzCore.h>


#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0    * M_PI)

@interface UIImage (ColorOverlayCategory)

- (UIImage*)imageWithColorOverlay:(UIColor*)colorOverlay;

@end


@implementation UIImage (ColorOverlayCategory)

- (UIImage*)imageWithColorOverlay:(UIColor*)colorOverlay
{
    // create drawing context
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    
    // draw current image
    [self drawAtPoint:CGPointZero];
    
    // determine bounding box of current image
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // get drawing context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // flip orientation
    CGContextTranslateCTM(context, 0.0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // set overlay
    CGContextSetBlendMode(context, kCGBlendModeColor);
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextSetFillColorWithColor(context, colorOverlay.CGColor);
    CGContextFillRect(context, rect);
    
    // save drawing-buffer
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // end drawing context
    UIGraphicsEndImageContext();
    
    return returnImage;
}

@end




@interface Makeover_saloon_ipone5 ()


@end

@implementation Makeover_saloon_ipone5
@synthesize view_selectDay,view_selectGirl_makeOver,viewMakeOverroom,scrollview_makeUpKit_bottom,ScrollView_lipstick_types,HandlingTool_makeUp,scrollView_hairMakeoVer,scrollView_eye_types,scrollView_ear_types,scrollView_face_types,btn_earin_tool,btn_erain_collections,tool_view_btn_earing,makeOver_eye_liquid_bottle,btn_eye_liquid,btneye_drop,btneye_drop2,makeOver_back_common,makeOver_tool_draw,btn_currentlyDrawing,makeOver_skin_inner,btn_drawingCheek,btnToColor,btn_cheek_2Layer,btn_lip2Layer,imgViewBackGround;


@synthesize viewspaDay,viewSelectGirl_spaDay,skin_image,tool_clensing1,tool_clensing3,tool_clensing2,tool_steaming1,tool_steaming2,tool_steaming3;
@synthesize btn_erasingEyeBrow,btn_eyebrow2layer,btn_erasinghairColor,btn_hairLayer_2,intermediateView,AdTimer1,AdTimer2,view_shareMakeOverRoom,imgView_final,btnNext,btnDay_makeOver,btnDay_Spa,btnGirl1_makeOver,btnGirl2_makeOver,btnGirl3_makeOver,btnGirl4_makeOver,neXt_selectday,neXt_selectGirl,btn_eyeImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark
#pragma mark common methods start
-(IBAction)GotoHome:(id)sender
{
    [self ResetmakeOverRoom];    
    [view_shareMakeOverRoom removeFromSuperview];
    [viewMakeOverroom removeFromSuperview];
    [view_selectGirl_makeOver removeFromSuperview];
    [view_selectDay removeFromSuperview];
    [self loadChartBoostAd];

}
-(IBAction)PlayAgain:(id)sender
{
    [self ResetmakeOverRoom];
    [view_shareMakeOverRoom removeFromSuperview];
    [viewMakeOverroom removeFromSuperview];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self hideatLoading];

}

-(void)setSelectedGirlImagesForButtons:(int )tag
{
     NSLog(@"setSelectedGirlImagesForButtons tag girl-----%d",tag);
    UIImage *img_skin_inner;
    UIImage *img_eye;
    UIImage *img_eyeBrow;
    UIImage *img_hairColor;
    UIImage *img_lip;
    UIImage *img_cheeck;
    
   if(tag==555)
    {
        
        img_skin_inner=[UIImage imageNamed:@"1stCharOrangeHalfEyeShadow.png"];
        img_eye=[UIImage imageNamed:@"ai_eyes.png"];
        img_eyeBrow=[UIImage imageNamed:@"ai_eyebrows.png"];
        img_hairColor=[UIImage imageNamed:@"WhiteBob.png"];
        img_lip=[UIImage imageNamed:@"ai_lip.png"];
        img_cheeck=[UIImage imageNamed:@"cheek_big (1).png"];
    
        
        
    }
    else if(tag==556)
    {
        
  
        
    }
    
    
    
    [makeOver_skin_inner setImage:img_skin_inner forState:UIControlStateNormal];
    [btn_eyeImage setImage:img_eye forState:UIControlStateNormal];
    [btn_erasingEyeBrow setImage:img_eyeBrow forState:UIControlStateNormal];    
    [btn_erasinghairColor setImage:img_hairColor forState:UIControlStateNormal];
    [btn_currentlyDrawing setImage:img_lip forState:UIControlStateNormal];
    [btn_drawingCheek setImage:img_cheeck forState:UIControlStateNormal];
    
    //second layer buttons
    
     [btn_eyebrow2layer setImage:img_eyeBrow forState:UIControlStateNormal];
     [btn_hairLayer_2 setImage:img_hairColor forState:UIControlStateNormal];
     [btn_lip2Layer setImage:img_lip forState:UIControlStateNormal];
     [btn_cheek_2Layer setImage:img_cheeck forState:UIControlStateNormal];


    
}

-(void)fillColorArray:(int )tag
{    
 //lipstickColors
    NSLog(@"tag girl-----%d",tag);
    
    
  if(tag==555)
  {        

  //lipstick collections
   
       
    imgArray_lipstickColors=[[NSArray alloc]initWithObjects:@"lip01.png",@"lip02.png",@"lip03.png",@"lip04.png",@"lip05.png",@"lip06.png", nil];
   //lipstick collections
      
  //earing collections    
    imgArray_earings=[[NSArray alloc]initWithObjects:@"earrings_1.png",@"earrings_2.png",@"earrings_3.png"
                      ,@"earrings_4.png",@"earrings_5.png",@"earrings_6.png",@"earrings_7.png",@"earrings_8.png",@"earrings_9.png",@"earrings_10.png",@"earrings_11.png",@"earrings_12.png",@"earrings_13.png",@"earrings_14.png",@"earrings_15.png",@"earrings_16.png", nil];
    earImgView=[[UIImageView alloc]initWithFrame:CGRectMake(245, 330, 35, 35)];
      
      //hair type collections
    imgArray_hairTypes=[[NSArray alloc]initWithObjects:@"hair_new_ais.png",@"ai_hair.png",@"hair_type_2",@"hair_type_3",@"hair_type_4", nil];
    imgArray_hairColortypes=[[NSArray alloc]initWithObjects:@"BrownBob.png",@"pinkBob.png",@"WhiteBob.png",@"ai_hair.png", nil];
    
    //hair color types
    
      
     //eyeLash types
    
    imgArray_eyelashTypes=[[NSArray alloc]initWithObjects:@"eyelashes_ais_1.png",@"eyelashes_ais_2.png",@"eyelashes_ais_3.png",@"eyelashes_ais_4.png",@"eyelashes_ais_5.png",nil];
    
      //eyeshadowtypes
    
    imgArray_eyeShadowtypes=[[NSArray alloc]initWithObjects:@"eye_shadowBlack.png",@"eye_shadowBlue.png",@"eye_shadowGreen.png",@"eye_shadowPink.png",@"eye_shadowRed.png", nil];
    
    
 
    
    //eyebrowtypes
    
    imgArray_eyeBrowtypes=[[NSArray alloc]initWithObjects:@"eyebrows_single_newblue.png",@"eyebrows_single_newGreen.png",@"eyebrows_single_newPink.png",@"eyebrows_single_newRed.png",@"eyebrows_single_newYellow.png",nil];    
    //facecolor types
      imgArray_faceColortypes=[[NSArray alloc]initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"cheek_big (1).png", nil];
      
  }
}
-(void)setContentSizeOfScrollViews
{    
    [scrollview_makeUpKit_bottom setContentSize:CGSizeMake(500,50)];
    [scrollView_eye_types setContentSize:CGSizeMake(500,50)];
    
}
- (UIImage *)croppIngimageByImageName:(UIImage *)imageToCrop toRect:(CGRect)rect
{
    //CGRect CropRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+15);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);    
    return cropped;
}
- (void)viewDidLoad
{        
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;   
    [self loadChartBoostAd];
    [self addFreeGameButton];
//    [self loadRevMobAd];
    
}
-(void)timerRevMobAdCalling
{
    
    if(!AdTimer2)
    {
        
        AdTimer2 = [NSTimer scheduledTimerWithTimeInterval: 15.0
                                                    target: self
                                                  selector:@selector(loadRevMobAd)
                                                  userInfo: nil repeats:NO];
    }
    
    
}
-(void)timerChartBoostAdCalling
{
    
    if(!AdTimer1)
    {
       
        AdTimer1 = [NSTimer scheduledTimerWithTimeInterval: 15.0
                                                    target: self
                                                  selector:@selector(loadChartBoostAd)
                                                  userInfo: nil repeats:NO];
    }
    
    
}
-(void)loadChartBoostAd
{
    
    if(cb)
    {
        [AdTimer1 invalidate];
        AdTimer1=nil;
        [self timerChartBoostAdCalling];
    }
    
  
    cb = [Chartboost sharedChartboost];
    cb.appId = @"5257963a17ba47307b000007";
    cb.appSignature = @"6ac17a8eefe31deefc23c8a04320412c58517cd3";
    // Required for use of delegate methods. See "Advanced Topics" section below.
    cb.delegate = self;
    // Begin a user session. Must not be dependent on user actions or any prior network requests.
    // Must be called every time your app becomes active.
    [cb startSession];
    //Show an interstitial
    [cb showInterstitial];
    //[cb cacheInterstitial];
   

    

}
- (BOOL)shouldRequestInterstitial:(NSString *)location
{
    NSLog(@"shouldRequestInterstitial---%@",location);
    return  YES;
}
- (BOOL)shouldRequestInterstitialsInFirstSession
{
    NSLog(@"shouldRequestInterstitialsInFirstSession---");
    [self timerChartBoostAdCalling];
     return YES;
}
- (void)didFailToLoadInterstitial:(NSString *)location
{
    NSLog(@"didFailToLoadInterstitial");
    [self timerChartBoostAdCalling];
}
-(void)addFreeGameButton
{
    UIButton *button = [[RevMobAds session]buttonWithPlacementId:@"5257a5bdb600c84f0d000058"];
    button.frame = CGRectMake(10,10,95,35);
    [self.view addSubview:button];
    [button setTitle:@"More Fun.." forState:UIControlStateNormal];
}
-(void)loadRevMobAd
{
 /*   ad = [[RevMobAds session] bannerView] ;
    ad.delegate = self;
    [ad loadAd];*/
    
    
    if(revmob)
    {
        [AdTimer2 invalidate];
        AdTimer2=nil;
//        [revmob hideBanner];
        [self timerRevMobAdCalling];
        
    }
    if(!revmob)
    {
         [self timerRevMobAdCalling];    
    }
    
    revmob = [RevMobAds session];
    revBannerView = [revmob bannerViewWithPlacementId:@"5257a5bcb600c84f0d000054"];
    revBannerView.frame = CGRectMake(0,0, 320,50);
    [revBannerView loadAd];
    
    for(UIView *activeView in self.view.subviews)
    {
       if([activeView isMemberOfClass:[UIView class]])
        {
       [activeView addSubview:revBannerView];
       [self.view bringSubviewToFront:revBannerView];
        }
    NSLog(@"activeView----tag--%d",activeView.tag);
    }
    
    
}
- (void)revmobAdDidReceive
{
  /* intermediateView.frame = CGRectMake(0,0, 320,50);
    ad.frame = intermediateView.bounds;
    [intermediateView addSubview:ad];*/
}

- (UIImage *) maskImage:(UIImage *)image
               withMask:(UIImage *)maskImage
{
    
    CGImageRef maskRef = maskImage.CGImage;    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);    
    return [UIImage imageWithCGImage:masked];
}
// Do any additional setup after loading the view from its nib.
-(void)hideatLoading
{
    ScrollView_lipstick_types.hidden=TRUE;
    scrollView_hairMakeoVer.hidden=TRUE;
    scrollView_eye_types.hidden=TRUE;
    scrollView_ear_types.hidden=TRUE;
    scrollView_face_types.hidden=TRUE;
    makeOver_tool_draw.hidden=TRUE;
    makeOver_eye_liquid_bottle.hidden=TRUE;
    btneye_drop.hidden=TRUE;
    btneye_drop2.hidden=TRUE;
    flag_eyeliquid_left=FALSE;
    flag_inside_bootlePosition=FALSE;    
}
-(IBAction)startGame:(id)sender
{    
/*  NSLog(@"intermediateView----%@",[NSValue valueWithCGRect:intermediateView.frame]);
    NSLog(@"view frmAame--%@",[NSValue valueWithCGRect:self.view.frame]);
    NSLog(@"view_selectDay frmAame--%@",[NSValue valueWithCGRect:self.view_selectDay.frame]);    */
   /* [view_selectDay setFrame:CGRectMake(0, 50, view_selectDay.frame.size.width, view_selectDay.frame.size.height)];*/
    [self.view addSubview:view_selectDay];
    [self loadRevMobAd];
    [self loadChartBoostAd];
}
-(IBAction)selectBrush_first:(id)sender
{
    makeOver_tool_draw.tag=333;
     NSLog(@"selectBrush_first");
}
-(IBAction)selectBrush_outSide:(id)sender
{
    NSLog(@"selectBrush_outSide");
}
#pragma mark next_selection methods start

-(IBAction)neXt_selectDay:(id)sender
{
    if(btnDay_makeOver.selected==TRUE)
    {
        [self.view addSubview:view_selectGirl_makeOver];
    }
    else if (btnDay_Spa.selected==TRUE)
    {
        [self.view addSubview:viewSelectGirl_spaDay];
    }
    [self loadRevMobAd];
    [self loadChartBoostAd];

    
    
}
-(IBAction)neXt_selectGirl_makeOver:(id)sender
{
    
    NSLog(@"Make_over_room_loading_functions tag girl-----%d",[sender tag]);
    
    
    if((btnGirl1_makeOver.selected==TRUE)||(btnGirl2_makeOver.selected==TRUE)||(btnGirl3_makeOver.selected==TRUE)||(btnGirl4_makeOver.selected==TRUE))
    {
        [self.view addSubview:viewMakeOverroom];
        makeOver_back_common.hidden=TRUE;
        makeOver_back_common.tag=3;
        [self Make_over_room_loading_functions:[sender tag]];
        [self loadRevMobAd];
        [self loadChartBoostAd];
        
    }
    // [scrollview_makeUpKit_bottom setContentSize:CGSizeMake(500,50)];   
}
-(IBAction)select_Day:(id)sender
{
    
    if([sender tag]==101)
    {    
    [btnDay_makeOver setSelected:YES];
    [btnDay_Spa setSelected:NO];
    }
    else if ([sender tag]==102)
    {
    [btnDay_Spa setSelected:YES];
    [btnDay_makeOver setSelected:NO];        
    }
    
    
    
    
    
   /* [self.view addSubview:view_selectGirl_makeOver];
    [self loadRevMobAd];
    [self loadChartBoostAd];*/
}

#pragma mark next_selection methods stop



#pragma mark common methods stop

#pragma mark
#pragma mark Eye _liquid_filling Animation methods start

-(void)reAnimateBottle_eyeliquid
{
    [UIView animateWithDuration:1.0 animations:^{
    CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation1.fillMode = kCAFillModeForwards;
    pathAnimation1.removedOnCompletion = NO;
    pathAnimation1.speed=0.4        ;
    pathAnimation1.repeatCount =1;
    CGMutablePathRef	curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, btneye_drop2.layer.position.x, btneye_drop2.layer.position.y);
    CGPathAddLineToPoint(curvedPath, NULL,175, btneye_drop2.layer.position.x+500);
    //  CGPathAddLineToPoint(curvedPath, NULL, TrimmingTool.layer.position.x, TrimmingTool.layer.position.y+100);
    pathAnimation1.path = curvedPath;
    CGPathRelease(curvedPath);
    [makeOver_eye_liquid_bottle.layer addAnimation:pathAnimation1 forKey:@"position"];
    }completion:^(BOOL finished)
    {
        makeOver_eye_liquid_bottle.hidden=TRUE;
        btn_eye_liquid.hidden=TRUE;
        
    }];    

}
- (void)eyeLiquid_moveTo_Anothereye
{
    [UIView animateWithDuration:3.0 animations:^{
    CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation1.fillMode = kCAFillModeForwards;
	pathAnimation1.removedOnCompletion = NO;
    pathAnimation1.speed=1.0;
    pathAnimation1.repeatCount = 1;
    CGMutablePathRef curvedPath = CGPathCreateMutable();
        
      if(flag_eyeliquid_left==FALSE)
     {
          CGPathMoveToPoint(curvedPath, NULL, 250, 200);
          CGPathAddLineToPoint(curvedPath, NULL, 125, 200);          
      }
      else  if(flag_eyeliquid_left==TRUE)
      {
        CGPathMoveToPoint(curvedPath, NULL, 125, 200);
        CGPathAddLineToPoint(curvedPath, NULL, 250, 200);
            
      }           
	pathAnimation1.path = curvedPath;
	CGPathRelease(curvedPath);
    [makeOver_eye_liquid_bottle.layer addAnimation:pathAnimation1 forKey:@"position"];
    //TrimmingTool.hidden=TRUE;
    }completion:^(BOOL finished){

        [self performSelector:@selector(displaySecondEye) withObject:nil afterDelay:1.0];
        //[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(displaySecondEye) userInfo:nil repeats:NO];	
    }];
}
-(void)displaySecondEye
{
   [self fillingEyeDrops_second:btneye_drop2];

}
- (void)fillingEyeDrops_second : (UIButton *)TrimmingTool

{
    [UIView animateWithDuration:2.0 delay:1.0 options:(UIViewAnimationCurveLinear | UIViewAnimationOptionAutoreverse) animations:^{
        btneye_drop2.hidden=FALSE;
        CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
        pathAnimation1.fillMode = kCAFillModeForwards;
        pathAnimation1.removedOnCompletion = NO;
        pathAnimation1.speed=1.0;
        pathAnimation1.repeatCount =2;
        CGMutablePathRef	curvedPath = CGPathCreateMutable();
        CGPathMoveToPoint(curvedPath, NULL, TrimmingTool.center.x, TrimmingTool.center.y);
        CGPathAddLineToPoint(curvedPath, NULL, TrimmingTool.center.x, TrimmingTool.center.y+100);
        //  CGPathAddLineToPoint(curvedPath, NULL, TrimmingTool.layer.position.x, TrimmingTool.layer.position.y+100);
        pathAnimation1.path = curvedPath;
        CGPathRelease(curvedPath);
        [btneye_drop2.layer addAnimation:pathAnimation1 forKey:@"position"];
        
    }completion:^(BOOL finished){
        
          [self performSelector:@selector(hideEyeDrops_second) withObject:nil afterDelay:1.2];
       // [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hideEyeDrops_second) userInfo:nil repeats:NO];
        
    }];    
}
-(void)hideEyeDrops_second
{
    btneye_drop2.hidden=TRUE;    
    [self reAnimateBottle_eyeliquid];
}

- (void)rotateImage:(UIButton *)image duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees
{

    // Setup the animation

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform =
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    image.transform = transform;         
//  image.userInteractionEnabled=NO;    
    [UIView commitAnimations];         
   
 /* [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(pouringEyeDrops) userInfo:nil repeats:NO];*/
    
    [self performSelector:@selector(pouringEyeDrops) withObject:nil afterDelay:1.0];
  
    

    
    // Commit the changes
   
}
-(void)pouringEyeDrops
{
  
  
    [self fillingEyeDrops:btneye_drop];
      
}
- (void)fillingEyeDrops : (UIButton *)TrimmingTool

{
    [UIView animateWithDuration:2.0 delay:1.0 options:(UIViewAnimationCurveLinear | UIViewAnimationOptionAutoreverse) animations:^{
    btneye_drop.hidden=FALSE;
    CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation1.fillMode = kCAFillModeForwards;
	pathAnimation1.removedOnCompletion = NO;
    pathAnimation1.speed=1.0;
    pathAnimation1.repeatCount =2;
    CGMutablePathRef	curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, TrimmingTool.center.x, TrimmingTool.center.y);
    CGPathAddLineToPoint(curvedPath, NULL, TrimmingTool.center.x, TrimmingTool.center.y+100);
    pathAnimation1.path = curvedPath;
    CGPathRelease(curvedPath);
    [btneye_drop.layer addAnimation:pathAnimation1 forKey:@"position"];
        
    }completion:^(BOOL finished){          
           [self performSelector:@selector(hideEyeDrops) withObject:nil afterDelay:1.0];
    
          
      }];

 
    
    
    
}
-(void)hideEyeDrops
{
    
    
    btneye_drop.hidden=TRUE;
    [self eyeLiquid_moveTo_Anothereye];
    
    
}

#pragma mark Eye _liquid_filling Animation methods stop

#pragma mark
#pragma mark Animation methods start

- (void)earTrimmingTool_removing : (UIButton *)TrimmingTool

{
    
    [UIView animateWithDuration:0.6 animations:^{
    CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation1.fillMode = kCAFillModeForwards;
	pathAnimation1.removedOnCompletion = NO;
    pathAnimation1.speed=0.6;
    pathAnimation1.repeatCount = 1;
    CGMutablePathRef	curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, TrimmingTool.layer.position.x, TrimmingTool.layer.position.y);
    CGPathAddLineToPoint(curvedPath, NULL, TrimmingTool.layer.position.x, TrimmingTool.layer.position.y);
//  CGPathAddLineToPoint(curvedPath, NULL, 245, 330);
	pathAnimation1.path = curvedPath;
	CGPathRelease(curvedPath);
    [TrimmingTool.layer addAnimation:pathAnimation1 forKey:@"position"];
//    TrimmingTool.hidden=TRUE;
    }completion:^(BOOL finished){
        
        [NSTimer scheduledTimerWithTimeInterval:2.3 target:self selector:@selector(cancelearingTool) userInfo:nil repeats:NO];        
        
    }];
    
}

-(void)cancelearingTool
{
    [eartrimmingTool removeFromSuperview];
    btn_earin_tool.hidden=TRUE;
    [self ShowFromLeftside:scrollView_ear_types];
    isEarHoleIsReady=YES;
}
- (void)earTrimmingTool_preseting : (UIButton *)TrimmingTool

{
    CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
//    pathAnimation1.fillMode = kCAFillModeForwards;
	pathAnimation1.removedOnCompletion = NO;
    pathAnimation1.speed=0.6;
    pathAnimation1.repeatCount = 1;
    CGMutablePathRef	curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, TrimmingTool.layer.position.x, TrimmingTool.layer.position.y+400);
    CGPathAddLineToPoint(curvedPath, NULL, TrimmingTool.layer.position.x, TrimmingTool.layer.position.y);
	pathAnimation1.path = curvedPath;
	CGPathRelease(curvedPath);
    [TrimmingTool.layer addAnimation:pathAnimation1 forKey:@"position"];   
    
}

- (void)ButtonAnimationEffects : (UIButton *)ItemButton

{
     [UIView animateWithDuration:0.05 animations:^{scrollViewDetail.alpha = 1.0;}];
    [UIView animateWithDuration:3.0 animations:^{
        CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
            pathAnimation1.fillMode = kCAFillModeForwards;
        pathAnimation1.removedOnCompletion = NO;
        pathAnimation1.speed=0.6;
        pathAnimation1.repeatCount = 1;
        CGMutablePathRef	curvedPath = CGPathCreateMutable();
        CGPathMoveToPoint(curvedPath, NULL, ItemButton.layer.position.x-27, ItemButton.layer.position.y-37);
        CGPathAddLineToPoint(curvedPath, NULL, ItemButton.layer.position.x , ItemButton.layer.position.y);
        pathAnimation1.path = curvedPath;
        CGPathRelease(curvedPath);        
        [ItemButton.layer addAnimation:pathAnimation1 forKey:@"position"];//boView is an outlet of UIView
    }completion:^(BOOL finished){
        }];
    
    for(UIButton *ItemButton in scrollViewDetail.subviews)
    {        
    [UIView animateWithDuration:0.5 animations:^{ItemButton.alpha = 1.0;}];
    }
   


    
}


- (void)showAnimatedImageView : (UIScrollView *)scrollViewrtoMove

{
        NSLog(@"showAnimatedImageView");
    
    CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
//    pathAnimation1.fillMode = kCAFillModeForwards;
	pathAnimation1.removedOnCompletion = NO;
    pathAnimation1.speed=1.0;
    pathAnimation1.repeatCount = 1;
    CGMutablePathRef	curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, scrollViewrtoMove.layer.position.x, scrollViewrtoMove.layer.position.y);   
    CGPathAddLineToPoint(curvedPath, NULL, -190, scrollViewrtoMove.layer.position.y);
	pathAnimation1.path = curvedPath;
	CGPathRelease(curvedPath);  
    [scrollViewrtoMove.layer addAnimation:pathAnimation1 forKey:@"position"];
    scrollViewrtoMove.hidden=TRUE;
}
- (void)ShowFromLeftside : (UIScrollView *)scrollViewrtoMove

{
 
    NSLog(@"ShowFromLeftside");
    CAKeyframeAnimation *pathAnimation1 =[CAKeyframeAnimation animationWithKeyPath:@"position"];
//  pathAnimation1.fillMode = kCAFillModeForwards;
	pathAnimation1.removedOnCompletion = NO;
    pathAnimation1.speed=0.5;
    pathAnimation1.repeatCount = 1;
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL,  scrollViewrtoMove.layer.position.x-350,scrollViewrtoMove.layer.position.y);
    CGPathAddLineToPoint(curvedPath, NULL, scrollViewrtoMove.layer.position.x,scrollViewrtoMove.layer.position.y);
	pathAnimation1.path = curvedPath;
	CGPathRelease(curvedPath);
    [scrollViewrtoMove.layer addAnimation:pathAnimation1 forKey:@"position"];
     scrollViewrtoMove.hidden=FALSE;    
}


#pragma mark Animation methods stop
#pragma mark
#pragma mark menu displaying methods start

/*-(void)Add_makeupItemsToFullScreeScrollview:(NSArray *)contentArray :(int )tag
 {
 scrollViewDetail=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 55, 290, 480)];
 [self.view addSubview:scrollViewDetail];
 scrollViewDetail.tag=tag;
 //  [self showFromTop:scrollViewDetail];
 //    scrollViewDetail.backgroundColor=[UIColor lightGrayColor];
 scrollViewDetail.backgroundColor = [UIColor colorWithWhite:1.0  alpha:0.5];
 
 UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(90, 10, 120, 35)];
 [back addTarget:self action:@selector(closeLast_makeUpitemView)forControlEvents:UIControlEventTouchDown];
 back.tag=500;
 [back setTitle:@"Close" forState:UIControlStateNormal];
 back.userInteractionEnabled=YES;
 [scrollViewDetail addSubview:back];
 
 int coloumn=10;
 int row=56;
 for(int i=0;i<[contentArray count];i++)
 {
 UIImage *image=[UIImage imageNamed:[contentArray objectAtIndex:i]];
 item1=[[UIButton alloc]initWithFrame:CGRectMake(coloumn, row, 56, 56)];
 item1.tag=i;
 item1.backgroundColor=[UIColor clearColor];
 [item1 addTarget:self action:@selector(selectMakeupTool_last:)forControlEvents:UIControlEventTouchDown];
 item1.userInteractionEnabled=YES;
 [scrollViewDetail addSubview:item1];
 [item1 setBackgroundImage:image forState:UIControlStateNormal];
 //      [self ButtonAnimationEffects:item1];
 
 if (coloumn >180)
 {
 coloumn = 10;
 row=row+65;
 }
 else
 {
 coloumn=coloumn+65;
 }
 }
 
 [scrollViewDetail setContentSize:CGSizeMake(scrollViewDetail.frame.size.width, (row+1) * 180 + 10)]
 [self replaceWithScrollview:view_selectGirl_makeOver withView:scrollViewDetail];
 
 }*/
-(void)Add_makeupItemsToFullScreeScrollview:(NSArray *)contentArray :(int )tag
{       
    scrollViewDetail=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 55, 290, 480)];
    [self.view addSubview:scrollViewDetail];
    scrollViewDetail.tag=tag;
     NSLog(@"scrollviewDetail tag---%d\n tagtag...%d",scrollViewDetail.tag,tag);
    //  [self showFromTop:scrollViewDetail];
    //    scrollViewDetail.backgroundColor=[UIColor lightGrayColor];
    scrollViewDetail.backgroundColor = [UIColor colorWithWhite:1.0  alpha:0.5];
    
    UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(90, 10, 120, 35)];
    [back addTarget:self action:@selector(closeLast_makeUpitemView)forControlEvents:UIControlEventTouchDown];
    back.tag=500;
    [back setTitle:@"Close" forState:UIControlStateNormal];
    back.userInteractionEnabled=YES;
    [scrollViewDetail addSubview:back];
    
    /*  int coloumn=10;
     int row=56;
     for(int i=0;i<[contentArray count];i++)
     {
     UIImage *image=[UIImage imageNamed:[contentArray objectAtIndex:i]];
     item1=[[UIButton alloc]initWithFrame:CGRectMake(coloumn, row, 56, 56)];
     item1.tag=i;
     item1.backgroundColor=[UIColor clearColor];
     [item1 addTarget:self action:@selector(selectMakeupTool_last:)forControlEvents:UIControlEventTouchDown];
     item1.userInteractionEnabled=YES;
     [scrollViewDetail addSubview:item1];
     [item1 setBackgroundImage:image forState:UIControlStateNormal];
     //      [self ButtonAnimationEffects:item1];
     
     if (coloumn >180)
     {
     coloumn = 10;
     row=row+65;
     }
     else
     {
     coloumn=coloumn+65;
     }
     }
     
     [scrollViewDetail setContentSize:CGSizeMake(scrollViewDetail.frame.size.width, (row+1) * 180 + 10)];*/
    [self replaceWithScrollview:view_selectGirl_makeOver withView:scrollViewDetail:contentArray];
    
    
    
}



- (void) replaceWithScrollview: (UIView *)currentView withView:(UIScrollView *) newView :(NSArray *)contentArray
{
    [UIView transitionFromView:currentView
                        toView:newView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) {                     
                        [currentView removeFromSuperview];
                        int coloumn=10;
                        int row=56;
                        for(int i=0;i<[contentArray count];i++)
                        {
                            UIImage *image=[UIImage imageNamed:[contentArray objectAtIndex:i]];
                            item1=[[UIButton alloc]initWithFrame:CGRectMake(coloumn, row, 56, 10)];
                            item1.tag=i;
                            item1.alpha=1.0;
                            item1.backgroundColor=[UIColor clearColor];
                            [item1 addTarget:self action:@selector(selectMakeupTool_last:)forControlEvents:UIControlEventTouchDown];
                            item1.userInteractionEnabled=YES;
                            
                          
                            [self showAnimation:item1];
//                            [self removeWithSinkAnimation:20:item1];
                          
                          

                            [item1 setBackgroundImage:image forState:UIControlStateNormal];
                            //      [self ButtonAnimationEffects:item1];
                              [scrollViewDetail addSubview:item1];   
                            
                            if (coloumn >180)
                            {
                                coloumn = 10;
                                row=row+65;
                            }
                            else
                            {
                                coloumn=coloumn+65;
                            }        
                        }
                        
                        [scrollViewDetail setContentSize:CGSizeMake(scrollViewDetail.frame.size.width, (row+1) * 180 + 10)];
                    }];
}


- (void) removeWithSinkAnimation:(int)steps :(UIButton *)button
{
	NSTimer *timer;
    int count;
if (steps > 0 && steps < 100)	// just to avoid too much steps
    count=steps;
	else
	count = 50;
    NSString *stringStep=[NSString stringWithFormat:@"%d",count];
    NSDictionary *wrapper = [NSDictionary dictionaryWithObjectsAndKeys: stringStep,@"steps", nil];
	timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(removeWithSinkAnimationRotateTimer:) userInfo:wrapper repeats:YES];
}

- (void) removeWithSinkAnimationRotateTimer:(NSTimer*) timer
{
    NSDictionary *wrapper = (NSDictionary *)[timer userInfo];
    UIButton * buttonnew = [wrapper objectForKey:@"button"];
    NSString *stepstring = [wrapper objectForKey:@"steps"];
    
    int step=[stepstring integerValue];
//    UIButton* buttonnew=[timer userInfo];
	CGAffineTransform trans = CGAffineTransformRotate(CGAffineTransformScale(buttonnew.transform, 1.0, 1.0),0.314);

	buttonnew.transform = trans;
//    	buttonnew.alpha = buttonnew.alpha * 1.1;
	step = step - 1;
	if (step <= 0)
	{
		[timer invalidate];
        [buttonnew.layer removeAllAnimations];
//        [buttonnew removeFromSuperview];
	}
}

-(void) showAnimation:(UIButton *)button
{
    
    
    button.contentMode = UIViewContentModeRedraw;
    [UIView animateWithDuration:.4f animations:^{
        CGRect theBounds = button.bounds;
        CGPoint theCenter = button.center;
        theBounds.size.height += 30.0f;
        theCenter.y += 25.f;
        button.bounds = theBounds;
        button.center = theCenter;
    }];
  /*  button.contentMode = UIViewContentModeRedraw;
  [UIView animateWithDuration:1.0 animations:^{
        CGRect theFrame = CGRectMake(button.frame.origin.x, button.frame.origin.y, button.frame.size.width, button.frame.size.height);
        theFrame.size.height += 30.0f;
        button.frame = theFrame;
    }];*/

   /* [self.view addSubview:button];
    button.frame =CGRectMake(button.frame.origin.x-35, button.frame.origin.y-35, button.frame.size.width-35, button.frame.size.height-35);// somewhere offscreen, in the direction you want it to appear from
    [UIView animateWithDuration:1.0
                     animations:^{
                         button.frame =CGRectMake(button.frame.origin.x+35, button.frame.origin.y+35, button.frame.size.width+35, button.frame.size.height+35);// its final location
                     }];*/
}
- (void) replaceView: (UIScrollView *) currentView withView: (UIView *) newView
{
    
  
  /*  newView.alpha = 0.0;
    [self.view addSubview: newView];
    
    [UIView animateWithDuration: 1.0
                     animations:^{
                         currentView.alpha = 0.0;
                         newView.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         [currentView removeFromSuperview];
                     }];*/
    
    
    [UIView transitionFromView:currentView
                        toView:newView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) {
                        [currentView removeFromSuperview];
                    }];
    
}

-(void)closeLast_makeUpitemView
{
    
    [self loadRevMobAd];
    [self loadChartBoostAd];
    
[self replaceView:scrollViewDetail withView:viewMakeOverroom];    
}

-(IBAction)selectMakeupTool_last:(id)sender
{
    
       
    
    
    
    int tagID_btn=[sender tag];
    NSLog(@"tag--%d--scrollViewDetail.tag---%d",[sender tag],scrollViewDetail.tag);
//    NSLog(@"array----%@",[imgArray_eyelashTypes objectAtIndex:tagID_btn]);
    makeOver_tool_draw.hidden=FALSE;    
    [self replaceView:scrollViewDetail withView:viewMakeOverroom];
    if(scrollViewDetail.tag==436)
    {
     NSLog(@"tag--%d--scrollViewDetail.tag---%d--%@",[sender tag],scrollViewDetail.tag,[imgArray_hairTypes objectAtIndex:tagID_btn]);    
    }    
   else if(scrollViewDetail.tag==437)
    {
       makeOver_tool_draw.hidden=FALSE;
       self.btn_erasinghairColor.userInteractionEnabled=YES;
       btnToColor=btn_erasinghairColor;
    }
   else if(scrollViewDetail.tag==438)
   {       
     
   }
   else if(scrollViewDetail.tag==439)
   {
    makeOver_tool_draw.hidden=FALSE;
            
   }
    else if(scrollViewDetail.tag==440)
    {
         makeOver_tool_draw.hidden=FALSE;
         self.btn_erasingEyeBrow.userInteractionEnabled=YES;       
         [self.viewMakeOverroom bringSubviewToFront:btn_eyebrow2layer];
         [self.viewMakeOverroom bringSubviewToFront:btn_erasingEyeBrow];
         [self.viewMakeOverroom bringSubviewToFront:makeOver_tool_draw];      
         btnToColor=btn_erasingEyeBrow;                     
         UIImage *imageLip=[UIImage imageNamed:[imgArray_eyeBrowtypes objectAtIndex:tagID_btn]];
         [self.btn_eyebrow2layer setImage:imageLip forState:UIControlStateNormal];
    }
    else if(scrollViewDetail.tag==445)
    {
        NSLog(@"fitt selected earing");
        UIImage *imageEaring=[UIImage imageNamed:[imgArray_earings objectAtIndex:tagID_btn]];
        earImgView.image=imageEaring;
        [viewMakeOverroom addSubview:earImgView];        
    }
    else if(scrollViewDetail.tag==446)
    {
        NSLog(@"lipstick coloring selected");
        self.btn_currentlyDrawing.userInteractionEnabled=YES;
        btnToColor=btn_currentlyDrawing;
        UIImage *imageLip=[UIImage imageNamed:[imgArray_lipstickColors objectAtIndex:tagID_btn]];
        [self.btn_lip2Layer setImage:imageLip forState:UIControlStateNormal];        
    }    
    else if(scrollViewDetail.tag==447)
    {        
        btn_drawingCheek.userInteractionEnabled=YES;
        btnToColor=btn_drawingCheek;
         UIImage *imageCheek=[UIImage imageNamed:[imgArray_faceColortypes objectAtIndex:tagID_btn]];
        btn_cheek_2Layer.imageView.image=imageCheek;
        /*[btn_cheek_2Layer setImage:[imgArray_faceColortypes objectAtIndex:tagID_btn] forState:UIControlStateNormal];*/
    }

}

#pragma mark menu displaying methods stop

#pragma mark
#pragma mark makeOverday methods start

-(void)Make_over_room_loading_functions:(int )tag
{
    
    
     NSLog(@"Make_over_room_loading_functions tag girl-----%d",tag);
    [self fillColorArray:tag];
    [self setSelectedGirlImagesForButtons:tag];    
    
    
    [self setContentSizeOfScrollViews];    
    btnToColor=[[OBShapedButton alloc]init];
   [makeOver_tool_draw addTarget:self action:@selector(toolBrushmoving:withEvent:)
        forControlEvents:UIControlEventTouchDragInside];
    [makeOver_tool_draw addTarget:self action:@selector(finishedDragging:withEvent:)
                    forControlEvents:UIControlEventTouchDragExit|UIControlEventTouchUpInside];
}
- (void)finishedDragging:(UIButton *)button withEvent:(UIEvent *)event
{
    //doesn't get called    
    makeOver_tool_draw.frame=CGRectMake(260, 500, makeOver_tool_draw.frame.size.width, makeOver_tool_draw.frame.size.height);
       [self getdrawedImage];
    NSLog(@"finished dragging");
}

-(IBAction)selectGirl_makeOverDay:(id)sender
{
    [neXt_selectGirl setTag:[sender tag]];
    if([sender tag]==555)
    {
        [btnGirl1_makeOver setSelected:YES];
        [btnGirl2_makeOver setSelected:NO];
        [btnGirl3_makeOver setSelected:NO];
        [btnGirl4_makeOver setSelected:NO];
        
    }
    else if([sender tag]==556)
    {
        [btnGirl2_makeOver setSelected:YES];
        [btnGirl1_makeOver setSelected:NO];
        [btnGirl3_makeOver setSelected:NO];
        [btnGirl4_makeOver setSelected:NO];
    }
    else if([sender tag]==557)
    {
        [btnGirl3_makeOver setSelected:YES];
        [btnGirl1_makeOver setSelected:NO];
        [btnGirl2_makeOver setSelected:NO];
        [btnGirl4_makeOver setSelected:NO];
    }
    else if([sender tag]==558)
    {
        [btnGirl4_makeOver setSelected:YES];
        [btnGirl1_makeOver setSelected:NO];
        [btnGirl2_makeOver setSelected:NO];
        [btnGirl3_makeOver setSelected:NO];
    }



    
    
    
// [scrollview_makeUpKit_bottom setContentSize:CGSizeMake(500,50)];
/*   [self.view addSubview:viewMakeOverroom];
    makeOver_back_common.hidden=TRUE;
    makeOver_back_common.tag=3;
    [self Make_over_room_loading_functions:[sender tag]];
    [self loadRevMobAd];
    [self loadChartBoostAd];*/
    
}
- (void)toolBrushmoving:(UIButton *)button withEvent:(UIEvent *)event
{
    NSLog(@"toolBrushmoving....");    
    UITouch *touch = [[event touchesForView:button] anyObject];
    CGPoint currentPoint_one =[touch locationInView:self.btnToColor.imageView];
    CGPoint currentPoint=CGPointMake(currentPoint_one.x-10, currentPoint_one.y); 
	CGPoint location = [touch locationInView:self.view];    	// move button
	//button.center = CGPointMake(button.center.x + delta_x,button.center.y + delta_y);
    button.center = CGPointMake(location.x+30,location.y-10);
    [self isThereButtonsIntersectionInView:button intersectsWithButton:btnToColor :currentPoint withEvent:event];
    
}
- (BOOL) isThereButtonsIntersectionInView:(UIButton*)button intersectsWithButton:(OBShapedButton
                                                                                  *)moreButtons :(CGPoint ) currentPoint withEvent:(UIEvent *)event
{
       CGRect buttonFrame = button.frame;   
        if (button != moreButtons && CGRectIntersectsRect(buttonFrame, moreButtons.frame))
        {
            NSLog(@"isThereButtonsIntersectionInView---%@",NSStringFromCGPoint(currentPoint));           
            [self coloringButtonMethod:currentPoint withEvent:event];
            return YES;                      
        }
        else
        {
               NSLog(@"no");
    return NO;
        }
    
}
- (void)EyeliguidAnimation_First:(UIButton *)button withEvent:(UIEvent *)event
{    
     NSLog(@"EyeliguidAnimation_First%@", NSStringFromCGPoint(button.center));
    UITouch *touch = [[event touchesForView:button] anyObject];
	// get delta
	CGPoint previousLocation = [touch previousLocationInView:self.view];
	CGPoint location = [touch locationInView:self.view];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    button.center =CGPointMake(button.center.x + delta_x,button.center.y + delta_y);
     NSLog(@"EyeliguidAnimation_last%@", NSStringFromCGPoint(button.center));
    if(flag_inside_bootlePosition==FALSE)	
    {        
    if((button.center.x>(self.view.bounds.size.width/2))&&(button.center.y<(self.view.bounds.size.height/2)))
    {
        
       [makeOver_eye_liquid_bottle setUserInteractionEnabled:NO];
       NSLog(@"right Eye");
       flag_eyeliquid_left=FALSE;
       flag_inside_bootlePosition=TRUE;     
//     button.center=CGPointMake(250 , 200);
       btneye_drop.frame=CGRectMake(250, 200, 25, 25);
       btneye_drop2.frame=CGRectMake(100, 200, 25, 25);
       button.frame=CGRectMake(200, 200, 55, 55);
       [self rotateImage:button duration:1.0 curve:UIViewAnimationCurveEaseOut degrees:-90];
       [self touchesCancelled:[event touchesForView:button] withEvent:event];
        
    }
    else if((button.center.x<self.view.bounds.size.width/2)&&(button.center.y<(self.view.bounds.size.height/2)))
    {
        NSLog(@"Left Eye");
        flag_eyeliquid_left=TRUE;
        btneye_drop.frame=CGRectMake(100, 200, 25, 25);
        btneye_drop2.frame=CGRectMake(250, 200, 25, 25);
        flag_inside_bootlePosition=TRUE;
        [makeOver_eye_liquid_bottle setUserInteractionEnabled:NO];
        button.center=CGPointMake(50 , 200);        
        [self rotateImage:button duration:2.0 curve:UIViewAnimationCurveEaseOut degrees:90];

    }
    }

}
-(void)callingrotate
{
    [self rotateImage:makeOver_eye_liquid_bottle duration:1.0 curve:UIViewAnimationCurveEaseOut degrees:-90];
}
- (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event
{
    
    NSLog(@"wasDragged");
    
    
    UITouch *touch = [[event touchesForView:button] anyObject];    
	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    
	// move button
	button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y + delta_y);
    
    if(button.center.x>210 && button.center.y>300 && button.center.y<400)
    {
        NSLog(@",button.center.x------%f--,button.center.y===%f",button.center.x,button.center.y);        
        
       
        button.center=CGPointMake(245, 330);
        
//        [NSTimer scheduledTimerWithTimeInterval:1.3 target:self selector:@selector(earTrimmingTool_removing) userInfo:nil repeats:NO];
        [self earTrimmingTool_removing:button];
    }
 
}
-(IBAction)selectMakeOver_mainTool:(id)sender
{    
    int selectedTag=[sender tag];
    NSLog(@"selectedtag--%d",selectedTag);
   [self showAnimatedImageView:scrollview_makeUpKit_bottom];    
    if(selectedTag==101)
      {       
         [self ShowFromLeftside:scrollView_hairMakeoVer];       
          
      }
    else if (selectedTag==102)
    {
      [self ShowFromLeftside:scrollView_eye_types];
        
    }
    else if (selectedTag==103)
    {
        
   /*    if(isEarHoleIsReady==YES)
       {
           btn_earin_tool.hidden=TRUE;
       }
       else{
           btn_earin_tool.hidden=FALSE;
       }*/
       [self ShowFromLeftside:scrollView_ear_types];
    }
    else  if(selectedTag==104)
    {
      [self ShowFromLeftside:ScrollView_lipstick_types];
               
    }
    else  if(selectedTag==105)
    {
      [self ShowFromLeftside:scrollView_face_types];
    }
    
    makeOver_back_common.hidden=FALSE;
    makeOver_back_common.tag=4;

}


-(IBAction)showDetail_LipStickView:(id)sender
{    
    int IDTag=[sender tag];    
//  NSLog(@"showDetail_LipStickView");
    
    if(IDTag==1001)
    {
        
        [self Add_makeupItemsToFullScreeScrollview:imgArray_hairTypes:436];
    }
    if(IDTag==1002)
    {        
       /* [eartrimmingTool addTarget:self action:@selector(wasDragged:withEvent:)
                  forControlEvents:UIControlEventTouchDragInside];*/
 
        [self Add_makeupItemsToFullScreeScrollview:imgArray_hairColortypes:437];
    }
    if(IDTag==1003)
    {
        
        [self Add_makeupItemsToFullScreeScrollview:imgArray_eyelashTypes:438];
    }
    if(IDTag==1004)
    {
        [self Add_makeupItemsToFullScreeScrollview:imgArray_eyeShadowtypes:439];
    }

    if(IDTag==1005)
    {        
        [self Add_makeupItemsToFullScreeScrollview:imgArray_eyeBrowtypes:440];
    }
    if(IDTag==1006)
    {
        NSLog(@"show eye Liquid");
        if(makeOver_eye_liquid_bottle.hidden==TRUE)
        {
        makeOver_eye_liquid_bottle.hidden=FALSE;
            flag_inside_bootlePosition=FALSE;
        makeOver_eye_liquid_bottle.userInteractionEnabled=YES;
        makeOver_eye_liquid_bottle.frame=CGRectMake(175, 375, 25, 25);
        [self earTrimmingTool_preseting:makeOver_eye_liquid_bottle];
        [makeOver_eye_liquid_bottle addTarget:self action:@selector(EyeliguidAnimation_First:withEvent:)                    forControlEvents:UIControlEventTouchDragInside];
        }
    }    
       if(IDTag==1007)
    {
        NSLog(@"Earing tool");
        // add drag listener
         eartrimmingTool = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [eartrimmingTool setTitle:@"Drag me!" forState:UIControlStateNormal];
        
        // add drag listener
        [eartrimmingTool addTarget:self action:@selector(wasDragged:withEvent:)
         forControlEvents:UIControlEventTouchDragInside];
        
        // center and size
        eartrimmingTool.frame = CGRectMake((self.view.bounds.size.width - 100)/2.0,
                                  (self.view.bounds.size.height - 50)/2.0,
                                  100, 50);
        
        // add it, centered
        [self.view addSubview:eartrimmingTool];
        [self earTrimmingTool_preseting:eartrimmingTool];
               

    }
    if(IDTag==1008)
    {
     [self Add_makeupItemsToFullScreeScrollview:imgArray_earings:445];
     NSLog(@"Earing collection");
    }
    
    if(IDTag==1009)
    {
        [self Add_makeupItemsToFullScreeScrollview:imgArray_lipstickColors:446];
    }
    
    if(IDTag==1010)
    {
        [self Add_makeupItemsToFullScreeScrollview:imgArray_faceColortypes:447];
    }


}

#pragma mark makeoverDay  methods stop
#pragma mark
#pragma mark back methods start

-(IBAction)backto_girl:(id)sender
{
    int tagId=[sender tag];
    if(tagId==1)
    {
    [view_selectDay removeFromSuperview];        
    }
    else if (tagId==2)
    {
     [view_selectGirl_makeOver removeFromSuperview];
      makeOver_back_common.tag=1;       
    }
    else if (tagId==3)
    {
        [viewMakeOverroom removeFromSuperview];
        makeOver_back_common.tag=2;
    }
    else if (tagId==4)
    {
       [self hideatLoading];
       makeOver_back_common.tag=3;
       makeOver_back_common.hidden=TRUE;
       self.scrollView_ear_types.hidden=TRUE;
         [eartrimmingTool removeFromSuperview];
       [self ShowFromLeftside:scrollview_makeUpKit_bottom];
        
    }
    else if (tagId==5)
    {
        self.ScrollView_lipstick_types.hidden=FALSE;
        makeOver_back_common.tag=4;
    }
    else if (tagId==6)
    {
        [viewSelectGirl_spaDay removeFromSuperview];
    }
    else if (tagId==7)
    {
        [viewspaDay removeFromSuperview];
    }
    
}

-(IBAction)nextScreen_fromMakeOverrrom:(id)sender
{
      
    [self clearScreenAt_clickNext];
  
    
    UIImage *imageFinal=[self getFinalImage];
    [self.viewMakeOverroom addSubview:view_shareMakeOverRoom];
    [self.imgView_final setImage:imageFinal];
      [self loadRevMobAd];
    [self loadChartBoostAd];
}
-(UIImage *)getFinalImage
{
    UIGraphicsBeginImageContext(CGSizeMake(self.viewMakeOverroom.frame.size.width,self.viewMakeOverroom.frame.size.height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.viewMakeOverroom.layer renderInContext:context];
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGRect rect = CGRectMake(self.viewMakeOverroom.frame.origin.x,self.viewMakeOverroom.frame.origin.y+120, self.viewMakeOverroom.frame.size.width,self.viewMakeOverroom.frame.size.height-200);    
    CGImageRef imageRef = CGImageCreateWithImageInRect([screenShot CGImage], rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return cropped;
    
}
-(void)clearScreenAt_clickNext
{
    btnNext.hidden=TRUE;
    scrollView_ear_types.hidden=TRUE;
    scrollView_eye_types.hidden=TRUE;
    scrollView_face_types.hidden=TRUE;
    scrollView_hairMakeoVer.hidden=TRUE;
    ScrollView_lipstick_types.hidden=TRUE;
    scrollview_makeUpKit_bottom.hidden=TRUE;
    makeOver_tool_draw.hidden=TRUE;
    makeOver_back_common.hidden=TRUE;


}
-(void)ResetmakeOverRoom
{
    btnNext.hidden=FALSE;
  /*  scrollView_ear_types.hidden=FALSE;
    scrollView_eye_types.hidden=FALSE;
    scrollView_face_types.hidden=FALSE;
    scrollView_hairMakeoVer.hidden=FALSE;
    ScrollView_lipstick_types.hidden=FALSE;*/
    scrollview_makeUpKit_bottom.hidden=FALSE;
//    makeOver_back_common.hidden=FALSE;
//    makeOver_tool_draw.hidden=FALSE;
}
-(IBAction)backTo_makeUp:(id)sender
{
    [self ResetmakeOverRoom];
      
    [view_shareMakeOverRoom removeFromSuperview];
    
    
    
    
}
#pragma mark back methods stop
#pragma mark
#pragma mark spa methods start



#pragma mark common methods start

-(IBAction)spaDay:(id)sender
{
[self.view addSubview:viewSelectGirl_spaDay];
    
}
-(void)hideSpa_toolsAtloading
{
    
    tool_clensing1.hidden=FALSE;
    tool_clensing2.hidden=FALSE;
    tool_clensing3.hidden=FALSE;

    tool_steaming1.hidden=TRUE;
    tool_steaming2.hidden=TRUE;
    tool_steaming3.hidden=TRUE;
    
    
}
-(void)AddFunctionsTo_spaTools
{
    [tool_clensing1 addTarget:self action:@selector(spa_cleansing_1:withEvent:)
             forControlEvents:UIControlEventTouchDragInside];
    [tool_clensing2 addTarget:self action:@selector(spa_heating_firstEvent:withEvent:)
             forControlEvents:UIControlEventTouchDragInside];
    [tool_clensing3 addTarget:self action:@selector(spa_cleansing_1:withEvent:)
             forControlEvents:UIControlEventTouchDragInside];
    
    [tool_steaming1 addTarget:self action:@selector(spa_steaming_2:withEvent:)
             forControlEvents:UIControlEventTouchDragInside];
    

}
-(IBAction)selectSpaGirl:(id)sender
{
    [self AddFunctionsTo_spaTools];
    [self.view addSubview:viewspaDay];
     g = false;
    [self hideSpa_toolsAtloading];
//    timer_spa= [NSTimer scheduledTimerWithInterval:1.0 target:self selector:@selector(targetMethod:) userInfo:nil repeats:YES];  
 
}
-(IBAction)select_next_spa:(id)sender
{
    if([sender tag]==0)
    {
        
        tool_clensing1.hidden=TRUE;
        tool_clensing2.hidden=TRUE;
        tool_clensing3.hidden=TRUE;
        
        tool_steaming1.hidden=FALSE;
        tool_steaming2.hidden=FALSE;
        tool_steaming3.hidden=FALSE;
    
    }
    
}
#pragma mark common methods stop
#pragma mark

#pragma mark spa_cleansing methods start

#pragma mark clensing methods start//spa_steaming_2

- (void)spa_cleansing_1:(UIButton *)button withEvent:(UIEvent *)event
{
    NSLog(@"spa_cleansing_1....");
    NSLog(@"My view frame: %@", NSStringFromCGRect(button.frame));
    
    UITouch *touch = [[event touchesForView:button] anyObject];
    CGPoint currentPoint = [touch locationInView:skin_image];
//    CGPoint lastPoint = [touch previousLocationInView:skin_image];    
 	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    
	// move button
	button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y + delta_y);
    NSLog(@"touch started555------%f----%f",button.center.x,button.center.y);
//    CGPoint centerPoint=CGPointMake(button.center.x, button.center.y);
    [self isThereButtonsIntersectionInView_spa:button intersectsWithButton:skin_image :currentPoint withEvent:event];
    
}

- (BOOL)isThereButtonsIntersectionInView_spa:(UIButton*)button intersectsWithButton:(OBShapedButton *)moreButtons :(CGPoint ) currentPoint withEvent:(UIEvent *)event
{
    
        NSLog(@"yes----currentPoint---%d",button.tag);
    CGRect buttonFrame = button.frame;
    if (button != moreButtons && CGRectIntersectsRect(buttonFrame, moreButtons.frame))
    {
    NSLog(@"yaya----currentPoint---%@",NSStringFromCGPoint(currentPoint));        
//  NSArray *foamArray=[[NSArray alloc]initWithObjects:@"white.png",@"White1.png",@"White2.png", nil];
//  int i=arc4random()%3;
//  NSString *imgName=[foamArray objectAtIndex:i];
    UIImage  *drawImageN;
        
        if(button.tag==1014)
        {    
            tool_clensing3.tag=1016;

//          drawImageN=[UIImage imageNamed:imgName];
            drawImageN=[UIImage imageNamed:@"flake.png"];

        }
        else if (button.tag==1015)
        {
//            UIImage *drawImageN=[UIImage imageNamed:@"facecolour.png"];
//          [self drawImage:drawImageN inImage:skin_image.imageView.image atPoint:currentPoint];

        }
        
       else if(button.tag==1016)
        {
            drawImageN=[UIImage imageNamed:@"facecolour.png"];

//          [self drawImage:porurImage inImage:skin_image.imageView.image atPoint:currentPoint];
        }
       else{
           
       }
        
   
        
      [skin_image drawImage:drawImageN inImage:skin_image.imageView.image atPoint:currentPoint withEvent:event];
    return YES;        
    }
    else
    {        
        NSLog(@"no");
        return NO;
    }    
}

-(void ) drawImage:(UIImage*) fgImage
              inImage:(UIImage*) bgImage
              atPoint:(CGPoint) point
{
    
    UIGraphicsBeginImageContextWithOptions(bgImage.size, FALSE, 0.0);
    [bgImage drawInRect:CGRectMake( 0, 0, bgImage.size.width, bgImage.size.height)];
    [fgImage drawInRect:CGRectMake( point.x, point.y, fgImage.size.width, fgImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    skin_image.imageView.image=newImage;    
    UIGraphicsEndImageContext();
      
}

#pragma mark clensing methods stop
#pragma mark
#pragma mark spa_heating methods start

- (void)spa_heating_firstEvent:(UIButton *)button withEvent:(UIEvent *)event
{
//    NSLog(@"spa_heating_firstEvent....");
    
    UITouch *touch = [[event touchesForView:button] anyObject];
//    CGPoint currentPoint = [touch locationInView:skin_image];
  //  CGPoint lastPoint = [touch previousLocationInView:skin_image];
 	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    
	// move button
	button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y + delta_y);
    
    


    for(UIImageView *subview in self.view.subviews)
    
        if((subview.frame.origin.y<480)&&(subview.tag==11111))
        {
            [subview removeFromSuperview];
              NSLog(@"spa_heating_firstEvent....");
        }


   

    
}


-(IBAction)theTouchDown:(UIButton *)button withEvent:(UIEvent *)event
{
    NSLog(@"theTouchDown....");
    g = true;
//  NSLog(@"My view frame: %@", NSStringFromCGRect(tool_clensing2.frame));
    [self touchDownLast:button withEvent:event];
    
   

    /*timer_spa= [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer:withEvent:) userInfo:nil repeats:YES];*/


}

-(void)touchDownLast:(UIButton *)button withEvent:(UIEvent *)event
{
    
    
    
    
    timer_spa= [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer) userInfo:event repeats:YES];
    
}



-(IBAction)theTouchUpInside:(id)sender
{
    
    NSLog(@"theTouchUpInside....%d",[sender tag]);
    if([sender tag]==1014)
    {
      tool_clensing1.frame=CGRectMake(124, 519, 96, 44);
        
        
    }
    
   else if([sender tag]==1015)
    {
    g = false;
    [timer_spa invalidate];
    tool_clensing2.frame=CGRectMake(229, 445, 96, 44);
    for(UIImageView *subview in self.view.subviews)
        if(subview.tag==11111)
        {
            [subview removeFromSuperview];
        }
    }
   else if([sender tag]==1016)
    {
        tool_clensing3.frame=CGRectMake(0, 519, 96, 44);
        
        
    }



  }

-(IBAction)theTouchUpOutside:(id)sender
{
    
    
     NSLog(@"theTouchUpOutside....");
    if([sender tag]==333)
    {
        tool_clensing1.frame=CGRectMake(124, 519, 96, 44);
        
        
    }
    
  else  if([sender tag]==1014)
    {
        tool_clensing1.frame=CGRectMake(124, 519, 96, 44);
        
        
    }
   else if([sender tag]==1015)
    {
     g = false;
    [timer_spa invalidate];
    tool_clensing2.frame=CGRectMake(229, 445, 96, 44);
    for(UIImageView *subview in self.view.subviews)
        if(subview.tag==11111)
        {
            [subview removeFromSuperview];
        }
    }
    
   else if([sender tag]==1016)
   {
       tool_clensing3.frame=CGRectMake(0, 519, 96, 44);
       
       
   }


    
}

- (void)onTimer
{
      UIEvent *newEvent=[timer_spa userInfo];    
      UITouch *touch = [[newEvent touchesForView:tool_clensing2] anyObject];  
      CGPoint currentPoint = [touch locationInView:skin_image];
    
     NSLog(@"onTimer----currentPoint---%@",NSStringFromCGPoint(currentPoint));
 
    if (g == true)
    {  // build a view from our flake image
    UIImage	*flakeImage = [UIImage imageNamed:@"flake.png"];
    UIImageView* flakeView = [[UIImageView alloc]initWithImage:flakeImage];
  
  
    // use the random() function to randomize up our flake attributes
    int startX =tool_clensing2.center.x-50;// round(random() % 320);
    int startY=tool_clensing2.center.y;       
//    int endX =tool_clensing2.frame.origin.x-50;   //round(random() % 320);
    int endX=[self endX_randomValue:tool_clensing2.frame.origin.x];

    double scale = 1 / round(random() % 100) + 1.0;
    double speed = 1 / round(random() % 100) + 1.0; 
    
    // set the flake start position
    flakeView.frame = CGRectMake(startX, startY, 25.0 * scale, 25.0 * scale);
    flakeView.alpha = 0.15;//0.25;    
    // put the flake in our main view
    [self.view addSubview:flakeView];
    flakeView.tag=11111;
//      [tool_clensing2 sendSubviewToBack:flakeView];
        
        CGPoint newPoint=CGPointMake(currentPoint.x-80, currentPoint.y+20);

        
       /* [self isThereButtonsIntersectionInView_spa:tool_clensing2 intersectsWithButton:skin_image :newPoint withEvent:newEvent];*/
       UIImage *drawImageN=[UIImage imageNamed:@"facecolour.png"];

  [skin_image drawImage:drawImageN inImage:skin_image.imageView.image atPoint:newPoint withEvent:newEvent];
        
        
        
    
    [UIView beginAnimations:nil context:(__bridge void *)(flakeView)];
    // set up how fast the flake will fall
    [UIView setAnimationDuration:7 * speed];
    
    // set the postion where flake will move to
    flakeView.frame = CGRectMake(endX, 520.0, 25.0 * scale, 25.0 * scale);
    
    // set a stop callback so we can cleanup the flake when it reaches the
    // end of its animation
    
    
//    NSLog(@"flakeview tag---%d",flakeView.tag);
    [UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    }
    else{
        for(UIImageView *subview in self.view.subviews)
            if(subview.tag==11111)
            {
                [subview removeFromSuperview];
            }
    
    }
    
}

-(int)endX_randomValue:(int )integer
{
    NSArray *arcEndXArray=[[NSArray alloc]initWithObjects:@"50",@"73",@"30",@"80",@"75",@"85",@"45",@"35",@"70",@"40",@"33",@"65",@"60",@"57",@"67",@"61",@"59", nil];
    NSInteger randomIndex = arc4random()%[arcEndXArray count];
    NSString *quote = [arcEndXArray objectAtIndex:randomIndex];
    int value=[quote intValue];    
    int EndX_final=tool_clensing2.center.x-value;
    return EndX_final;
    
}
- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    
    for(UIImageView *subview in self.view.subviews)
        if(subview.tag==11111)
        {
//            [subview removeFromSuperview];
            UIImageView *flakeView = (__bridge UIImageView *)(context);
            flakeView.alpha=0.0;
//            [flakeView removeFromSuperview];
        }

  
  
    
    
}

/*- (BOOL)cleansing_heating_spa:(UIButton*)button intersectsWithButton:(OBShapedButton *)moreButtons :(CGPoint ) currentPoint
{
    
    
    if(button.tag==1015)
    {
     UIImage *drawImageN=[UIImage imageNamed:@"facecolour.png"];
     [self drawImage:drawImageN inImage:skin_image.imageView.image atPoint:currentPoint];
      

    }

    
    return  YES;

}*/

#pragma mark spa_heating methods stop

#pragma mark spa_cleansing methods stop


#pragma mark
#pragma mark spa_steaming methods start

- (void)spa_steaming_2:(UIButton *)button withEvent:(UIEvent *)event
{
    NSLog(@"spa_steaming_2....");
    NSLog(@"My view frame: %@", NSStringFromCGRect(button.frame));
    
    UITouch *touch = [[event touchesForView:button] anyObject];
//    CGPoint currentPoint = [touch locationInView:skin_image];
//    CGPoint lastPoint = [touch previousLocationInView:skin_image];
 	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    
	// move button
	button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y + delta_y);
  /*  NSLog(@"touch started222------%f----%f",button.center.x,button.center.y);
    CGPoint centerPoint=CGPointMake(button.center.x, button.center.y);
    [self isThereButtonsIntersectionInView_spa:button intersectsWithButton:skin_image :currentPoint withEvent:event];*/
     
}




#pragma mark spa_steaming methods stop

#pragma mark
#pragma mark new_erasing methods start
-(void)coloringButtonMethod:(CGPoint )currentPoint withEvent:event
{
  //  BOOL start=[self.btn_currentlyDrawing pointInside:currentPoint withEvent:event];
    
    
   // if(start==YES)
   // {
//        UITouch *touch = [touches anyObject];
//        CGPoint  lastPointxx = [touch locationInView:self.btn_currentlyDrawing.imageView];
    NSLog(@"coloringButtonMethod....");
    
        UIGraphicsBeginImageContext(self.btnToColor.imageView.frame.size);
        [self.btnToColor.imageView.image drawInRect:CGRectMake(0, 0, self.btnToColor.imageView.frame.size.width, self.btnToColor.imageView.frame.size.height)];
          CGContextSetLineCap(UIGraphicsGetCurrentContext(),kCGLineCapRound); //kCGImageAlphaPremultipliedLast);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 30);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 0, 0, 35);
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        //this line code for erasing select the part of the image
        CGContextClearRect (UIGraphicsGetCurrentContext(), CGRectMake(currentPoint.x, currentPoint.y, 15, 10));
        //End the code
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.btnToColor.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//       UIImage *imagSet=  UIGraphicsGetImageFromCurrentImageContext();
//      [self.btn_drawingCheek setImage:imagSet forState:UIControlStateNormal];
        UIGraphicsEndImageContext();
    
//   [self getdrawedImage];
            
   // }
}

-(void)getdrawedImage
{
    NSLog(@"getdrawedImage");
    
    UIGraphicsBeginImageContext(CGSizeMake(self.viewMakeOverroom.frame.size.width,self.viewMakeOverroom.frame.size.height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.viewMakeOverroom.layer renderInContext:context];
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGRect rect = CGRectMake(self.btnToColor.frame.origin.x, self.btnToColor.frame.origin.y, self.btnToColor.frame.size.width, self.btnToColor.frame.size.height);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([screenShot CGImage], rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];    
    CGImageRelease(imageRef);
    [btnToColor setImage:cropped forState:UIControlStateNormal];




     
}
/*- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     NSLog(@"touchesBegan");

    
    UITouch *touch = [touches anyObject];
    CGPoint firstPoint = [touch locationInView:self.view];
    NSLog(@"touchesBegan....firstPoint..%@",NSStringFromCGPoint(firstPoint));
    
        NSLog(@"touchesBegan....firstPoint..%@",NSStringFromCGRect(CGRectMake(makeOver_tool_draw.frame.origin.x, makeOver_tool_draw.frame.origin.y, makeOver_tool_draw.frame.size.width, makeOver_tool_draw.frame.size.height)));
    
    
    if(((firstPoint.x>makeOver_tool_draw.frame.origin.x-20)&&(firstPoint.x<makeOver_tool_draw.frame.origin.x+makeOver_tool_draw.frame.size.width+20))&&(firstPoint.y>makeOver_tool_draw.frame.origin.y-20)&&(firstPoint.y<makeOver_tool_draw.frame.origin.y+makeOver_tool_draw.frame.size.height+20))
    {
        makeOver_tool_draw.tag=333;
        makeOver_tool_draw.center = CGPointMake(firstPoint.x+40,
                                                firstPoint.y-10);
    }

    
   
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved....%d",makeOver_tool_draw.tag);
    
    
    
   
    
    
    
	// move button
if(self.makeOver_tool_draw.tag==333)
{
        
    UITouch *touch = [touches anyObject];
     CGPoint  brushpoint = [touch locationInView:self.view];
    CGPoint  lastPointxx = [touch locationInView:self.btn_currentlyDrawing.imageView];
    
    UIGraphicsBeginImageContext(self.btn_currentlyDrawing.imageView.frame.size);
    [self.btn_currentlyDrawing.imageView.image drawInRect:CGRectMake(0, 0, self.btn_currentlyDrawing.imageView.frame.size.width, self.btn_currentlyDrawing.imageView.frame.size.height)];
    //  CGContextSetLineCap(UIGraphicsGetCurrentContext(),kCGLineCapRound); //kCGImageAlphaPremultipliedLast);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 30);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 0, 0, 35);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPointxx.x, lastPointxx.y);
    //this line code for erasing select the part of the image
    CGContextClearRect (UIGraphicsGetCurrentContext(), CGRectMake(lastPointxx.x, lastPointxx.y, 10, 10));
    //End the code
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.btn_currentlyDrawing.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    makeOver_tool_draw.center = CGPointMake(brushpoint.x+40,
                                           brushpoint.y-10);
}


}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    makeOver_tool_draw.tag=0;
    NSLog(@"touchesEnded");
    
    makeOver_tool_draw.center=CGPointMake(182, 358);
}*/
#pragma mark new_erasing methods stop
#pragma mark spa methods stop


#pragma mark spa methods stop



@end
