From: Maarten Maathuis <madman2003@gmail.com>
Subject: [PATCH] platform/x86/intel-vbtn: add volume up and down
Date: Mon, 24 Apr 2017 23:35:21 +0200
Message-ID: <20170424213521.10406-1-madman2003@shikahr.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36459 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1428317AbdDXVfg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 17:35:36 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: acelan.kao@canonical.com, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Maathuis <madman2003@shikahr.net>

Tested on HP Elite X2 1012 G1.
Matches event report of Lenovo Helix 2
(https://www.spinics.net/lists/ibm-acpi-devel/msg03982.html).

V2: Fix indent and add sign-off
V3: Missing whitespace correction

Signed-off-by: Maarten Maathuis <madman2003@shikahr.net>
---
 drivers/platform/x86/intel-vbtn.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 554e82ebe83c..dc270fe793a1 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -37,6 +37,10 @@ static const struct acpi_device_id intel_vbtn_ids[] = {
 static const struct key_entry intel_vbtn_keymap[] = {
 	{ KE_IGNORE, 0xC0, { KEY_POWER } },	/* power key press */
 	{ KE_KEY, 0xC1, { KEY_POWER } },	/* power key release */
+	{ KE_KEY, 0xC4, { KEY_VOLUMEUP } },	/* volume-up key press */
+	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },	/* volume-up key release */
+	{ KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },	/* volume-down key press */
+	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
 	{ KE_END },
 };
 
-- 
2.12.2
