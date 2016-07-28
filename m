From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v2 2/2] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Thu, 28 Jul 2016 12:53:48 -0500
Message-ID: <1469728428-24881-2-git-send-email-mario_limonciello@dell.com>
References: <1469728428-24881-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:57905 "EHLO
	esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756456AbcG1RyG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jul 2016 13:54:06 -0400
In-Reply-To: <1469728428-24881-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

The Dell Rugged 7202 has 3 programmable buttons (labeled P1, P2, P3)
and a detachable keyboard/mouse dock.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 866bf73..28ec17a 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -274,6 +274,16 @@ static const struct key_entry dell_wmi_keymap_type_0010[] __initconst = {
 
 	/* Stealth mode toggle */
 	{ KE_IGNORE, 0x155, { KEY_RESERVED } },
+
+	/* Rugged magnetic dock attach/detach events */
+	{ KE_IGNORE, 0x156, { KEY_RESERVED } },
+	{ KE_IGNORE, 0x157, { KEY_RESERVED } },
+
+	/* Rugged programmable (P1/P2/P3 keys) */
+	{ KE_KEY,    0x850, { KEY_PROG1 } },
+	{ KE_KEY,    0x851, { KEY_PROG2 } },
+	{ KE_KEY,    0x852, { KEY_PROG3 } },
+
 };
 
 /*
-- 
2.7.4
