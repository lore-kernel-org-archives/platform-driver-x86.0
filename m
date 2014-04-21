From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 11/11] driver: thinkpad_acpi: remove spaces at the beginning
Date: Mon, 21 Apr 2014 21:10:56 +0200
Message-ID: <1398107456-31080-12-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-7-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-8-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-9-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-10-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-11-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:51321 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754218AbaDUTLS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:18 -0400
Received: by mail-ee0-f45.google.com with SMTP id d17so3800887eek.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:17 -0700 (PDT)
In-Reply-To: <1398107456-31080-11-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "please, no spaces at the start of a line"
checkpatch warning.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 14da752..4593328 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1953,19 +1953,18 @@ enum {	/* NVRAM to ACPI HKEY group map */
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 struct tp_nvram_state {
-       u16 thinkpad_toggle:1;
-       u16 zoom_toggle:1;
-       u16 display_toggle:1;
-       u16 thinklight_toggle:1;
-       u16 hibernate_toggle:1;
-       u16 displayexp_toggle:1;
-       u16 display_state:1;
-       u16 brightness_toggle:1;
-       u16 volume_toggle:1;
-       u16 mute:1;
-
-       u8 brightness_level;
-       u8 volume_level;
+	u16 thinkpad_toggle:1;
+	u16 zoom_toggle:1;
+	u16 display_toggle:1;
+	u16 thinklight_toggle:1;
+	u16 hibernate_toggle:1;
+	u16 displayexp_toggle:1;
+	u16 display_state:1;
+	u16 brightness_toggle:1;
+	u16 volume_toggle:1;
+	u16 mute:1;
+	u8 brightness_level;
+	u8 volume_level;
 };
 
 /* kthread for the hotkey poller */
-- 
1.8.1.2
