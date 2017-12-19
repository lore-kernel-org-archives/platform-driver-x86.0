From: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Subject: [PATCH] platform/x86: dell-wmi: Add an event created by Dell Latitude 5495
Date: Tue, 19 Dec 2017 11:38:34 +0800
Message-ID: <1513654714-32175-1-git-send-email-sylee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38955 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760736AbdLSDim (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Dec 2017 22:38:42 -0500
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
index fb25b20..d40f803 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
  * override them.
  */
 static const struct key_entry dell_wmi_keymap_type_0010[] = {
+	/* Mic mute */
+	{ KE_KEY, 0x150, { KEY_F20 } },
+
 	/* Fn-lock */
 	{ KE_IGNORE, 0x151, { KEY_RESERVED } },
 
-- 
2.7.4
