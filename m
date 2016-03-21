From: Lawrence Yiu <lawyiu.dev@gmail.com>
Subject: [PATCH] sony-laptop: Avoid oops on module unload for older laptops
Date: Mon, 21 Mar 2016 01:44:22 -0700
Message-ID: <56EFB466.60008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:35321 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067AbcCUIo0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Mar 2016 04:44:26 -0400
Received: by mail-pf0-f179.google.com with SMTP id n5so257013304pfn.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Mar 2016 01:44:25 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: malattia@linux.it

Older VAIO laptops without the SN00 ACPI method will have the "handles"
variable unset. Return early from sony_nc_function_cleanup when "handles"
is null.

Signed-off-by: Lawrence Yiu <lawyiu.dev@gmail.com>
---
 drivers/platform/x86/sony-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index e9caa34..1dba359 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1446,6 +1446,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 {
 	unsigned int i, result, bitmask, handle;
 
+	if (!handles)
+		return;
+
 	/* get enabled events and disable them */
 	sony_nc_int_call(sony_nc_acpi_handle, "SN01", NULL, &bitmask);
 	sony_nc_int_call(sony_nc_acpi_handle, "SN03", &bitmask, &result);
-- 
2.5.0
