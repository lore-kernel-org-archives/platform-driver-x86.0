From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 10 Jun 2017 12:57:11 +0200
Message-ID: <1497092231-505-1-git-send-email-pali.rohar@gmail.com>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:36446 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751941AbdFJK5b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Jun 2017 06:57:31 -0400
In-Reply-To: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Joe Perches <joe@perches.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

object_id and notify_id are in one union structure and their meaning is
defined by flags. Therefore do not print notify_id for non-event block and
do not print object_id for event block. Remove also reserved member as it
does not have any defined meaning or type yet.

As object_id and notify_id union members overlaps and have different types,
it caused that kernel print to dmesg binary data. This patch eliminates it.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
Changes since v2:
 * Use %2pE instead of %c%c as suggested by Andy Shevchenko
---
 drivers/platform/x86/wmi.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index ceeb8c1..6d6f2a9 100644
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
+		pr_info("\tobject_id: %2pE\n", g->object_id);
 	pr_info("\tinstance_count: %d\n", g->instance_count);
 	pr_info("\tflags: %#x", g->flags);
 	if (g->flags) {
-- 
1.7.9.5
