From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] dell-wmi: Demote unknown WMI event message to pr_debug
Date: Fri,  7 Dec 2012 14:36:12 -0600
Message-ID: <1354912572-8543-1-git-send-email-seth.forshee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:45537 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424123Ab2LGUgR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 15:36:17 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Rezwanul_Kabir@dell.com, platform-driver-x86@vger.kernel.org

This message has been around for quite a while without any movement
toward adding support for the unknown events. The message has been known
to prompt end users to file bug reports, so if nothing is going to be
done about it let's at least silence it by default.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
Matthew,

Dell has indicated in the past that they plan to add support for the
unknown events [1], but that was a year ago and the situation remains
unchanged. If they aren't going to be supported then I see no reason to
keep annoying users with the messages.

Seth

[1] https://lkml.org/lkml/2011/12/7/613

 drivers/platform/x86/dell-wmi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index fa9a217..2f216ff 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -165,8 +165,8 @@ static void dell_wmi_notify(u32 value, void *context)
 		u16 *buffer_entry = (u16 *)obj->buffer.pointer;
 
 		if (dell_new_hk_type && (buffer_entry[1] != 0x10)) {
-			pr_info("Received unknown WMI event (0x%x)\n",
-				buffer_entry[1]);
+			pr_debug("Received unknown WMI event (0x%x)\n",
+				 buffer_entry[1]);
 			kfree(obj);
 			return;
 		}
-- 
1.7.9.5
