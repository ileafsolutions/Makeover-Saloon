/*
 Copyright (c) 2009 Ole Begemann
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

/*
 OBShapedButton.m
 
 Created by Ole Begemann
 October, 2009
 */

#import "OBShapedButton.h"
#import "UIImage+ColorAtPixel.h"

@interface OBShapedButton ()

@property (nonatomic, assign) CGPoint previousTouchPoint;
@property (nonatomic, assign) BOOL previousTouchHitTestResponse;
@property (nonatomic, strong) UIImage *buttonImage;
@property (nonatomic, strong) UIImage *buttonBackground;

- (void)updateImageCacheForCurrentState;
- (void)resetHitTestCache;


@end


@implementation OBShapedButton
@synthesize drawColors,ArrayOfPoints,lipColor,currntAlpha,drawingWidth,brushPoint,imgView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        ArrayOfPoints=[[NSMutableArray alloc]init];
 
        
             
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    [self updateImageCacheForCurrentState];
    [self resetHitTestCache];
}

#pragma mark - Hit testing

- (BOOL)isAlphaVisibleAtPoint:(CGPoint)point forImage:(UIImage *)image
{
    // Correct point to take into account that the image does not have to be the same size
    // as the button. See https://github.com/ole/OBShapedButton/issues/1
    CGSize iSize = image.size;
    CGSize bSize = self.bounds.size;
    point.x *= (bSize.width != 0) ? (iSize.width / bSize.width) : 1;
    point.y *= (bSize.height != 0) ? (iSize.height / bSize.height) : 1;

    UIColor *pixelColor = [image colorAtPixel:point];
    CGFloat alpha = 0.0;
    
    if ([pixelColor respondsToSelector:@selector(getRed:green:blue:alpha:)])
    {
        // available from iOS 5.0
        [pixelColor getRed:NULL green:NULL blue:NULL alpha:&alpha];
    }
    else
    {
        // for iOS < 5.0
        // In iOS 6.1 this code is not working in release mode, it works only in debug
        // CGColorGetAlpha always return 0.
        CGColorRef cgPixelColor = [pixelColor CGColor];
        alpha = CGColorGetAlpha(cgPixelColor);
    }
    return alpha >= kAlphaVisibleThreshold;
}


// UIView uses this method in hitTest:withEvent: to determine which subview should receive a touch event.
// If pointInside:withEvent: returns YES, then the subview’s hierarchy is traversed; otherwise, its branch
// of the view hierarchy is ignored.
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event 
{
    // Return NO if even super returns NO (i.e., if point lies outside our bounds)
    BOOL superResult = [super pointInside:point withEvent:event];
    if (!superResult) {
        return superResult;
    }

    // Don't check again if we just queried the same point
    // (because pointInside:withEvent: gets often called multiple times)
    if (CGPointEqualToPoint(point, self.previousTouchPoint)) {
        return self.previousTouchHitTestResponse;
    }
    else {
        self.previousTouchPoint = point;
    }

    BOOL response = NO;
    
    if (self.buttonImage == nil && self.buttonBackground == nil) {
        response = YES;
    }
    else if (self.buttonImage != nil && self.buttonBackground == nil) {
        response = [self isAlphaVisibleAtPoint:point forImage:self.buttonImage];
    }
    else if (self.buttonImage == nil && self.buttonBackground != nil) {
        response = [self isAlphaVisibleAtPoint:point forImage:self.buttonBackground];
    }
    else {
        if ([self isAlphaVisibleAtPoint:point forImage:self.buttonImage]) {
            response = YES;
        } else {
            response = [self isAlphaVisibleAtPoint:point forImage:self.buttonBackground];
        }
    }
    
    self.previousTouchHitTestResponse = response;
    
    NSLog(@"response555----%u",response);
    return response;
    
    
    
   /* unsigned char pixel[1] = {0};
    CGContextRef context = CGBitmapContextCreate(pixel,
                                                 1, 1, 8, 1, NULL,
                                                 kCGImageAlphaOnly);
    UIGraphicsPushContext(context);
    [self.imgView.image drawAtPoint:CGPointMake(-point.x, -point.y)];
    UIGraphicsPopContext();
    CGContextRelease(context);
    CGFloat alpha = pixel[0]/255.0f;
    BOOL transparent = alpha < 0.01f;
    
    return !transparent;*/

}


#pragma mark - Accessors

// Reset the Hit Test Cache when a new image is assigned to the button
- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self updateImageCacheForCurrentState];
    [self resetHitTestCache];
    
   
    
  /*  UIImage *img=[UIImage imageNamed:@"ai_lip.png"];
    [self.imageView setImage:img];
    self.imgView.image=nil;*/
//    [self.imgView setImage:[UIImage imageNamed:@"ai_lip.png"]];
//    [self.imageView setImage:[UIImage imageNamed:@"ai_lip.png"]];
    
    
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    [super setBackgroundImage:image forState:state];
    [self updateImageCacheForCurrentState];
    [self resetHitTestCache];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    [self updateImageCacheForCurrentState];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self updateImageCacheForCurrentState];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self updateImageCacheForCurrentState];
}


#pragma mark - Helper methods

- (void)updateImageCacheForCurrentState
{
    _buttonBackground = [self currentBackgroundImage];
    _buttonImage = [self currentImage];
}

- (void)resetHitTestCache
{
    self.previousTouchPoint = CGPointMake(CGFLOAT_MIN, CGFLOAT_MIN);
    self.previousTouchHitTestResponse = NO;
}


///*
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    
    
    

 //   [self.paint_brush addTarget:self action:@selector(toolBrushmoving:withEvent:) forControlEvents:UIControlEventTouchDragInside];

  /*  NSLog(@"touchesBegan");
    
    UITouch *touch = [touches anyObject];
   CGPoint firstPoint = [touch locationInView:self];
        NSLog(@"touchesBegan....firstPoint..%@",NSStringFromCGPoint(firstPoint));
    BOOL start=[self pointInside:lastPoint withEvent:event];
    if(start==YES)
    {
         mouseSwiped = NO;
    NSLog(@"start----%u",start);
 
    
    NSLog(@"currentPointstart----%u",start);
    if(start==YES)
    {
        NSLog(@"inside button");
    }
    else{
        
        NSLog(@"outside button");
    }

    lastPoint.y -= 0;
    }*/
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
//    NSLog(@"touchesMoved----%f",self.brushPoint.x);
   /* UITouch *touch = [touches anyObject];
    CGPoint  lastPointxx = [touch locationInView:self.imageView];
    
    UIGraphicsBeginImageContext(self.imageView.frame.size);
    [self.imageView.image drawInRect:CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height)];
    //  CGContextSetLineCap(UIGraphicsGetCurrentContext(),kCGLineCapRound); //kCGImageAlphaPremultipliedLast);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 30);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 0, 0, 35);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPointxx.x, lastPointxx.y);
    //this line code for erasing select the part of the image
    CGContextClearRect (UIGraphicsGetCurrentContext(), CGRectMake(lastPointxx.x, lastPointxx.y, 10, 10));
    //End the code
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();*/
    
}


- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{    
//    NSLog(@"touchesEnded");
}
//*/
-(void)coloringButtonMethod:(CGPoint )currentPoint withEvent:event
{
    BOOL start=[self pointInside:currentPoint withEvent:event];

    
    if(start==YES)
    {
    
      
 
        NSLog(@"tag make mouth Over Tag======%d",self.tag);
                     
        //do something when button is touched
        
     /*   UIGraphicsBeginImageContext(self.frame.size);
        [self.imageView.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        //  CGContextSetLineCap(UIGraphicsGetCurrentContext(),kCGLineCapRound); //kCGImageAlphaPremultipliedLast);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 30);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 0, 0, 35);
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        //this line code for erasing select the part of the image
        CGContextClearRect (UIGraphicsGetCurrentContext(), CGRectMake(currentPoint.x, currentPoint.y, 10, 10));
        //End the code
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();   */

        
        
      /*  imgView =[[UIImageView alloc]init];//WithImage:self.imageView.image] ; // Create and initialize imageView
        [self.imageView addSubview:imgView];
        
        UIGraphicsBeginImageContext(self.frame.size);
        [imgView.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.drawingWidth);
        //CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.drawColors[1], self.drawColors[2], self.drawColors[3], alpha);
        CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(),lipColor.CGColor);
        CGContextSetAlpha(UIGraphicsGetCurrentContext(), self.currntAlpha);
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        
        
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeOverlay);
        
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        imgView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);// Set frame for imageView        
        imgView.layer.shadowColor = [self.lipColor CGColor];
        imgView.layer.shadowRadius = 4.0f;
        imgView.layer.shadowOffset = CGSizeZero;
        imgView.layer.masksToBounds = NO;
        if(self.tag==111)
        {
        imgView.alpha=0.05;//0.05
        }
        else if (self.tag==112)
        {
            imgView.alpha=0.020;
        }
        else if (self.tag==114)
        {
//            imgView.alpha=1.0;
        }

        self.imageView.layer.shadowOpacity=1.0;
        lastPoint=currentPoint;*/
        //self.imageView.image=[UIImage imageNamed:@"ai_lip.png"];
        
        
                
        /* imgView =[[UIImageView alloc]init];//WithImage:self.imageView.image] ; // Create and initialize imageView
         [self.imageView addSubview:imgView];
         UIGraphicsBeginImageContext(self.frame.size);
         [imgView.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
         CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
         CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.drawingWidth);
         //CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.drawColors[1], self.drawColors[2], self.drawColors[3], alpha);
         CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(),lipColor.CGColor);
         CGContextSetAlpha(UIGraphicsGetCurrentContext(), self.currntAlpha);
         CGContextBeginPath(UIGraphicsGetCurrentContext());
         CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
         CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
         CGContextStrokePath(UIGraphicsGetCurrentContext());
         CGContextFlush(UIGraphicsGetCurrentContext());
         CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeOverlay);
         imgView.image = UIGraphicsGetImageFromCurrentImageContext();
         UIGraphicsEndImageContext();
         imgView.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);// Set frame for imageView
         imgView.layer.shadowColor = [self.lipColor CGColor];
         imgView.layer.shadowRadius = 4.0f;
         imgView.layer.shadowOffset = CGSizeZero;
         imgView.layer.masksToBounds = NO;
         imgView.alpha=0.05;
         self.imageView.layer.shadowOpacity=0.01;
         lastPoint=currentPoint;
*/
  
    
    NSLog(@"yes coloring method");
    /*UIGraphicsBeginImageContext(self.frame.size);
    [self.imageView.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.drawingWidth);
    //CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.drawColors[1], self.drawColors[2], self.drawColors[3], alpha);
    
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(),lipColor.CGColor);
    CGContextSetAlpha(UIGraphicsGetCurrentContext(), self.currntAlpha);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    CGContextFlush(UIGraphicsGetCurrentContext());
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();     
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeOverlay);
    UIGraphicsEndImageContext();
    lastPoint=currentPoint;*/
    
}

}

-(UIImage*) drawImage:(UIImage*) fgImage
              inImage:(UIImage*) bgImage
              atPoint:(CGPoint)  point withEvent:event
{
    
   /* UIGraphicsBeginImageContextWithOptions(fgImage.size, FALSE, 0.0);
    [fgImage drawInRect:CGRectMake( 0, 0, fgImage.size.width, fgImage.size.height)];
    [fgImage drawInRect:CGRectMake( point.x, point.y, fgImage.size.width, fgImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();    
    return newImage;*/
    BOOL start=[self pointInside:point withEvent:event];
    UIImage *newImage=bgImage;    
    if(start==YES)
    {
        
    UIGraphicsBeginImageContextWithOptions(bgImage.size, FALSE, 0.0);
    [bgImage drawInRect:CGRectMake( 0, 0, bgImage.size.width, bgImage.size.height)];
    [fgImage drawInRect:CGRectMake( point.x, point.y, fgImage.size.width, fgImage.size.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image=newImage;
        
    }
   return newImage;    
}

/*- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //Using code from http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
    
    unsigned char pixel[1] = {0};
    CGContextRef context = CGBitmapContextCreate(pixel,
                                                 1, 1, 8, 1, NULL,
                                                 kCGImageAlphaOnly);
    UIGraphicsPushContext(context);
    [image drawAtPoint:CGPointMake(-point.x, -point.y)];
    UIGraphicsPopContext();
    CGContextRelease(context);
    CGFloat alpha = pixel[0]/255.0f;
    BOOL transparent = alpha < 0.01f;
    
    return !transparent;
}*/

/*- (void)toolBrushmoving:(UIView *)button withEvent:(UIEvent *)event
{
    
    NSLog(@"painting..");
    UITouch *touch = [[event touchesForView:button] anyObject];
    
	// get delta
	CGPoint previousLocation = [touch previousLocationInView:button];
	CGPoint location = [touch locationInView:button];
	CGFloat delta_x = location.x - previousLocation.x;
	CGFloat delta_y = location.y - previousLocation.y;
    
	// move button
	button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y + delta_y);    
 
}*/


- (UIImage*)seperatAlphaFromImage:(UIImage*)pngImage writeToFile:(NSString*)path compressionQuality:(float)value0To1
{
    CGRect imageRect = CGRectMake(0, 0, pngImage.size.width, pngImage.size.height);
    
    //Pixel Buffer
    uint32_t* piPixels = (uint32_t*)malloc(imageRect.size.width * imageRect.size.height * sizeof(uint32_t));
    if (piPixels == NULL)
    {
        return nil;
    }
    memset(piPixels, 0, imageRect.size.width * imageRect.size.height * sizeof(uint32_t));
    
    //Drawing image in the buffer
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(piPixels, imageRect.size.width, imageRect.size.height, 8, sizeof(uint32_t) * imageRect.size.width, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    CGContextDrawImage(context, imageRect, pngImage.CGImage);
    
    //Copying the alpha values to the red values of the image and setting the alpha to 1
    for (uint32_t y = 0; y < imageRect.size.height; y++)
    {
        for (uint32_t x = 0; x < imageRect.size.width; x++)
        {
            uint8_t* rgbaValues = (uint8_t*)&piPixels[y * (uint32_t)imageRect.size.width + x];
            
            //alpha = 0, red = 1, green = 2, blue = 3.
            
            rgbaValues[0] = rgbaValues[0];
            rgbaValues[1] = rgbaValues[0];
            rgbaValues[2] = rgbaValues[0];
            rgbaValues[3] = rgbaValues[0];
        }
    }
    
    //Creating image whose red values will preserve the alpha values
    CGImageRef newCGImage = CGBitmapContextCreateImage(context);
    UIImage* newImage = [[UIImage alloc] initWithCGImage:newCGImage];
    CGImageRelease(newCGImage);
    
    return newImage;
}
- (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha
{
    return  YES;
}
- (void) clear
{
    // self.image = ;
}
- (UIColor*) getPixelColorAtLocation:(CGPoint)point {
	UIColor* color = nil;
	CGImageRef inImage = self.imageView.image.CGImage;
	// Create off screen bitmap context to draw the image into. Format ARGB is 4 bytes for each pixel: Alpa, Red, Green, Blue
	CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
	if (cgctx == NULL) { return nil; /* error */ }
    
    size_t w = CGImageGetWidth(inImage);
	size_t h = CGImageGetHeight(inImage);
	CGRect rect = {{0,0},{w,h}};
    
	// Draw the image to the bitmap context. Once we draw, the memory
	// allocated for the context for rendering will then contain the
	// raw image data in the specified color space.
	CGContextDrawImage(cgctx, rect, inImage);
    
	// Now we can get a pointer to the image data associated with the bitmap
	// context.
	unsigned char* data = CGBitmapContextGetData (cgctx);
	if (data != NULL) {
		//offset locates the pixel in the data from x,y.
		//4 for 4 bytes of data per pixel, w is width of one row of data.
		int offset = 4*((w*round(point.y))+round(point.x));
		int alpha =  data[offset];
		int red = data[offset+1];
		int green = data[offset+2];
		int blue = data[offset+3];
		NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
		color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
	}
    
	// When finished, release the context
	CGContextRelease(cgctx);
	// Free image data memory for the context
	if (data) { free(data); }
    
	return color;
}

- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage {
    
	CGContextRef    context = NULL;
	CGColorSpaceRef colorSpace;
	void *          bitmapData;
	int             bitmapByteCount;
	int             bitmapBytesPerRow;
    
	// Get image width, height. We'll use the entire image.
	size_t pixelsWide = CGImageGetWidth(inImage);
	size_t pixelsHigh = CGImageGetHeight(inImage);
    
	// Declare the number of bytes per row. Each pixel in the bitmap in this
	// example is represented by 4 bytes; 8 bits each of red, green, blue, and
	// alpha.
	bitmapBytesPerRow   = (pixelsWide * 4);
	bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
	// Use the generic RGB color space.
//	colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
     colorSpace = CGColorSpaceCreateDeviceRGB();
	if (colorSpace == NULL)
	{
		fprintf(stderr, "Error allocating color space\n");
		return NULL;
	}
    
	// Allocate memory for image data. This is the destination in memory
	// where any drawing to the bitmap context will be rendered.
	bitmapData = malloc( bitmapByteCount );
	if (bitmapData == NULL)
	{
		fprintf (stderr, "Memory not allocated!");
		CGColorSpaceRelease( colorSpace );
		return NULL;
	}
    
	// Create the bitmap context. We want pre-multiplied ARGB, 8-bits
	// per component. Regardless of what the source image format is
	// (CMYK, Grayscale, and so on) it will be converted over to the format
	// specified here by CGBitmapContextCreate.
	context = CGBitmapContextCreate (bitmapData,
									 pixelsWide,
									 pixelsHigh,
									 8,      // bits per component
									 bitmapBytesPerRow,
									 colorSpace,
									 kCGImageAlphaPremultipliedFirst);
	if (context == NULL)
	{
		free (bitmapData);
		fprintf (stderr, "Context not created!");
	}
    
	// Make sure and release colorspace before returning
	CGColorSpaceRelease( colorSpace );
    
	return context;
}




@end
