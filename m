From: Zach Ploskey <zach@ploskey.com>
Subject: [PATCH] platform/x86: ideapad-laptop: handle ACPI event 1
Date: Sun, 22 Jan 2017 00:47:19 -0800
Message-ID: <20170122084719.2135-1-zach@ploskey.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-s85.mailgun.info ([184.173.153.213]:51112 "EHLO
        mail-s85.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751160AbdAVI4Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Jan 2017 03:56:16 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Zach Ploskey <zach@ploskey.com>

On Ideapad laptops, ACPI event 1 is currently not handled. Many models
log "ideapad_laptop: Unknown event: 1" every 20 seconds or so while
running on battery power. Some convertible laptops receive this event
when switching in and out of tablet mode.

This adds and additional case for event 1 in ideapad_acpi_notify to call
ideapad_input_report(priv, vpc_bit), so that the event is reported to
userspace and we avoid unnecessary logging.

Fixes bug #107481 (https://bugzilla.kernel.org/show_bug.cgi?id=107481)
Fixes bug #65751 (https://bugzilla.kernel.org/show_bug.cgi?id=65751)

Signed-off-by: Zach Ploskey <zach@ploskey.com>
---
 drivers/platform/x86/ideapad-laptop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 410741acb3c9..f46ece2ce3c4 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -813,6 +813,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 			case 8:
 			case 7:
 			case 6:
+			case 1:
 				ideapad_input_report(priv, vpc_bit);
 				break;
 			case 5:
-- 
2.11.0
