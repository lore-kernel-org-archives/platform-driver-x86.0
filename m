From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] sony-laptop: do not scribble keyboard backlight registers on resume
Date: Tue, 26 Nov 2013 07:43:50 +0900
Message-ID: <1385419430-4817-1-git-send-email-malattia@linux.it>
References: <52933DFD.8060206@babioch.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:57172 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751964Ab3KYWoL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Nov 2013 17:44:11 -0500
In-Reply-To: <52933DFD.8060206@babioch.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, stable@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

Follow-up to 294d31e8227c9892a89d6b3e58d17886b79ea4e6: avoid messing up
the state on resume. Leave it to what was before suspending as it's
anyway likely that we still don't know what value we should write to the
EC registers.
This fix is also required in 3.12

Cc: stable@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Tested-by: Karol Babioch <karol@babioch.de>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 8d80f2c..921b2a9 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -140,7 +140,6 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
 		 "on the model (default: no change from current value)");
 
 #ifdef CONFIG_PM_SLEEP
-static void sony_nc_kbd_backlight_resume(void);
 static void sony_nc_thermal_resume(void);
 #endif
 static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
@@ -1487,13 +1486,6 @@ static void sony_nc_function_resume(void)
 		case 0x0135:
 			sony_nc_rfkill_update();
 			break;
-		case 0x0137:
-		case 0x0143:
-		case 0x014b:
-		case 0x014c:
-		case 0x0163:
-			sony_nc_kbd_backlight_resume();
-			break;
 		default:
 			continue;
 		}
@@ -1902,25 +1894,6 @@ static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd,
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
-static void sony_nc_kbd_backlight_resume(void)
-{
-	int ignore = 0;
-
-	if (!kbdbl_ctl)
-		return;
-
-	if (kbdbl_ctl->mode == 0)
-		sony_call_snc_handle(kbdbl_ctl->handle, kbdbl_ctl->base,
-				&ignore);
-
-	if (kbdbl_ctl->timeout != 0)
-		sony_call_snc_handle(kbdbl_ctl->handle,
-				(kbdbl_ctl->base + 0x200) |
-				(kbdbl_ctl->timeout << 0x10), &ignore);
-}
-#endif
-
 struct battery_care_control {
 	struct device_attribute attrs[2];
 	unsigned int handle;
-- 
1.8.4.4
