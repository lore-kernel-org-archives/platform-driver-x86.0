From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] x86: thinkpad_acpi: Handle return error.
Date: Mon,  6 Mar 2017 13:13:26 +0530
Message-ID: <1488786206-20190-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33802 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752610AbdCFHoY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2017 02:44:24 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.b, dvhart@infradead.org, andy@infradead.org
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This patch is for handling a return error.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1d18b32..19ad3ec 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1237,9 +1237,11 @@ static int tpacpi_rfk_hook_set_block(void *data, bool blocked)
 	/* try to set radio state */
 	res = (tp_rfk->ops->set_status)(blocked ?
 				TPACPI_RFK_RADIO_OFF : TPACPI_RFK_RADIO_ON);
+	if (res < 0)
+		return res;
 
 	/* and update the rfkill core with whatever the FW really did */
-	tpacpi_rfk_update_swstate(tp_rfk);
+	res = tpacpi_rfk_update_swstate(tp_rfk);
 
 	return (res < 0) ? res : 0;
 }
@@ -1371,7 +1373,10 @@ static ssize_t tpacpi_rfk_sysfs_enable_store(const enum tpacpi_rfk_id id,
 
 	res = tpacpi_rfkill_switches[id]->ops->set_status((!!t) ?
 				TPACPI_RFK_RADIO_ON : TPACPI_RFK_RADIO_OFF);
-	tpacpi_rfk_update_swstate(tpacpi_rfkill_switches[id]);
+	if (res < 0)
+		return res;
+
+	res = tpacpi_rfk_update_swstate(tpacpi_rfkill_switches[id]);
 
 	return (res < 0) ? res : count;
 }
@@ -1427,7 +1432,9 @@ static int tpacpi_rfk_procfs_write(const enum tpacpi_rfk_id id, char *buf)
 						"enable" : "disable",
 				tpacpi_rfkill_names[id]);
 		res = (tpacpi_rfkill_switches[id]->ops->set_status)(status);
-		tpacpi_rfk_update_swstate(tpacpi_rfkill_switches[id]);
+		if (res < 0)
+			return res;
+		res = tpacpi_rfk_update_swstate(tpacpi_rfkill_switches[id]);
 	}
 
 	return res;
@@ -3517,6 +3524,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	if (tp_features.hotkey_wlsw)
 		res = add_to_attr_set(hotkey_dev_attributes,
 				&dev_attr_hotkey_radio_sw.attr);
+	if (res)
+		goto err_exit;
 
 	res = hotkey_init_tablet_mode();
 	if (res < 0)
-- 
1.9.1
