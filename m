From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v2 1/2] dell-wmi: Adjust wifi catcher to emit KEY_WLAN
Date: Thu, 28 Jul 2016 12:53:47 -0500
Message-ID: <1469728428-24881-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:57905 "EHLO
	esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751168AbcG1Rx7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jul 2016 13:53:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

Wifi catcher is a slider switch, that when slid past the on position
will emit an event that is intended for launching a wifi application
or applet when the machine is turned on.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index d2bc092..866bf73 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -114,7 +114,7 @@ static const struct key_entry dell_wmi_keymap_type_0000[] __initconst = {
 	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
 
 	/* Wifi Catcher */
-	{ KE_KEY,    0xe011, { KEY_PROG2 } },
+	{ KE_KEY,    0xe011, { KEY_WLAN } },
 
 	/* Ambient light sensor toggle */
 	{ KE_IGNORE, 0xe013, { KEY_RESERVED } },
-- 
2.7.4
