From: Kyle Evans <kvans32@gmail.com>
Subject: Re: [PATCH] hp-wmi: Add support for SMBus hotkeys
Date: Thu, 31 Jan 2013 15:44:27 -0500
Message-ID: <1359665067-13035-1-git-send-email-kvans32@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ia0-f173.google.com ([209.85.210.173]:61492 "EHLO
	mail-ia0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753942Ab3AaPoh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Jan 2013 10:44:37 -0500
Received: by mail-ia0-f173.google.com with SMTP id l29so4057761iag.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Jan 2013 07:44:36 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Kyle Evans <kvans32@gmail.com>

Several models of HP laptops using the same DSDT have hotkey buttons
that do not work until the EC is configured to enable them.

Signed-off-by: Kyle Evans <kvans32@gmail.com>
---
 drivers/platform/x86/hp-wmi.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 1dde7ac..90938d6 100644
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
