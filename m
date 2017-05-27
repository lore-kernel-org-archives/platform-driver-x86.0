From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sat, 27 May 2017 13:55:34 +0200
Message-ID: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35844 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756051AbdE0L4D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 07:56:03 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

instance_count defines number of instances of data block and instance
itself is indexed from zero, which means first instance has number 0.
Therefore check for invalid instance should be non-strict inequality.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
I'm marking this patch as RFC because it is not tested at all and probably
could break existing WMI drivers. Some WMI drivers pass instance number 1
and I'm not sure if ACPI-WMI bytecode for those machines has really two
instances. In more cases ACPI-WMI bytecode does not check instance number
if supports only one instance. So then any instance id can be used for
correct execution of ACPI-WMI method.

So this patch is open for discussion.
---
 drivers/platform/x86/wmi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index cd7045f..df63037 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -191,7 +191,7 @@ acpi_status wmi_evaluate_method(const char *guid_string, u8 instance,
 	if (!(block->flags & ACPI_WMI_METHOD))
 		return AE_BAD_DATA;
 
-	if (block->instance_count < instance)
+	if (block->instance_count <= instance)
 		return AE_BAD_PARAMETER;
 
 	input.count = 2;
@@ -250,7 +250,7 @@ struct acpi_buffer *out)
 	block = &wblock->gblock;
 	handle = wblock->handle;
 
-	if (block->instance_count < instance)
+	if (block->instance_count <= instance)
 		return AE_BAD_PARAMETER;
 
 	/* Check GUID is a data block */
@@ -323,7 +323,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 instance,
 	block = &wblock->gblock;
 	handle = wblock->handle;
 
-	if (block->instance_count < instance)
+	if (block->instance_count <= instance)
 		return AE_BAD_PARAMETER;
 
 	/* Check GUID is a data block */
-- 
1.7.9.5
