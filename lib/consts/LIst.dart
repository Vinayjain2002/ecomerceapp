import 'package:emart_app/accountScreen/CuponsScreen.dart';
import 'package:emart_app/accountScreen/EditProfileScreen.dart';
import 'package:emart_app/accountScreen/HelpCenterScreen.dart';
import 'package:emart_app/accountScreen/WhilistScreen.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

import '../accountScreen/OrdersScreen.dart';

/// here in this fil we aregoing to store the valrious icons that are going to be used

const socialIconList= [icFacebookLogo, icGoogleLogo, icTwitterLogo];

// now we are going to create a list of the swipers in the HomeScreen
const homeSwiperList=[imgSlider1,imgSlider2,imgSlider3,imgSlider4];

const homeSecondSwiperList=[imgSs1,imgSs2,imgSs3,imgSs4];

// we are going to create the featured Lists
const featuredImg=[imgS1, imgS2, imgS3,imgS4,imgS5,imgS6];

const featuredTitles=[womenDress, girlsDress, girlsWatch, boyGlasses, mobilePhone, tshirts];

const categorieslist=[
   menClothing, compAccesory, automobile, kidtoys, sports, cellphone,makeup,machines,furniture,
];

const categoryImage=[imgFc1,imgFc2,imgFc3,imgFc4,imgFc5,imgFc6,imgFc7,imgFc8,imgFc9];

// this is going to be the list of the policy ofthe Detailed Items
const itemDetailedButtonList=[video, review, privacypolicy, sellerpolicy, returnpolicy];

// profile button List
const profileButtonList=[
   orders, wishlist, messages
];

const profileButtonIcon=[icOrder, icOrder,icMessages];
const accountOptionsList=["Orders", "Whilist","Cupons","Help Center","Edit Profile"];
const accountOptionsIcons = [
   Icons.sort, // Correct way to assign icons to list elements
   Icons.favorite,
   Icons.card_giftcard,
   Icons.live_help,
   Icons.edit
];

final accountOptionsActions=[OrdersScreen(),WhilistScreen(),CuponsScreen(),HelpCenterScreen(),EditProfileScreen()];
// oreder history List
var OrderHistoryImage=[imgB1,imgB10,imgFc5,imgFc4,imgFc1];