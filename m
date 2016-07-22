From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Fri, 22 Jul 2016 15:01:24 -0500
Message-ID: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:37567 "EHLO
	esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752070AbcGVULE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jul 2016 16:11:04 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

The Dell Rugged 7202 has 3 programmable buttons (labeled P1, P2, P3)
and a detachable magnetic keyboard/mouse.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 15c6f11..6ba42d0 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -222,6 +222,16 @@ static const struct key_entry dell_wmi_extra_keymap[] __initconst = {
 
 	/* Stealth mode toggle */
 	{ KE_IGNORE, 0x155, { KEY_RESERVED } },
+
+	/* Rugged magnetic keyboard/mouse events */
+	{ KE_IGNORE, 0x156, { KEY_RESERVED } },
+	{ KE_IGNORE, 0x157, { KEY_RESERVED } },
+
+	/* Rugged programmable (P1/P2/P3 keys) */
+	{ KE_KEY, 0x850, { KEY_PROG1 } },
+	{ KE_KEY, 0x851, { KEY_PROG2 } },
+	{ KE_KEY, 0x852, { KEY_PROG3 } },
+
 };
 
 static struct input_dev *dell_wmi_input_dev;
-- 
2.7.4
