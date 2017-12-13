From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH] platform/x86: dell-wmi-aio: Block comments use * on subsequent lines
Date: Wed, 13 Dec 2017 13:48:55 +0530
Message-ID: <20171213081855.22952-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ma1ind01on0126.outbound.protection.outlook.com ([104.47.100.126]:57013
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750751AbdLMITF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 03:19:05 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>

Resolved Block comments use * on subsequent lines checkpatch warnings.
Issue found by checkpatch.

Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
---
 drivers/platform/x86/dell-wmi-aio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-aio.c b/drivers/platform/x86/dell-wmi-aio.c
index 50c2078715d6..3842b32a729c 100644
--- a/drivers/platform/x86/dell-wmi-aio.c
+++ b/drivers/platform/x86/dell-wmi-aio.c
@@ -36,7 +36,8 @@ MODULE_LICENSE("GPL");
 struct dell_wmi_event {
 	u16	length;
 	/* 0x000: A hot key pressed or an event occurred
-	 * 0x00F: A sequence of hot keys are pressed */
+	 * 0x00F: A sequence of hot keys are pressed
+	 */
 	u16	type;
 	u16	event[];
 };
@@ -115,7 +116,8 @@ static void dell_wmi_aio_notify(u32 value, void *context)
 				scancode = event->event[0];
 			} else {
 				/* Broken machines return the scancode in a
-				   buffer */
+				 * buffer
+				 */
 				if (obj->buffer.pointer &&
 						obj->buffer.length > 0)
 					scancode = obj->buffer.pointer[0];
-- 
2.11.0
