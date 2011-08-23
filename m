From: David Herrmann <dh.herrmann@googlemail.com>
Subject: [PATCH] Platform: Brightness quirk for samsung laptop driver
Date: Tue, 23 Aug 2011 18:05:27 +0200
Message-ID: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:49223 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751959Ab1HWQFX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Aug 2011 12:05:23 -0400
Received: by fxh19 with SMTP id 19so344354fxh.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2011 09:05:22 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dh.herrmann@googlemail.com, mjg@redhat.com, greg@kroah.com, jasonbstubbs@gmail.com

From: Jason Stubbs <jasonbstubbs@gmail.com>

On some samsung laptops the brightness regulation works slightly different.
All SABI commands except for set_brightness work as expected. The behaviour
of set_brightness is as follows:

- Setting a new brightness will only step one level toward the new brightness
  level. For example, setting a level of 5 when the current level is 2 will
  result in a brightness level of 3.
- A spurious KEY_BRIGHTNESS_UP or KEY_BRIGHTNESS_DOWN event is also generated
  along with the change in brightness.
- Neither of the above two issues occur when changing from/to brightness level 0.

This patch adds detection and a non-intrusive workaround for the above issues.

Signed-off-by: David Herrmann <dh.herrmann@googlemail.com>
---
Hi

This patch is originally from Jason Stubbs. See here:
http://git.kernel.org/?p=linux/kernel/git/gregkh/patches.git;a=blob;f=platform-samsung_laptop-add-support-for-samsung-nc210-nc110.patch;hb=HEAD

I just wanted to ask whether there is some work going on here? My laptop model
needs this fix and I reviewed and tested it and it works fine. It would be nice
to see this upstream.

I removed the NC210/NC120 device addition as it is not part of this change. This
might be added in a separate patch.

My laptop is detected as "N150P/N210P/N220P" and needs this quirk, too. I
reviewed and tested it and it works fine.

As it was signed-off earlier and released as GPL, I thought I'd just resubmit
the patch. However, its not from me so a signed-off by Jason Stubbs would be
nice again.

Regards
David

 drivers/platform/x86/samsung-laptop.c |   43 +++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index d347116..4cceb60 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -226,6 +226,7 @@ static struct backlight_device *backlight_device;
 static struct mutex sabi_mutex;
 static struct platform_device *sdev;
 static struct rfkill *rfk;
+static bool has_stepping_quirk;
 
 static int force;
 module_param(force, bool, 0);
@@ -380,6 +381,17 @@ static void set_brightness(u8 user_brightness)
 {
 	u8 user_level = user_brightness - sabi_config->min_brightness;
 
+	if (has_stepping_quirk && user_level != 0) {
+		/*
+		 * short circuit if the specified level is what's already set
+		 * to prevent the screen from flickering needlessly
+		 */
+		if (user_brightness == read_brightness())
+			return;
+
+		sabi_set_command(sabi_config->commands.set_brightness, 0);
+	}
+
 	sabi_set_command(sabi_config->commands.set_brightness, user_level);
 }
 
@@ -388,6 +400,34 @@ static int get_brightness(struct backlight_device *bd)
 	return (int)read_brightness();
 }
 
+static void check_for_stepping_quirk(void)
+{
+	u8 initial_level = read_brightness();
+	u8 check_level;
+
+	/*
+	 * Some laptops (nc210/nc110 at the very least) exhibit the strange
+	 * behaviour of stepping toward rather than setting the brightness
+	 * except when changing to/from brightness level 0. This behaviour
+	 * is checked for here and worked around in set_brightness.
+	 */
+
+	if (initial_level <= 2)
+		check_level = initial_level + 2;
+	else
+		check_level = initial_level - 2;
+
+	has_stepping_quirk = false;
+	set_brightness(check_level);
+
+	if (read_brightness() != check_level) {
+		has_stepping_quirk = true;
+		pr_info("enabled workaround for brightness stepping quirk\n");
+	}
+
+	set_brightness(initial_level);
+}
+
 static int update_status(struct backlight_device *bd)
 {
 	set_brightness(bd->props.brightness);
@@ -774,6 +814,9 @@ static int __init samsung_init(void)
 		}
 	}
 
+	/* Check for stepping quirk */
+	check_for_stepping_quirk();
+
 	/* knock up a platform device to hang stuff off of */
 	sdev = platform_device_register_simple("samsung", -1, NULL, 0);
 	if (IS_ERR(sdev))
-- 
1.7.6
