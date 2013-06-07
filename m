From: Adam Lee <adam.lee@canonical.com>
Subject: [PATCH 1/3] thinkpad_acpi: return -NODEV while operating uninitialized LEDs
Date: Fri,  7 Jun 2013 16:20:07 +0800
Message-ID: <1370593209-21358-2-git-send-email-adam.lee@canonical.com>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>
List-Id: platform-driver-x86.vger.kernel.org

Not all 0-15 LEDs are available for all models, sometimes it's even not
safe. This patch return -NODEV while operating uninitialized LEDs.

Signed-off-by: Adam Lee <adam.lee@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 54d31c0..bea57ae 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5401,9 +5401,12 @@ static int led_write(char *buf)
 		return -ENODEV;
 
 	while ((cmd = next_cmd(&buf))) {
-		if (sscanf(cmd, "%d", &led) != 1 || led < 0 || led > 15)
+		if (sscanf(cmd, "%d", &led) != 1)
 			return -EINVAL;
 
+		if (!tpacpi_leds[led].led)
+			return -ENODEV;
+
 		if (strstr(cmd, "off")) {
 			s = TPACPI_LED_OFF;
 		} else if (strstr(cmd, "on")) {
-- 
1.7.10.4
