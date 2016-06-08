From: Lyude <cpaul@redhat.com>
Subject: [PATCH v2] thinkpad_acpi: Add support for HKEY version 0x200
Date: Wed,  8 Jun 2016 10:54:25 -0400
Message-ID: <1465397665-9343-1-git-send-email-cpaul@redhat.com>
References: <20160607235338.GA3147@khazad-dum.debian.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51359 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757169AbcFHOyj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 10:54:39 -0400
In-Reply-To: <20160607235338.GA3147@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Dennis Wassenberg <dennis.wassenberg@secunet.com>
Cc: Lyude <cpaul@redhat.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, "open list:THINKPAD ACPI EXTRAS
	DRIVER" <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXTRAS
	DRIVER" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

From: Dennis Wassenberg <dennis.wassenberg@secunet.com>

Lenovo Thinkpad devices T460, T460s, T460p, T560, X260 use
HKEY version 0x200 without adaptive keyboard.

HKEY version 0x200 has method MHKA with one parameter value.
Passing parameter value 1 will get hotkey_all_mask (the same like
HKEY version 0x100 without parameter). Passing parameter value 2 to
MHKA method will retrieve hotkey_all_adaptive_mask. If 0 is returned in
that case there is no adaptive keyboard available.

Signed-off-by: Dennis Wassenberg <dennis.wassenberg@secunet.com>
Signed-off-by: Lyude <cpaul@redhat.com>
Tested-by: Lyude <cpaul@redhat.com>
Tested-by: Marco Trevisan <marco@ubuntu.com>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
Changes since v1:
 - Fix all of the indenting issues
 - Add appropriate Tested-by's, Signed-off's, etc.

 drivers/platform/x86/thinkpad_acpi.c | 85 ++++++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9255ff3..210ecf5 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2043,6 +2043,7 @@ static int hotkey_autosleep_ack;
 
 static u32 hotkey_orig_mask;		/* events the BIOS had enabled */
 static u32 hotkey_all_mask;		/* all events supported in fw */
+static u32 hotkey_adaptive_all_mask;	/* all adaptive events supported in fw */
 static u32 hotkey_reserved_mask;	/* events better left disabled */
 static u32 hotkey_driver_mask;		/* events needed by the driver */
 static u32 hotkey_user_mask;		/* events visible to userspace */
@@ -2742,6 +2743,17 @@ static ssize_t hotkey_all_mask_show(struct device *dev,
 
 static DEVICE_ATTR_RO(hotkey_all_mask);
 
+/* sysfs hotkey all_mask ----------------------------------------------- */
+static ssize_t hotkey_adaptive_all_mask_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "0x%08x\n",
+			hotkey_adaptive_all_mask | hotkey_source_mask);
+}
+
+static DEVICE_ATTR_RO(hotkey_adaptive_all_mask);
+
 /* sysfs hotkey recommended_mask --------------------------------------- */
 static ssize_t hotkey_recommended_mask_show(struct device *dev,
 					    struct device_attribute *attr,
@@ -2985,6 +2997,7 @@ static struct attribute *hotkey_attributes[] __initdata = {
 	&dev_attr_wakeup_hotunplug_complete.attr,
 	&dev_attr_hotkey_mask.attr,
 	&dev_attr_hotkey_all_mask.attr,
+	&dev_attr_hotkey_adaptive_all_mask.attr,
 	&dev_attr_hotkey_recommended_mask.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
@@ -3321,20 +3334,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	if (!tp_features.hotkey)
 		return 1;
 
-	/*
-	 * Check if we have an adaptive keyboard, like on the
-	 * Lenovo Carbon X1 2014 (2nd Gen).
-	 */
-	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
-		if ((hkeyv >> 8) == 2) {
-			tp_features.has_adaptive_kbd = true;
-			res = sysfs_create_group(&tpacpi_pdev->dev.kobj,
-					&adaptive_kbd_attr_group);
-			if (res)
-				goto err_exit;
-		}
-	}
-
 	quirks = tpacpi_check_quirks(tpacpi_hotkey_qtable,
 				     ARRAY_SIZE(tpacpi_hotkey_qtable));
 
@@ -3357,18 +3356,16 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	   A30, R30, R31, T20-22, X20-21, X22-24.  Detected by checking
 	   for HKEY interface version 0x100 */
 	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
-		if ((hkeyv >> 8) != 1) {
-			pr_err("unknown version of the HKEY interface: 0x%x\n",
-			       hkeyv);
-			pr_err("please report this to %s\n", TPACPI_MAIL);
-		} else {
+		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
+			    "firmware HKEY interface version: 0x%x\n",
+			    hkeyv);
+
+		switch (hkeyv >> 8) {
+		case 1:
 			/*
 			 * MHKV 0x100 in A31, R40, R40e,
 			 * T4x, X31, and later
 			 */
-			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
-				"firmware HKEY interface version: 0x%x\n",
-				hkeyv);
 
 			/* Paranoia check AND init hotkey_all_mask */
 			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
@@ -3381,6 +3378,50 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 			} else {
 				tp_features.hotkey_mask = 1;
 			}
+			break;
+
+		case 2:
+			/*
+			 * MHKV 0x200 in X1, T460s, X260, T560, X1 Tablet (2016)
+			 */
+
+			/* Paranoia check AND init hotkey_all_mask */
+			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
+					"MHKA", "dd", 1)) {
+				pr_err("missing MHKA handler, "
+				       "please report this to %s\n",
+				       TPACPI_MAIL);
+				/* Fallback: pre-init for FN+F3,F4,F12 */
+				hotkey_all_mask = 0x080cU;
+			} else {
+				tp_features.hotkey_mask = 1;
+			}
+
+			/*
+			 * Check if we have an adaptive keyboard, like on the
+			 * Lenovo Carbon X1 2014 (2nd Gen).
+			 */
+			if (acpi_evalf(hkey_handle, &hotkey_adaptive_all_mask,
+				       "MHKA", "dd", 2)) {
+				if (hotkey_adaptive_all_mask != 0) {
+					tp_features.has_adaptive_kbd = true;
+					res = sysfs_create_group(
+						&tpacpi_pdev->dev.kobj,
+						&adaptive_kbd_attr_group);
+					if (res)
+						goto err_exit;
+				}
+			} else {
+				tp_features.has_adaptive_kbd = false;
+				hotkey_adaptive_all_mask = 0x0U;
+			}
+			break;
+
+		default:
+			pr_err("unknown version of the HKEY interface: 0x%x\n",
+			       hkeyv);
+			pr_err("please report this to %s\n", TPACPI_MAIL);
+			break;
 		}
 	}
 
-- 
2.5.5
