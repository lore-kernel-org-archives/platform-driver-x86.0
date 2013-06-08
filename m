From: Adam Lee <adam.lee@canonical.com>
Subject: [PATCH 1/3 v3] thinkpad_acpi: return -NODEV while operating uninitialized LEDs
Date: Sat,  8 Jun 2013 16:51:15 +0800
Message-ID: <1370681475-6601-1-git-send-email-adam.lee@canonical.com>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:56268 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751571Ab3FHIxa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 8 Jun 2013 04:53:30 -0400
Received: by mail-pa0-f49.google.com with SMTP id ld11so292994pab.36
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Jun 2013 01:53:29 -0700 (PDT)
In-Reply-To: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>, Amos Kong <kongjianjun@gmail.com>

Not all 0-15 LEDs are available for all models, sometimes it's even not
safe. This patch return -NODEV while operating uninitialized LEDs.

Signed-off-by: Adam Lee <adam.lee@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 54d31c0..455384b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -369,7 +369,7 @@ struct tpacpi_led_classdev {
 	struct led_classdev led_classdev;
 	struct work_struct work;
 	enum led_status_t new_state;
-	unsigned int led;
+	int led;
 };
 
 /* brightness level capabilities */
@@ -5344,6 +5344,8 @@ static int __init led_init(struct ibm_init_struct *iibm)
 					  ARRAY_SIZE(led_useful_qtable));
 
 	for (i = 0; i < TPACPI_LED_NUMLEDS; i++) {
+		tpacpi_leds[i].led = -1;
+
 		if (!tpacpi_is_led_restricted(i) &&
 		    test_bit(i, &useful_leds)) {
 			rc = tpacpi_init_led(i);
@@ -5401,9 +5403,13 @@ static int led_write(char *buf)
 		return -ENODEV;
 
 	while ((cmd = next_cmd(&buf))) {
-		if (sscanf(cmd, "%d", &led) != 1 || led < 0 || led > 15)
+		if (sscanf(cmd, "%d", &led) != 1)
 			return -EINVAL;
 
+		if (led < 0 || led > (TPACPI_LED_NUMLEDS - 1) ||
+				tpacpi_leds[led].led < 0)
+			return -ENODEV;
+
 		if (strstr(cmd, "off")) {
 			s = TPACPI_LED_OFF;
 		} else if (strstr(cmd, "on")) {
-- 
1.7.10.4
