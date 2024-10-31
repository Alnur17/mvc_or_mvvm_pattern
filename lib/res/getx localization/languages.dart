import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          'password_hint': 'Enter password',
          'internet_exception':
              'We are unable to show results. \nPlease check your connection.',
          'general_exception':
              'We are unable to process your request. \nPlease try again.',
          'welcome_back': 'Welcome Back',
          'login': 'Login',
          'register': 'Register',
          'success': 'Request Success',
          'something_wrong': 'Something went wrong',
        },
        'bn_BD': {
          'email_hint': 'ই-মেইল লিখুন',
          'password_hint': 'পাসওয়ার্ড লিখুন',
          'internet_exception':
              'আমরা ফলাফল দেখাতে অক্ষম। \nঅনুগ্রহ করে আপনার সংযোগ পরীক্ষা করুন।',
          'general_exception':
              'আমরা আপনার অনুরোধ প্রক্রিয়া করতে অক্ষম। \nঅনুগ্রহ করে আবার চেষ্টা করুন।',
          'welcome_back': 'আবার স্বাগতম',
          'login': 'লগইন',
          'register': 'রেজিস্টার',
          'success': 'অনুরোধ সফল হয়েছে',
          'something_wrong': 'কিছু ভুল হয়েছে',
        },
        'ur_PK': {
          'email_hint': 'ای میل درج کریں',
          'password_hint': 'پاس ورڈ درج کریں',
          'internet_exception':
              'ہم نتائج دکھانے سے قاصر ہیں۔ \nبراہ کرم اپنے کنکشن کو چیک کریں۔',
          'general_exception':
              'ہم آپ کی درخواست کو پروسیس کرنے سے قاصر ہیں۔ \nبراہ کرم دوبارہ کوشش کریں۔',
          'welcome_back': 'خوش آمدید',
          'login': 'لاگ ان',
          'register': 'رجسٹر کریں',
          'success': 'درخواست کامیاب',
          'something_wrong': 'کچھ غلط ہوگیا',
        }
      };
}
