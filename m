From: Kyle Evans <kvans32@gmail.com>
Subject: [PATCH] hp-wmi: Add support for SMBus hotkeys
Date: Thu, 24 Jan 2013 16:54:46 -0500
Message-ID: <1359064486-3745-1-git-send-email-kvans32@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ia0-f172.google.com ([209.85.210.172]:64711 "EHLO
	mail-ia0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141Ab3AXQzl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Jan 2013 11:55:41 -0500
Received: by mail-ia0-f172.google.com with SMTP id u8so5034782iag.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Jan 2013 08:55:41 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Kyle Evans <kvans32@gmail.com>

Several models of HP laptops using the same DSDT have hotkey buttons
that do not work until the EC is configured to enable them.
---
 drivers/platform/x86/hp-wmi.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 1dde7ac..67e4c19 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -137,6 +137,7 @@ static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x2142, { KEY_MEDIA } },
 	{ KE_KEY, 0x213b, { KEY_INFO } },
 	{ KE_KEY, 0x2169, { KEY_DIRECTION } },
+	{ KE_KEY, 0x216a, { KEY_SETUP } },
 	{ KE_KEY, 0x231b, { KEY_HELP } },
 	{ KE_END, 0 }
 };
@@ -884,6 +885,9 @@ static int __init hp_wmi_init(void)
 		err = hp_wmi_input_setup();
 		if (err)
 			return err;
+
+		//Enable magic for hotkeys that run on the SMBus
+		ec_write(0xe6,0x6e);
 	}
 
 	if (bios_capable) {
-- 
1.7.3.4
