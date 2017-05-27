From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 27 May 2017 13:51:17 +0200
Message-ID: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36574 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756051AbdE0Lvd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 07:51:33 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

object_id and notify_id are in one union structure and their meaning is
defined by flags. Therefore do not print notify_id for non-event block and
do not print object_id for event block. Remove also reserved member as it
does not have any defined meaning or type yet.

As object_id and notify_id union members overlaps and have different types,
it caused that kernel print to dmesg binary data. This patch eliminates it.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/wmi.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index ceeb8c1..cd7045f 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -352,9 +352,10 @@ acpi_status wmi_set_block(const char *guid_string, u8 instance,
 static void wmi_dump_wdg(const struct guid_block *g)
 {
 	pr_info("%pUL:\n", g->guid);
-	pr_info("\tobject_id: %c%c\n", g->object_id[0], g->object_id[1]);
-	pr_info("\tnotify_id: %02X\n", g->notify_id);
-	pr_info("\treserved: %02X\n", g->reserved);
+	if (g->flags & ACPI_WMI_EVENT)
+		pr_info("\tnotify_id: 0x%02X\n", g->notify_id);
+	else
+		pr_info("\tobject_id: %c%c\n", g->object_id[0], g->object_id[1]);
 	pr_info("\tinstance_count: %d\n", g->instance_count);
 	pr_info("\tflags: %#x", g->flags);
 	if (g->flags) {
-- 
1.7.9.5
