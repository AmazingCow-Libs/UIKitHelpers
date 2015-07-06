

#if N2OBOYZ_PROJECT_USES_XLFORM

#import "XLForm.h"

//Constants
#define N2O_XL_UNUSEDTAG @"kUnusedTag"

//THIS MACROS ARE INTENTED TO EASE THE CREATION OF THE ROWS AND SECTIONS IN
//XLFORM SINCE OBJC IS TOO MUCH VERBOSE, EACH TYPE OF ROW CREATED IN THE APPLICTION
//HAS AN MACRO DEFINED HERE.
//Form
#define N2O_XL_CREATE_FORM() [XLFormDescriptor form]
#define N2O_XL_CREATE_FORM_NAME(_name_) [XLFormDescriptor formDescriptorWithTitle:_name_]

//Section
#define N2O_XL_CREATE_SECTION_NAME(_title_) [XLFormSectionDescriptor formSectionWithTitle:_title_]
#define N2O_XL_CREATE_SECTION() [XLFormSectionDescriptor formSection]

//General Row creation.
#define N2O_XL_CREATE_ROW(_tag_, _rowType_, _title_) \
    [XLFormRowDescriptor formRowDescriptorWithTag:(_tag_)     \
                                          rowType:(_rowType_) \
                                            title:(_title_)]
//Text Row.
#define N2O_XL_CREATE_TEXT_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeText, (_title_))
//Email Row.
#define N2O_XL_CREATE_EMAIL_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeEmail, (_title_))
//Password Row.
#define N2O_XL_CREATE_PASSWORD_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypePassword, (_title_))
//Date Row.
#define N2O_XL_CREATE_DATE_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeDateInline, (_title_))
//Number Row.
#define N2O_XL_CREATE_NUMBER_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeNumber, (_title_))
//Push Row.
#define N2O_XL_CREATE_PUSH_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeSelectorPush, (_title_))
//Info Row.
#define N2O_XL_CREATE_INFO_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeInfo, (_title_))
//Button Row.
#define N2O_XL_CREATE_BUTTON_ROW(_tag_, _title_)\
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeButton, (_title_))
//PickerInline Row.
#define N2O_XL_CREATE_PICKERINLINE_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeSelectorPickerViewInline, (_title_))
//Picker Row.
#define N2O_XL_CREATE_PICKERVIEW_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeSelectorPickerView, (_title_))
//Boolean Switch Row.
#define N2O_XL_CREATE_BOOLSWITCH_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeBooleanSwitch, (_title_))
//Boolean Switch Row.
#define N2O_XL_CREATE_BOOLCHECK_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeBooleanCheck, (_title_))
//Stepper Row.
#define N2O_XL_CREATE_STEPPER_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeStepCounter, (_title_))
//Slider Row.
#define N2O_XL_CREATE_SLIDER_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeSlider, (_title_))
//ActionSheet Row.
#define N2O_XL_CREATE_ACTIONSHEET_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeSelectorActionSheet, (_title_))
//AlertView Row.
#define N2O_XL_CREATE_ALERTVIEW_ROW(_tag_, _title_) \
    N2O_XL_CREATE_ROW((_tag_), XLFormRowDescriptorTypeSelectorAlertView, (_title_))


#endif // N2OBOYZ_PROJECT_USES_XLFORM //
