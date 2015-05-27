From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 3/3] Capture cable events created by Alienware GFX Amplifier.
Date: Wed, 27 May 2015 14:37:02 -0500
Message-ID: <1432755422-26024-4-git-send-email-mario_limonciello@dell.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from AUSXIPPS310.us.dell.com ([143.166.148.211]:17902 "EHLO
	ausxipps310.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753009AbbE0Tir (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 May 2015 15:38:47 -0400
In-Reply-To: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

These events are outputted via the keyboard controller.
Right now the only actionable event is to restart the system
if the cable is removed,  but the others are documented in
case they will be bubbled up to other parts of the kernel or
userspace later on.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/Kconfig         |  1 +
 drivers/platform/x86/alienware-wmi.c | 45 ++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f9f205c..8a7bd7c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -60,6 +60,7 @@ config ALIENWARE_WMI
 	depends on LEDS_CLASS
 	depends on NEW_LEDS
 	depends on ACPI_WMI
+	depends on SERIO_I8042
 	---help---
 	 This is a driver for controlling Alienware BIOS driven
 	 features.  It exposes an interface for controlling the AlienFX
diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 5bd8faf..ffccbd9 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -23,6 +23,8 @@
 #include <linux/dmi.h>
 #include <linux/acpi.h>
 #include <linux/leds.h>
+#include <linux/i8042.h>
+#include <linux/reboot.h>
 
 #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
 #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
@@ -650,6 +652,44 @@ error_create_amplifier:
 	return ret;
 }
 
+static bool alienware_i8042_filter(unsigned char data, unsigned char str,
+			struct serio *port)
+{
+	static bool extended;
+
+	if (str & I8042_STR_AUXDATA)
+		return false;
+
+	if (unlikely(data == 0xe0)) {
+		extended = true;
+		return false;
+	} else if (unlikely(extended)) {
+		switch (data) {
+		/*Connect */
+		case 0x3F:
+			pr_debug("Received connect event\n");
+			break;
+		/* Disconnect by hotkey */
+		case 0x40:
+			pr_debug("Received disconnect hotkey event\n");
+			break;
+		/*disconnect by cable undock button */
+		case 0x41:
+			pr_debug("Received disconnect button event\n");
+			break;
+		/* surprise disconnect */
+		case 0x42:
+			pr_crit("Graphics amplifier removed, initiating reboot.\n");
+			emergency_restart();
+			break;
+		}
+		extended = false;
+	}
+
+	return false;
+}
+
+
 static int __init alienware_wmi_init(void)
 {
 	int ret;
@@ -689,6 +729,9 @@ static int __init alienware_wmi_init(void)
 		ret = create_amplifier(platform_device);
 		if (ret)
 			goto fail_prep_amplifier;
+		ret = i8042_install_filter(alienware_i8042_filter);
+		if (ret)
+			goto fail_prep_i8042;
 	}
 
 	ret = alienware_zone_init(platform_device);
@@ -699,6 +742,7 @@ static int __init alienware_wmi_init(void)
 
 fail_prep_zones:
 	alienware_zone_exit(platform_device);
+fail_prep_i8042:
 fail_prep_amplifier:
 fail_prep_hdmi:
 	platform_device_del(platform_device);
@@ -715,6 +759,7 @@ module_init(alienware_wmi_init);
 static void __exit alienware_wmi_exit(void)
 {
 	if (platform_device) {
+		i8042_remove_filter(alienware_i8042_filter);
 		alienware_zone_exit(platform_device);
 		remove_hdmi(platform_device);
 		platform_device_unregister(platform_device);
-- 
1.9.1
