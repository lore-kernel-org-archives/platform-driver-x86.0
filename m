From: Alex Hung <alex.hung@canonical.com>
Subject: Re: hp-wmi rfkill change breaks systems
Date: Thu, 23 Jan 2014 15:25:42 +0800
Message-ID: <CAJ=jquYnfW14zHBHnY4WZDiX0jakuFVLDUQ6BnjVZQjo1hOr8g@mail.gmail.com>
References: <20140121151702.GA2566@srcf.ucam.org>
	<CAJ=jquZZcB9stcYn7cTnQZvTZkq+VZvvTTVCvA0zAOv+Yd2qbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:65173 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751167AbaAWHZm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jan 2014 02:25:42 -0500
Received: by mail-ob0-f170.google.com with SMTP id va2so1655316obc.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jan 2014 23:25:42 -0800 (PST)
In-Reply-To: <CAJ=jquZZcB9stcYn7cTnQZvTZkq+VZvvTTVCvA0zAOv+Yd2qbg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Matthew,

I reverted 997daa1bd9aca412ab97955a35b26c460c0ec7a4 and add a check in
hp_wmi_rfkill_setup as below:

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 8ba8956..65fee8a 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -54,7 +54,6 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_HARDWARE_QUERY 0x4
 #define HPWMI_WIRELESS_QUERY 0x5
 #define HPWMI_HOTKEY_QUERY 0xc
-#define HPWMI_FEATURE_QUERY 0xd
 #define HPWMI_WIRELESS2_QUERY 0x1b
 #define HPWMI_POSTCODEERROR_QUERY 0x2a

@@ -293,17 +292,6 @@ static int hp_wmi_tablet_state(void)
        return (state & 0x4) ? 1 : 0;
 }

-static int hp_wmi_bios_2009_later(void)
-{
-       int state = 0;
-       int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, 0, &state,
-                                      sizeof(state), sizeof(state));
-       if (ret)
-               return ret;
-
-       return (state & 0x10) ? 1 : 0;
-}
-
 static int hp_wmi_set_block(void *data, bool blocked)
 {
        enum hp_wmi_radio r = (enum hp_wmi_radio) data;
@@ -696,6 +684,11 @@ static int hp_wmi_rfkill_setup(struct
platform_device *device)
        if (err)
                return err;

+       err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 1,
+                                  &wireless, sizeof(wireless), 0);
+       if (err)
+               return err;
+
        if (wireless & 0x1) {
                wifi_rfkill = rfkill_alloc("hp-wifi", &device->dev,
                                           RFKILL_TYPE_WLAN,
@@ -883,7 +876,7 @@ static int __init hp_wmi_bios_setup(struct
platform_device *device)
        gps_rfkill = NULL;
        rfkill2_count = 0;

-       if (hp_wmi_bios_2009_later() || hp_wmi_rfkill_setup(device))
+       if (hp_wmi_rfkill_setup(device))
                hp_wmi_rfkill2_setup(device);

        err = device_create_file(&device->dev, &dev_attr_display);



It actually works better than 997daa1bd9aca412ab97955a35b26c460c0ec7a4
on new systems, but I don't have old hp systems for testing good HP
WMI 0x05 Set command.

Any suggestions are appreciated.
