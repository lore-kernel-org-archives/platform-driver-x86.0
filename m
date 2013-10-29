From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] hp-wmi: detect "2009 BIOS or later" flag by WMI 0x0d for wireless cmd
Date: Tue, 29 Oct 2013 14:57:58 +0800
Message-ID: <1383029878-25590-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:55764 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051Ab3J2G6F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Oct 2013 02:58:05 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org
Cc: Alex Hung <alex.hung@canonical.com>

Some HP BIOS has dummy WMI 0x05 cmd and it causes wireless set cmd to fail.
This patch fixes the problem by detecting "2009 BIOS or later" flag which
determines whether WMI 0x1b is supported and is used to replace WMI 0x05.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/hp-wmi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 1c86fa0..8ba8956 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -54,6 +54,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_HARDWARE_QUERY 0x4
 #define HPWMI_WIRELESS_QUERY 0x5
 #define HPWMI_HOTKEY_QUERY 0xc
+#define HPWMI_FEATURE_QUERY 0xd
 #define HPWMI_WIRELESS2_QUERY 0x1b
 #define HPWMI_POSTCODEERROR_QUERY 0x2a
 
@@ -292,6 +293,17 @@ static int hp_wmi_tablet_state(void)
 	return (state & 0x4) ? 1 : 0;
 }
 
+static int hp_wmi_bios_2009_later(void)
+{
+	int state = 0;
+	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, 0, &state,
+				       sizeof(state), sizeof(state));
+	if (ret)
+		return ret;
+
+	return (state & 0x10) ? 1 : 0;
+}
+
 static int hp_wmi_set_block(void *data, bool blocked)
 {
 	enum hp_wmi_radio r = (enum hp_wmi_radio) data;
@@ -871,7 +883,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	gps_rfkill = NULL;
 	rfkill2_count = 0;
 
-	if (hp_wmi_rfkill_setup(device))
+	if (hp_wmi_bios_2009_later() || hp_wmi_rfkill_setup(device))
 		hp_wmi_rfkill2_setup(device);
 
 	err = device_create_file(&device->dev, &dev_attr_display);
-- 
1.8.1.2
