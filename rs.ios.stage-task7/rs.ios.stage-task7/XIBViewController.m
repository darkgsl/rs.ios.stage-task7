
//добавить иконку


#import "XIBViewController.h"
#import "UIColor+HexToColor.h"

NSString *const login = @"username";
NSString *const password = @"password";
//NSString *const login = @"1";
//NSString *const password = @"1";
NSString *const securePin = @"132";

UInt32 const whiteHex = 0xFFFFFF;
UInt32 const blackCoralHex = 0x4C5C68;
UInt32 const turquoiseGreenHex = 0x91C7B1;
UInt32 const venetianRedHex = 0xC20114;
UInt32 const blackHex = 0x000000;
UInt32 const littleBoyBlueHex = 0x80A4ED;


@interface XIBViewController () <UITextFieldDelegate>


//MARK: - IBOutlet
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordlTextField;
@property (weak, nonatomic) IBOutlet UIButton *authorizeButton;
@property (weak, nonatomic) IBOutlet UIView *borderView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *pinButtons;

//MARK: - IBAction
@end

@implementation XIBViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  [self addGestureRecognizer];
  [self configUI];
  [self setDelegate];
}
// MARK: - Config UI
- (void)configUI{
  [self hideUIElements:true];
  self.loginTextField.layer.borderWidth = 1.5;
  self.loginTextField.layer.cornerRadius = 5;
  
  self.passwordlTextField.layer.borderWidth = 1.5;
  self.passwordlTextField.layer.cornerRadius = 5;
  
  self.borderView.layer.borderWidth = 2;
  self.borderView.layer.cornerRadius = 10;
  
  //buttons
  for (UIButton *button in self.pinButtons) {
    //добавить цвет tetx
    button.tintColor = [UIColor colorWithHex:littleBoyBlueHex alpha:1.0];
    button.layer.borderColor = [UIColor colorWithHex:littleBoyBlueHex alpha:1.0].CGColor;
    button.layer.borderWidth = 1.5;
    button.layer.cornerRadius = button.frame.size.height / 2 ;
    
    //actions
    //переделать селектор в отдельную переменную как раньше см уроки
    [button addTarget:self
               action:@selector(pinButtonsTapped:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [button addTarget:self
               action:@selector(buttonHighlight:)
     forControlEvents:UIControlEventTouchDown];
  }
  self.authorizeButton.layer.borderWidth = 2;
  self.authorizeButton.layer.cornerRadius = 10;
  
  [ self.authorizeButton addTarget:self
                            action:@selector(authorizeButtonPressed:)
                  forControlEvents:UIControlEventTouchUpInside];
  [ self.authorizeButton addTarget:self
                            action:@selector(authorizeButtonHighlight:)
                  forControlEvents:UIControlEventTouchDown];
  self.authorizeButton.layer.borderColor = [UIColor colorWithHex:littleBoyBlueHex alpha:1.0].CGColor;
  self.authorizeButton.backgroundColor = [UIColor colorWithHex:whiteHex alpha:1.0];
  
  // UIControlStateNormal;
  [self.authorizeButton setTitleColor:[UIColor colorWithHex:littleBoyBlueHex alpha:1.0] forState:UIControlStateNormal];
  
  //UIControlStateHighlighted
  [self.authorizeButton setTitleColor:[UIColor colorWithHex:littleBoyBlueHex alpha:0.4] forState:UIControlStateHighlighted];
  
  // UIControlStateDisabled
  [self.authorizeButton setTitleColor:[UIColor colorWithHex:littleBoyBlueHex alpha:0.5] forState:UIControlStateDisabled];
  
  UIImage *imageStateNormal = [UIImage imageNamed:@"user"];
  
  [self.authorizeButton setImage:imageStateNormal forState:UIControlStateNormal];
  
  UIImage *imageStateHighlighted = [UIImage imageNamed:@"user-filled"];
  [self.authorizeButton setImage:imageStateHighlighted forState:UIControlStateHighlighted];
  [self.authorizeButton  setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 5.0)];
  
  [self setColors];
}
- (void)setColors{
  
  self.borderView.backgroundColor = [UIColor colorWithHex:whiteHex alpha:1.0];
  self.borderView.layer.borderColor = [UIColor colorWithHex:whiteHex alpha:1.0].CGColor;
  
  self.view.backgroundColor = [UIColor colorWithHex:whiteHex alpha:1.0];
  
  self.textLabel.textColor = [UIColor colorWithHex:blackHex alpha:1.0];
  self.resultLabel.textColor = [UIColor colorWithHex:blackHex alpha:1.0];
  self.loginTextField.textColor = [UIColor colorWithHex:blackHex alpha:1.0];
  self.loginTextField.layer.borderColor = [UIColor colorWithHex:blackCoralHex alpha:1.0].CGColor;
  
  self.passwordlTextField.textColor = [UIColor colorWithHex:blackHex alpha:1.0];
  self.passwordlTextField.layer.borderColor = [UIColor colorWithHex:blackCoralHex alpha:1.0].CGColor;
}
// MARK: - Config UI. init and refresh
- (void)refresh{
  self.authorizeButton.alpha = 1;
  [self setActive:true];
  [self hideUIElements:true];
  self.resultLabel.text = @"_";
  [self setColors];
  self.loginTextField.text = @"";
  self.passwordlTextField.text = @"";
}
- (void)pwdIsOk{
  [self setActive:false];
  [self hideUIElements:false];
  
  self.loginTextField.layer.borderColor = [UIColor colorWithHex:turquoiseGreenHex alpha:0.5].CGColor;
  self.passwordlTextField.layer.borderColor = [UIColor colorWithHex:turquoiseGreenHex alpha:0.5].CGColor;
  
  self.authorizeButton.alpha = 0.5;
}
- (void)secureError{
  self.borderView.layer.borderColor = [UIColor colorWithHex:venetianRedHex alpha:1.0].CGColor;
  self.resultLabel.text = @"_";
  //self.borderView.alpha
}
- (void)setActive:(BOOL)active{
  [self.passwordlTextField setEnabled:active];
  [self.loginTextField setEnabled:active];
  [self.authorizeButton setEnabled:active];
}
- (void)hideUIElements:(BOOL)hide{
  [self.borderView setHidden:hide];
  for (UIButton *button in self.pinButtons) {
    [button setHidden:hide];
  }
}

-(void)showAlerts{
  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                                 message:@"You are successfuly authorized!"
                                                          preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * action) {
    [self refresh];
  }];
  
  [alert addAction:defaultAction];
  [self presentViewController:alert animated:YES completion:nil];
}
//MARK: - Selectors
- (void)pinButtonsTapped:(UIButton *)sender{
  sender.backgroundColor = [UIColor colorWithHex:whiteHex alpha:1.0];
  
  self.borderView.layer.borderColor = [UIColor colorWithHex:whiteHex alpha:1.0].CGColor;
  
  NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"%@%ld", self.resultLabel.text, (long)sender.tag];
  if ([str hasPrefix:@"_"]) {
    NSRange range = NSMakeRange(0, 1);
    [str deleteCharactersInRange:range];
  }
  if ([str length] > 2) {
    if ([str isEqualToString:securePin]){
      //все ок
      [self showAlerts];
    } else
      // ошибка ввода
      [self secureError];
  } else {
    self.resultLabel.text   =  str;
  }
}
- (void)buttonHighlight:(UIButton *)sender{
  sender.backgroundColor = [UIColor colorWithHex:littleBoyBlueHex alpha:0.2];
}
- (void)authorizeButtonHighlight:(UIButton *)sender{
  sender.backgroundColor = [UIColor colorWithHex:littleBoyBlueHex alpha:0.2];
}
- (void)authorizeButtonPressed:(UIButton *)sender{
  sender.backgroundColor = [UIColor colorWithHex:whiteHex alpha:1.0];
  NSString *valueFromLoginTextField = [[NSString alloc] initWithFormat:@"%@", self.loginTextField.text];
  NSString *valueFromPasswordlTextField = [[NSString alloc] initWithFormat:@"%@", self.passwordlTextField.text];
  
  if (([login isEqualToString:valueFromLoginTextField] && [password isEqualToString:valueFromPasswordlTextField])) {
    [self pwdIsOk];
    [self tap];
  }
  if (!([login isEqualToString:valueFromLoginTextField])) {
    self.loginTextField.layer.borderColor = [UIColor colorWithHex:venetianRedHex alpha:1.0].CGColor;
  }
  if (!([password isEqualToString:valueFromPasswordlTextField])) {
    self.passwordlTextField.layer.borderColor = [UIColor colorWithHex:venetianRedHex alpha:1.0].CGColor;
  }
}
- (void)tap {//:(id)sender{
  [[self view] endEditing:YES];
}

// MARK: - set delegate
- (void) setDelegate {
  self.loginTextField.delegate = self;
  self.passwordlTextField.delegate = self;
}

// MARK: - UIFieldTextDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
  if (textField.tag == 1 ) {
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet new];
    [characterSet addCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    NSCharacterSet * forbideenCharacterSet = [characterSet invertedSet];
    NSRange rangeOfSet  = [string rangeOfCharacterFromSet:forbideenCharacterSet];
    if (rangeOfSet.location == NSNotFound) {
      return true;
    } else {
      return false;
    }
  } else {
    return  true;
  }
  
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  textField.layer.borderColor = [UIColor colorWithHex:blackCoralHex alpha:1.0].CGColor;
  return true;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
  return  true;
}
//прячем клавиатуру при нажатии на return
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  
  if (textField.tag == 1) {
    BOOL isResponder  =  [self.passwordlTextField becomeFirstResponder];
    return isResponder;
  } else {
    BOOL isResponder  = [textField resignFirstResponder];
    return isResponder;
  }
}
//MARK: - UITapGestureRecognizer
//прячем клавиатуру при клике на rootview
-(void)addGestureRecognizer { UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
  [self.view addGestureRecognizer:tapRecognizer];
}
@end
