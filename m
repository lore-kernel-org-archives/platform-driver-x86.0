From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] acer-wmi: remove non-used acer_quirks struct definition
Date: Mon, 12 Jul 2010 09:10:22 +0800
Message-ID: <1278897022.6563.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:39630 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755249Ab0GLBJ6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 11 Jul 2010 21:09:58 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Renninger <trenn@suse.de>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, platform-driver-x86@vger.kernel.org

This patch removes non-used acer_quirks struct definition.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/acer-wmi.c |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1ea6c43..a9ca04e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -50,17 +50,6 @@ MODULE_LICENSE("GPL");
 #define ACER_INFO KERN_INFO ACER_LOGPREFIX
 
 /*
- * The following defines quirks to get some specific functions to work
- * which are known to not be supported over ACPI-WMI (such as the mail LED
- * on WMID based Acer's)
- */
-struct acer_quirks {
-	const char *vendor;
-	const char *model;
-	u16 quirks;
-};
-
-/*
  * Magic Number
  * Meaning is unknown - this number is required for writing to ACPI for AMW0
  * (it's also used in acerhk when directly accessing the BIOS)
-- 
1.5.4.3
