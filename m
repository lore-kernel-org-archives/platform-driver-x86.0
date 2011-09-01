From: gregkh@suse.de
Subject: [patch 4/8] platform: samsung_laptop: fix samsung brightness min/max calculations
Date: Thu, 01 Sep 2011 15:50:06 -0700
Message-ID: <20110901225331.004899394@clark.kroah.org>
References: <20110901225401.GA26870@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110901225401.GA26870@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, Greg KH <greg@kroah.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Stubbs <jasonbstubbs@gmail.com>, stable <stable@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Jason Stubbs <jasonbstubbs@gmail.com>

The min_brightness value of the sabi_config is incorrectly used in brightness
calculations. For the config where min_brightness = 1 and max_brightness = 8,
the user visible range should be 0 to 7 with hardware being set in the range
of 1 to 8. What is actually happening is that the user visible range is 0 to
8 with hardware being set in the range of -1 to 7.

This patch fixes the above issue as well as a miscalculation that would occur
in the case of min_brightness > 1.

Signed-off-by: Jason Stubbs <jasonbstubbs@gmail.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/platform/x86/samsung-laptop.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -370,15 +370,17 @@ static u8 read_brightness(void)
 				  &sretval);
 	if (!retval) {
 		user_brightness = sretval.retval[0];
-		if (user_brightness != 0)
+		if (user_brightness > sabi_config->min_brightness)
 			user_brightness -= sabi_config->min_brightness;
+		else
+			user_brightness = 0;
 	}
 	return user_brightness;
 }
 
 static void set_brightness(u8 user_brightness)
 {
-	u8 user_level = user_brightness - sabi_config->min_brightness;
+	u8 user_level = user_brightness + sabi_config->min_brightness;
 
 	sabi_set_command(sabi_config->commands.set_brightness, user_level);
 }
@@ -829,7 +831,8 @@ static int __init samsung_init(void)
 	/* create a backlight device to talk to this one */
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_PLATFORM;
-	props.max_brightness = sabi_config->max_brightness;
+	props.max_brightness = sabi_config->max_brightness -
+				sabi_config->min_brightness;
 	backlight_device = backlight_device_register("samsung", &sdev->dev,
 						     NULL, &backlight_ops,
 						     &props);
