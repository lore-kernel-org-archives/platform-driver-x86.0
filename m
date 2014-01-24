From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: [PATCH] Platform / wmi: Fix potential memory leak in parse_wdg()
Date: Sat, 25 Jan 2014 00:14:35 +0800
Message-ID: <1390580075-14342-1-git-send-email-hanjun.guo@linaro.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:43106 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbaAXQPI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Jan 2014 11:15:08 -0500
Received: by mail-pa0-f47.google.com with SMTP id kp14so3442456pab.20
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2014 08:15:07 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org, patches@linaro.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, linaro-acpi@lists.linaro.org, platform-driver-x86@vger.kernel.org, Hanjun Guo <hanjun.guo@linaro.org>

we forgot to call wmi_free_devices() and free out.pointer
when alloc mamory failed.

Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>
---
 drivers/platform/x86/wmi.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 43d1329..e1338b5 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -797,8 +797,11 @@ static int parse_wdg(acpi_handle handle)
 			wmi_dump_wdg(&gblock[i]);
 
 		wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
-		if (!wblock)
-			return -ENOMEM;
+		if (!wblock) {
+			wmi_free_devices();
+			retval = -ENOMEM;
+			goto out_free_pointer;
+		}
 
 		wblock->handle = handle;
 		wblock->gblock = gblock[i];
-- 
1.7.9.5
