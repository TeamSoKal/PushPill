// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.1 clang-703.0.29)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSData;

SWIFT_CLASS("_TtC8PushPill11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)application:(UIApplication * _Nonnull)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData * _Nonnull)deviceToken;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC8PushPill27DoctorAccountViewController")
@interface DoctorAccountViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified emailLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)getDoctor;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill25DoctorAlertViewController")
@interface DoctorAlertViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class NSIndexPath;
@class UITableViewCell;

SWIFT_CLASS("_TtC8PushPill34DoctorAlramListTableViewController")
@interface DoctorAlramListTableViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified tableView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill24DoctorMainViewController")
@interface DoctorMainViewController : UITabBarController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UISearchBar;
@class UIStoryboardSegue;

SWIFT_CLASS("_TtC8PushPill30DoctorPatientAddViewController")
@interface DoctorPatientAddViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UIBarPositioningDelegate, UISearchBarDelegate>
@property (nonatomic, strong) IBOutlet UISearchBar * _Null_unspecified searchBar;
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified tableView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)fetchPatients;
- (IBAction)cancel;
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill31DoctorPatientListViewController")
@interface DoctorPatientListViewController : UIViewController <UIBarPositioningDelegate, UITableViewDataSource, UISearchBarDelegate, UIScrollViewDelegate, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UISearchBar * _Null_unspecified searchBar;
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified tableView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)fetchPatients;
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWebView;

SWIFT_CLASS("_TtC8PushPill27DoctorPillAddViewController")
@interface DoctorPillAddViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIWebView * _Null_unspecified webView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (IBAction)cancel;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill30DoctorPillDetailViewController")
@interface DoctorPillDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified numberLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified daysOfWeekLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified notesLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)getPill;
- (IBAction)removePill;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UICollectionView;
@class UICollectionViewCell;

SWIFT_CLASS("_TtC8PushPill28DoctorPillListViewController")
@interface DoctorPillListViewController : UIViewController <UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) IBOutlet UICollectionView * _Null_unspecified morningCollectionView;
@property (nonatomic, strong) IBOutlet UICollectionView * _Null_unspecified lunchCollectionView;
@property (nonatomic, strong) IBOutlet UICollectionView * _Null_unspecified dinnerCollectionView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)getPatient;
- (IBAction)removePatient;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView * _Nonnull)collectionView;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill30DoctorPillModifyViewController")
@interface DoctorPillModifyViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIWebView * _Null_unspecified webView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (IBAction)cancel;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextField;
@class UIButton;

SWIFT_CLASS("_TtC8PushPill26DoctorSigninViewController")
@interface DoctorSigninViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified emailTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified passwordTextField;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified signinButton;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified patientButton;
- (void)viewDidLoad;
- (IBAction)signinButtonTouch;
- (IBAction)patientButtonTouch;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill26DoctorSignupViewController")
@interface DoctorSignupViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified emailTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified passwordTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified passwordConfirmTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified nameTextField;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified signupButton;
- (void)viewDidLoad;
- (IBAction)signup;
- (IBAction)cancel;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill31PatientPillDetailViewController")
@interface PatientPillDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified numberLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified daysOfWeekLabel;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified notesLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)getPill;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill29PatientPillListViewController")
@interface PatientPillListViewController : UIViewController
@property (nonatomic, strong) IBOutlet UICollectionView * _Null_unspecified morningCollectionView;
@property (nonatomic, strong) IBOutlet UICollectionView * _Null_unspecified lunchCollectionView;
@property (nonatomic, strong) IBOutlet UICollectionView * _Null_unspecified dinnerCollectionView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)getPatient;
- (IBAction)logout;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView * _Nonnull)collectionView;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill20SigninViewController")
@interface SigninViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified emailTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified passwordTextField;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified signinButton;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified doctorButton;
- (void)viewDidLoad;
- (IBAction)signinButtonTouch;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8PushPill20SignupViewController")
@interface SignupViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified emailTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified passwordTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified passwordConfirmTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified nameTextField;
@property (nonatomic, strong) IBOutlet UITextField * _Null_unspecified ageTextField;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified signupButton;
- (void)viewDidLoad;
- (IBAction)signup;
- (IBAction)cancel;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
