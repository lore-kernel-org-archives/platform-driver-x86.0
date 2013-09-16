From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH 1/2] thinkpad-acpi: add a kernel parameter to disable hardware mute and its led
Date: Mon, 16 Sep 2013 15:45:14 +0800
Message-ID: <1379317515-25777-2-git-send-email-alex.hung@canonical.com>
References: <1379317515-25777-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:39617 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753738Ab3IPHp0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Sep 2013 03:45:26 -0400
In-Reply-To: <1379317515-25777-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, matthew.garrett@nebula.com, ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Some new Thinkpad has a mute button with led. This mute led can out-of-sync
with mute in user interface. This kernel parameter disables the hardware
mute and led to avoid confusion. The hotkey will only issue scancode to UI.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 03ca6c1..adb3a4e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -253,6 +253,9 @@ enum tpacpi_hkey_event_t {
 #define strlencmp(a, b) (strncmp((a), (b), strlen(b)))
 
 
+static bool use_hardware_mute = 1;
+module_param(use_hardware_mute, bool, 0644);
+
 /****************************************************************************
  * Driver-wide structs and misc. variables
  */
@@ -3327,6 +3330,17 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	if (res)
 		goto err_exit;
 
+	if (!use_hardware_mute) {
+		acpi_handle temp;
+
+		if (!ACPI_SUCCESS(acpi_get_handle(hkey_handle, "SHDA", &temp)))
+			pr_info("hardware mute interface is not supported\n");
+		else {
+			if (!acpi_evalf(hkey_handle, &status, "SHDA", "dd", 1))
+				pr_info("failed to disable hardware mute\n");
+		}
+	}
+
 	/* Set up key map */
 	hotkey_keycode_map = kmalloc(TPACPI_HOTKEY_MAP_SIZE,
 					GFP_KERNEL);
-- 
1.8.1.2
