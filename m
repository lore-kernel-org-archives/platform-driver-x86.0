From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony_laptop: Default values for keyboard backlight
Date: Sat, 23 Nov 2013 07:11:56 +0900
Message-ID: <20131122221156.GA8993@taihen.jp>
References: <5289F067.40201@babioch.de>
 <20131118223008.GA4397@taihen.jp>
 <528E91A6.1070403@babioch.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:34157 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755311Ab3KVWL4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Nov 2013 17:11:56 -0500
Content-Disposition: inline
In-Reply-To: <528E91A6.1070403@babioch.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Karol Babioch <karol@babioch.de>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Nov 22, 2013 at 12:05:10AM +0100, Karol Babioch wrote:
> Hi,
> 
> Am 18.11.2013 23:30, schrieb Mattia Dongili:
> > I guess this is not the case on your
> > machine. If you don't load sony-laptop module you still have the 10
> > seconds timeout that you see in the BIOS? Only _after_ you load the
> > module the backlight never goes off?
> 
> After playing around with this for a while I think that I narrowed the
> issue down (or at least one aspect of it):
> 
> So when actually rebooting and/or powering up the device for the first
> time, it works just fine by default without setting any module
> parameters explicitly. The keyboard backlight is enabled and the timeout
> is set to 10 seconds, which is the default.
> 
> But as soon as I suspend the machine it absolutely makes a difference
> whether or not the module parameter is set. When it is not set
> explicitly (sysfs interface reporting "-1") the keyboard backlight will
> stay on from the moment I resume the machine and press a button. When
> the module parameters are set explicitly it works just fine and as
> expected.

Ha! good catch, I missed this bit in the patch that you already
identified. Can you apply it and see if it makes a difference?

commit 0d72d73e594828381d8ea0291bffa5770fe020a2
Author: Mattia Dongili <malattia@linux.it>
Date:   Sat Nov 23 06:55:40 2013 +0900

    sony-laptop: do not poke the keyboard backlight on resume
    
    Follow-up to 294d31e8227c9892a89d6b3e58d17886b79ea4e6, avoid messing up
    the state on resume leaving it to what was before suspending as it's
    likely that we don't know what value we should write to the EC
    registers.
    
    Signed-off-by: Mattia Dongili <malattia@linux.it>

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
mattia
:wq!
