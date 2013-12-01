//
//  APViewController.m
//
//  Created by Alberto Pasca on 06/03/11.
//  Copyright (c) 2011 albertopasca.it. All rights reserved.
//

#import "APViewController.h"
#import "NSString+Levenshtein.h"

@implementation APViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];

  NSString *Astr = @"Milano (MI) - Via Francesco Ardissione";
  NSString *Bstr = @"Milano, Via Francesco Ardissione";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milano";
  Bstr = @"Mialno";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milano (MI) - Via Frances...";
  Bstr = @"Milano (MI) - Via Ard...";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"pasca";
  Bstr = @"pasca";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milano";
  Bstr = @"Torino";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milano";
  Bstr = @"Qwerty";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milano";
  Bstr = @"1234567";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"alberto";
  Bstr = @"albreto";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"alberto pasca";
  Bstr = @"albero pasta";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milano - Via Francesca";
  Bstr = @"Milano (MI) - Via Franco";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milano - Via Franco";
  Bstr = @"Milano (MI) - Via Francesca";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milazzo - 68, Via Francia";
  Bstr = @"Milano (MI) - Via Francia, 68";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Milazzo - Via Franco";
  Bstr = @"Milano (MI) - Via Francesca";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

  Astr = @"Torino (Italia) via Pollenzo 41";
  Bstr = @"Torino (TO) - Via Pollenzo, 41";
  NSLog(@"%.2f", [Astr compareWithString:Bstr]);

}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
