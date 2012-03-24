From: Jens Taprogge <jens.taprogge@taprogge.org>
Subject: [PATCH] [thinkpad_acpi] Correctly inform userspace about max
 brightness.
Date: Sat, 24 Mar 2012 16:04:57 +0100
Message-ID: <20120324150457.GA27321@endeavour.taprogge.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shamrock.taprogge.org ([213.146.117.139]:36639 "EHLO
	shamrock.taprogge.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000Ab2CXPFF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 24 Mar 2012 11:05:05 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org

Since thinkpad_acpi (currently?) only supports switching the leds on or
off, we should inform userspace about that.  Currently 256 brightness
levels are reported by userspace.

Please apply.
---
 drivers/platform/x86/thinkpad_acpi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index a0bc79f..cb549d0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4827,6 +4827,7 @@ static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
 static struct tpacpi_led_classdev tpacpi_led_thinklight = {
 	.led_classdev = {
 		.name		= "tpacpi::thinklight",
+		.max_brightness = 1,
 		.brightness_set	= &light_sysfs_set,
 		.brightness_get	= &light_sysfs_get,
 	}
@@ -5232,6 +5233,7 @@ static int __init tpacpi_init_led(unsigned int led)
 	if (!tpacpi_led_names[led])
 		return 0;
 
+	tpacpi_leds[led].led_classdev.max_brightness = 1;
 	tpacpi_leds[led].led_classdev.brightness_set = &led_sysfs_set;
 	tpacpi_leds[led].led_classdev.blink_set = &led_sysfs_blink_set;
 	if (led_supported == TPACPI_LED_570)
-- 
1.7.5.4
