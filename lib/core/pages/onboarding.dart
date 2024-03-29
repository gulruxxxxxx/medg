import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medg/assets/images.dart';
import 'package:medg/features/authentication/presentation/pages/login_page.dart';

import '../../assets/colors.dart';


class OnboardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset("assets/images/blueB.svg"),
          ),
          Center(child: SvgPicture.asset(AppImages.onboarding1)),
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
               ///
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          // Main content
          Positioned(
            top: 520,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mutaxasislardan maslahat',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onboardingMain,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Find a doctor who will take the best care of your health...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onboardingExtra,
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  width: double.maxFinite,
                  child: MaterialButton(
                    color: AppColors.buttonColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingPage2(),
                        ),
                      );
                    },
                    child: Text('Davom etish',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset("assets/images/redB.svg"),
          ),
          Center(child: SvgPicture.asset(AppImages.onboarding2)),
          Positioned(
            top: 500,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Rejalashtirilgan davolanish tartibi',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onboardingExtra,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Set up a reminder to take the medicine on time...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onboardingExtra,
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  width: double.maxFinite,
                  child: MaterialButton(
                    color: AppColors.buttonColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingPage3(),
                        ),
                      );
                    },
                    child: Text('Davom etish',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class OnboardingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset("assets/images/blackB.svg"),
          ),
          Center(child: SvgPicture.asset(AppImages.onboarding3)),
          Positioned(
            top: 520,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Order Medicine Online',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onBoardingMain2,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Order your medicine that your doctor provided you...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onboardingExtra,
                  ),
                ),
                SizedBox(height: 100),
                Container(
                  width: double.maxFinite,
                  child: MaterialButton(
                    color: AppColors.buttonColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text("Asosiyga o'tish",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
