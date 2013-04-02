From: Jelle van der Waa <jelle@vdwaa.nl>
Subject: hp-wmi hp 8570W hardware wifi key
Date: Tue, 02 Apr 2013 15:51:58 +0200
Message-ID: <515AE27E.8050204@vdwaa.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070901080405020304070002"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:38666 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256Ab3DBNrq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Apr 2013 09:47:46 -0400
Received: by mail-ea0-f177.google.com with SMTP id q14so227867eaj.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Apr 2013 06:47:45 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------070901080405020304070002
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I recently updated my laptop's BIOS and now my hardware wifi key fails,
it doesn't disable the wifi chip anymore.
In dmesg I found an error message, which indicates a event_id changed. (
dmesg.txt )

I tried to fix the issue by patching hp_wmi.c, to match the new event_id
which seems to be 8, but I couldn't get it working. (
hp_wmi_wireless_event_id_changed.patch ).

I'm willing to test patches and I will try to test if the issues occurs
with the recent rc release of linux.

--------------070901080405020304070002
Content-Type: text/plain; charset=UTF-8;
 name="dmesg.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg.txt"

[89172.325510] hp_wmi: Unknown event_id - 8 - 0x2
[89174.314755] atkbd serio0: Unknown key pressed (translated set 2, code 0xf8 on isa0060/serio0).
[89174.314763] atkbd serio0: Use 'setkeycodes e078 <keycode>' to make it known.
[89174.495251] atkbd serio0: Unknown key released (translated set 2, code 0xf8 on isa0060/serio0).
[89174.495259] atkbd serio0: Use 'setkeycodes e078 <keycode>' to make it known.

--------------070901080405020304070002
Content-Type: text/x-patch;
 name="hp_wmi_wireless_event_id_changed.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hp_wmi_wireless_event_id_changed.patch"

diff -aur linux-3.9-rc6/drivers/platform/x86/hp-wmi.c linux-3.9-rc5/drivers/platform/x86/hp-wmi.c
--- linux-3.9-rc6/drivers/platform/x86/hp-wmi.c	2013-04-02 14:50:59.674132120 +0200
+++ linux-3.9-rc5/drivers/platform/x86/hp-wmi.c	2013-04-02 14:55:51.484149029 +0200
@@ -71,6 +71,7 @@
 	HPWMI_WIRELESS = 5,
 	HPWMI_CPU_BATTERY_THROTTLE = 6,
 	HPWMI_LOCK_SWITCH = 7,
+	HPWMI_WIRELESS_NEW = 8,
 };
 
 struct bios_args {
@@ -509,7 +510,7 @@
 						key_code, 1, true))
 			pr_info("Unknown key code - 0x%x\n", key_code);
 		break;
-	case HPWMI_WIRELESS:
+	case HPWMI_WIRELESS: case HPWMI_WIRELESS_NEW:
 		if (rfkill2_count) {
 			hp_wmi_rfkill2_refresh();
 			break;

--------------070901080405020304070002--
