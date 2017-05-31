From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] platform/x86: panasonic-laptop: remove unused code
Date: Wed, 31 May 2017 16:17:48 -0700
Message-ID: <1496272668-25875-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53762 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdEaXR5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 May 2017 19:17:57 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: laforge@gnumonks.org, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org
Cc: alex.hung@canonical.com

The struct pcc_keyinput is not used in panasonic-laptop and in
anywhere in kernel, and it can be removed.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/panasonic-laptop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 975f4e1..76b0a58 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -228,10 +228,6 @@ struct pcc_acpi {
 	struct backlight_device	*backlight;
 };
 
-struct pcc_keyinput {
-	struct acpi_hotkey      *hotkey;
-};
-
 /* method access functions */
 static int acpi_pcc_write_sset(struct pcc_acpi *pcc, int func, int val)
 {
-- 
2.7.4
