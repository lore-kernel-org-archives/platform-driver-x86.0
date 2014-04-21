From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 07/11] driver: thinkpad_acpi: remove not necessary {} braces
Date: Mon, 21 Apr 2014 21:10:52 +0200
Message-ID: <1398107456-31080-8-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-7-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:36180 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754088AbaDUTLN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:13 -0400
Received: by mail-ee0-f46.google.com with SMTP id t10so3845365eei.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:12 -0700 (PDT)
In-Reply-To: <1398107456-31080-7-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "braces {} are not necessary for any arm of this
statement" checkpatch warning.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 940f83b..eba72e7 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5013,11 +5013,11 @@ static int light_write(char *buf)
 		return -ENODEV;
 
 	while ((cmd = next_cmd(&buf))) {
-		if (strlencmp(cmd, "on") == 0) {
+		if (strlencmp(cmd, "on") == 0)
 			newstatus = 1;
-		} else if (strlencmp(cmd, "off") == 0) {
+		else if (strlencmp(cmd, "off") == 0)
 			newstatus = 0;
-		} else
+		else
 			return -EINVAL;
 	}
 
@@ -5527,15 +5527,14 @@ static int led_write(char *buf)
 				tpacpi_leds[led].led < 0)
 			return -ENODEV;
 
-		if (strstr(cmd, "off")) {
+		if (strstr(cmd, "off"))
 			s = TPACPI_LED_OFF;
-		} else if (strstr(cmd, "on")) {
+		else if (strstr(cmd, "on"))
 			s = TPACPI_LED_ON;
-		} else if (strstr(cmd, "blink")) {
+		else if (strstr(cmd, "blink"))
 			s = TPACPI_LED_BLINK;
-		} else {
+		else
 			return -EINVAL;
-		}
 
 		rc = led_set_status(led, s);
 		if (rc < 0)
@@ -7878,11 +7877,11 @@ static ssize_t fan_pwm1_enable_show(struct device *dev,
 	if (res)
 		return res;
 
-	if (status & TP_EC_FAN_FULLSPEED) {
+	if (status & TP_EC_FAN_FULLSPEED)
 		mode = 0;
-	} else if (status & TP_EC_FAN_AUTO) {
+	else if (status & TP_EC_FAN_AUTO)
 		mode = 2;
-	} else
+	else
 		mode = 1;
 
 	return snprintf(buf, PAGE_SIZE, "%d\n", mode);
-- 
1.8.1.2
