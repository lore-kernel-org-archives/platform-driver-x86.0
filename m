From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] dell-wmi: add a WMI event code for display on/off
Date: Thu, 16 Jun 2016 11:25:08 +0800
Message-ID: <1466047508-18799-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:47819 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932570AbcFPDZQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Jun 2016 23:25:16 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

Some new Dell AIO systems have a button that generates WMI evnet
that is to be used to turn LCD on/off

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/dell-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 15c6f11..298aba1 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -125,6 +125,9 @@ static const struct key_entry dell_wmi_legacy_keymap[] __initconst = {
 	/* Audio panel key */
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
 
+	/* Monitor On/Off Control key */
+	{ KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
+
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe030, { KEY_VOLUMEUP } },
 	{ KE_IGNORE, 0xe033, { KEY_KBDILLUMUP } },
-- 
2.7.4
