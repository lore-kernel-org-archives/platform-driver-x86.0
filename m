From: jhbird.choi@gmail.com
Subject: [PATCH 3.8-stable] msi-wmi: Fix memory leak
Date: Sat,  6 Apr 2013 21:43:57 +0900
Message-ID: <516018d4.41e1440a.5308.fffff9f2@mx.google.com>
References: <y>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:38431 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422847Ab3DFMpK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 6 Apr 2013 08:45:10 -0400
In-Reply-To: <y>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>, Matthew Garrett <matthew.garrett@nebula.com>, Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Jonghwan Choi <jhbird.choi@samsung.com>

From: Maxim Mikityanskiy <maxtram95@gmail.com>

This patch looks like it should be in the 3.8-stable tree, should we apply
it?

------------------

From: "Maxim Mikityanskiy <maxtram95@gmail.com>"

commit 51c94491c82c3d9029f6e87a1a153db321d88e35 upstream

Fix memory leak - don't forget to kfree ACPI object when returning from
msi_wmi_notify() after suppressing key event.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Acked-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 drivers/platform/x86/msi-wmi.c |    4 +++-
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
1.7.10.4
