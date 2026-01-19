// ignore_for_file: constant_identifier_names

//App State
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const APPNAME = "Sonus Music Player";


const USERKEY = 'userkey';


final screenWidth = MediaQuery.of(Get.context!).size.width;
final orientation = MediaQuery.of(Get.context!).orientation;

// Determine layouts
final isTablet = screenWidth >= 768; // Tablet breakpoint
// final isLandscape = orientation == Orientation.landscape;
// final isTabletLandscape = isTablet && isLandscape;
// final isPhoneLandscape = !isTablet && isLandscape;

// Notifications
const CHANNELKEY = 'basic_channel';
const CHANNELNAME = 'Basic Notifications';
const CHANNELDESCRIPTION = 'Notification channel for basic notifications';
