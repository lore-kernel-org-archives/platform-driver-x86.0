From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] intel-hid: add a workaround to ignore an event after waking up from S4.
Date: Mon, 21 Mar 2016 16:08:42 +0800
Message-ID: <1458547722-32663-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:40899 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036AbcCUIIt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Mar 2016 04:08:49 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org

This is the same as the original workaround from S3 but for S4.  Without
this workaround, a rfkill event will be received and it will toggle
wireless devices when radio hotkey is not pressed.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index e20f23e..4ad57b9 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -91,6 +91,8 @@ static int intel_hid_pl_resume_handler(struct device *device)
 }
 
 static const struct dev_pm_ops intel_hid_pl_pm_ops = {
+	.freeze  = intel_hid_pl_suspend_handler,
+	.restore  = intel_hid_pl_resume_handler,
 	.suspend  = intel_hid_pl_suspend_handler,
 	.resume  = intel_hid_pl_resume_handler,
 };
-- 
2.5.0
