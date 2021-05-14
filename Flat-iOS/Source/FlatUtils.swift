//
//  FlatUtils.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/13.
//

import UIKit

// iPad
let iPhoneDevice = (UIDevice.current.userInterfaceIdiom == .phone)
let iPadDevice = (UIDevice.current.userInterfaceIdiom == .pad)

/// 实际屏幕宽度
let IOS_WIDTH = UIScreen.main.bounds.width
/// 实际屏幕高度
let IOS_HEIGHT = UIScreen.main.bounds.height
/// 屏幕显示宽度，iPad 上为实际屏幕宽度的0.64
let SCREEN_WIDTH: CGFloat = {
    if iPadDevice {
        return IOS_WIDTH * 0.64
    } else {
        return IOS_WIDTH
    }
}()

/// 屏幕像素比例
let IOS_SCALE = UIScreen.main.scale

// iPhone设备
let TTiPhoneX = IOS_WIDTH == 375 && IOS_HEIGHT == 812 //适用于 X、XS、11Pro
let TTiPhoneXR = IOS_WIDTH == 414 && IOS_HEIGHT == 896 //适用于 XR 、 11Pro Max 、 XS Max / 11
let TTiPhonePlus = IOS_WIDTH == 414 && IOS_HEIGHT == 736 //适用于各plus机型6plus、7plus、8plus
let TTiPhoneTinySize = IOS_WIDTH == 375 && IOS_HEIGHT == 667 //适用于各小机型 6、6s、7、8
let TTiPhoneXMax = TTiPhoneXR //
let iPhoneX = (TTiPhoneX || TTiPhoneXMax)

// 状态栏高度，iPhone X 是44，其他是20
let STATUSBAR_HEIGHT = UIApplication.shared.statusBarFrame.size.height
let HOTSPOT_HEIGHT = CGFloat(iPhoneX ? 0.0 : 20.0)
// 导航栏高度
let NAVIBAR_HEIGHT = CGFloat(44.0)
// 状态栏+导航栏高度，iPhone X 是88，其他是64
let TOP_HEIGHT = (STATUSBAR_HEIGHT + NAVIBAR_HEIGHT)
// 底部横条高度
let HOMEINDICATOR_HEIGHT = CGFloat(iPhoneX ? 34.0 : 0.0)
let TAB_HEIGHT = (HOMEINDICATOR_HEIGHT + 49.0)
