From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 10/10] eeepc-wmi: never load if legacy device is enabled
Date: Mon, 29 Nov 2010 08:14:14 +0100
Message-ID: <1291014854-17961-11-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:37371 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076Ab0K2HPX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:23 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 49F84862B2
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:22 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

If legacy device (SB.ATKD - ASUS010) used by eeepc-laptop
is enabled, don't allow eeepc-wmi to load because:
- eeepc-laptop may be loaded, and can conflict with
  eeepc-wmi (they both try to register eeepc::touchpad
  led for example).
- the WMI interface is inteded to be used when the OS is
  not detected as Win 7. And when this is the case, the
  ASUS010 device is disabled.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 52274e2..4d38f98 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -49,6 +49,8 @@ MODULE_AUTHOR("Yong Wang <yong.y.wang@intel.com>");
 MODULE_DESCRIPTION("Eee PC WMI Hotkey Driver");
 MODULE_LICENSE("GPL");
 
+#define EEEPC_ACPI_HID		"ASUS010" /* old _HID used in eeepc-laptop */
+
 #define EEEPC_WMI_EVENT_GUID	"ABBC0F72-8EA1-11D1-00A0-C90629100000"
 #define EEEPC_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
 
@@ -861,6 +863,27 @@ static struct platform_driver platform_driver = {
 	},
 };
 
+static acpi_status __init eeepc_wmi_parse_device(acpi_handle handle, u32 level,
+						 void *context, void **retval)
+{
+	pr_warning("Found legacy ATKD device (%s)", EEEPC_ACPI_HID);
+	*(bool *)context = true;
+	return AE_CTRL_TERMINATE;
+}
+
+static int __init eeepc_wmi_check_atkd(void)
+{
+	acpi_status status;
+	bool found = false;
+
+	status = acpi_get_devices(EEEPC_ACPI_HID, eeepc_wmi_parse_device,
+				  &found, NULL);
+
+	if (ACPI_FAILURE(status) || !found)
+		return 0;
+	return -1;
+}
+
 static int __init eeepc_wmi_init(void)
 {
 	int err;
@@ -871,6 +894,16 @@ static int __init eeepc_wmi_init(void)
 		return -ENODEV;
 	}
 
+	if (eeepc_wmi_check_atkd()) {
+		pr_warning("WMI device present, but legacy ATKD device is also "
+			   "present and enabled.");
+		pr_warning("You probably booted with acpi_osi=\"Linux\" or "
+			   "acpi_osi=\"!Windows 2009\"");
+		pr_warning("Can't load eeepc-wmi, use default acpi_osi "
+			   "(preferred) or eeepc-laptop");
+		return -ENODEV;
+	}
+
 	platform_device = eeepc_wmi_add();
 	if (IS_ERR(platform_device)) {
 		err = PTR_ERR(platform_device);
-- 
1.7.3.2
