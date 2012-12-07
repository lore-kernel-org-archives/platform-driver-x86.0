From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 07/12] msi-wmi: Fix memory leak
Date: Fri,  7 Dec 2012 15:49:17 +0200
Message-ID: <1354888162-12109-8-git-send-email-maxtram95@gmail.com>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:44205 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030475Ab2LGNuF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:50:05 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so188017eaa.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:50:05 -0800 (PST)
In-Reply-To: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Fix memory leak - don't forget to kfree ACPI object when returning from
msi_wmi_notify() after suppressing key event.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Acked-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/msi-wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 2264331..b96766b 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -176,7 +176,7 @@ static void msi_wmi_notify(u32 value, void *context)
 				pr_debug("Suppressed key event 0x%X - "
 					 "Last press was %lld us ago\n",
 					 key->code, ktime_to_us(diff));
-				return;
+				goto msi_wmi_notify_exit;
 			}
 			last_pressed[key->code - SCANCODE_BASE] = cur;
 
@@ -195,6 +195,8 @@ static void msi_wmi_notify(u32 value, void *context)
 			pr_info("Unknown key pressed - %x\n", eventcode);
 	} else
 		pr_info("Unknown event received\n");
+
+msi_wmi_notify_exit:
 	kfree(response.pointer);
 }
 
-- 
1.8.0.1
