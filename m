From: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Subject: [PATCH v2] platform/x86: dell-wmi: Add an event created by Dell Latitude 5495
Date: Tue, 19 Dec 2017 17:39:49 +0800
Message-ID: <1513676389-29624-1-git-send-email-sylee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:42961 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758331AbdLSJj5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 04:39:57 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

The Dell Latitude 5495 has the mic mute key.

Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
---
 drivers/platform/x86/dell-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index fb25b20..2c99274 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
  * override them.
  */
 static const struct key_entry dell_wmi_keymap_type_0010[] = {
+	/* Mic mute */
+	{ KE_KEY, 0x150, { KEY_MICMUTE } },
+
 	/* Fn-lock */
 	{ KE_IGNORE, 0x151, { KEY_RESERVED } },
 
-- 
2.7.4
