From: Jason Stubbs <jasonbstubbs@gmail.com>
Subject: [PATCH] Platform: Brightness quirk for samsung laptop driver
Date: Fri, 26 Aug 2011 19:58:40 +1000
Message-ID: <4E576E50.4070500@gmail.com>
References: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com> <20110824231053.GA7697@kroah.com> <4E55C11E.8000704@gmail.com> <20110826000348.GB1314@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:61141 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754671Ab1HZJya (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Aug 2011 05:54:30 -0400
Received: by ywf7 with SMTP id 7so2637744ywf.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2011 02:54:29 -0700 (PDT)
In-Reply-To: <20110826000348.GB1314@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Jason Stubbs <jasonbstubbs@gmail.com>

On some Samsung laptops the brightness regulation works slightly different.
All SABI commands except for set_brightness work as expected. The behaviour
of set_brightness is as follows:

- Setting a new brightness will only step one level toward the new brightness
  level. For example, setting a level of 5 when the current level is 2 will
  result in a brightness level of 3.
- A spurious KEY_BRIGHTNESS_UP or KEY_BRIGHTNESS_DOWN event is also generated
  along with the change in brightness.
- Neither of the above two issues occur when changing from/to brightness
  level 0.

This patch adds detection and a non-intrusive workaround for the above issues.

Signed-off-by: Jason Stubbs <jasonbstubbs@gmail.com>

---

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index ee68c1c..b193bf0 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -226,6 +226,7 @@ static struct backlight_device *backlight_device;
 static struct mutex sabi_mutex;
 static struct platform_device *sdev;
 static struct rfkill *rfk;
+static bool has_stepping_quirk;
 
 static int force;
 module_param(force, bool, 0);
@@ -382,6 +383,17 @@ static void set_brightness(u8 user_brightness)
 {
 	u8 user_level = user_brightness + sabi_config->min_brightness;
 
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
 
@@ -390,6 +402,34 @@ static int get_brightness(struct backlight_device *bd)
 	return (int)read_brightness();
 }
 
+static void check_for_stepping_quirk(void)
+{
+	u8 initial_level = read_brightness();
+	u8 check_level;
+
+	/*
+	 * Some laptops exhibit the strange behaviour of stepping toward
+	 * (rather than setting) the brightness except when changing to/from
+	 * brightness level 0. This behaviour is checked for here and worked
+	 * around in set_brightness.
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
@@ -796,6 +836,9 @@ static int __init samsung_init(void)
 		}
 	}
 
+	/* Check for stepping quirk */
+	check_for_stepping_quirk();
+
 	/* knock up a platform device to hang stuff off of */
 	sdev = platform_device_register_simple("samsung", -1, NULL, 0);
 	if (IS_ERR(sdev))
