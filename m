From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 1/7] hp-wmi: check query return value in hp_wmi_perform_query
Date: Sun, 20 Feb 2011 20:07:20 +0200
Message-ID: <1298225246-21991-2-git-send-email-anssi.hannula@iki.fi>
References: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sypressi.dnainternet.net ([83.102.40.135]:38223 "EHLO
	sypressi.dnainternet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754353Ab1BTSHe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 13:07:34 -0500
In-Reply-To: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Check BIOS provided return value code in hp_wmi_perform_query and print
a warning on error. Printing is suppressed for HPWMI_RET_UNKNOWN_CMDTYPE
which is returned when the command type is unsupported.

Signed-off-by: Anssi Hannula <anssi.hannula@iki.fi>
---
 drivers/platform/x86/hp-wmi.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 9e05af9..87dfb24 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -89,6 +89,13 @@ struct bios_return {
 	u32 value;
 };
 
+enum hp_return_value {
+	HPWMI_RET_WRONG_SIGNATURE	= 0x02,
+	HPWMI_RET_UNKNOWN_COMMAND	= 0x03,
+	HPWMI_RET_UNKNOWN_CMDTYPE	= 0x04,
+	HPWMI_RET_INVALID_PARAMETERS	= 0x05,
+};
+
 static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x02,   { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0x03,   { KEY_BRIGHTNESSDOWN } },
@@ -171,6 +178,15 @@ static int hp_wmi_perform_query(int query, int write, u32 *buffer,
 
 	bios_return = *((struct bios_return *)obj->buffer.pointer);
 
+	if (bios_return.return_code) {
+		if (bios_return.return_code != HPWMI_RET_UNKNOWN_CMDTYPE)
+			printk(KERN_WARNING PREFIX "query 0x%x returned "
+						   "error 0x%x\n",
+			       query, bios_return.return_code);
+		kfree(obj);
+		return bios_return.return_code;
+	}
+
 	memcpy(buffer, &bios_return.value, sizeof(bios_return.value));
 
 	kfree(obj);
-- 
1.7.3
