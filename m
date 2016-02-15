From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 2/2] ideapad: show has_hw_rfkill_switch in debugfs
Date: Mon, 15 Feb 2016 18:24:32 +0800
Message-ID: <1455531872-1335-1-git-send-email-ike.pan@canonical.com>
References: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53033 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752692AbcBOKYj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 05:24:39 -0500
In-Reply-To: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

It will be easier for user to report driver status about
hardware radio switch.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1b39074d..6e47f0f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -226,6 +226,8 @@ static int debugfs_status_show(struct seq_file *s, void *data)
 		seq_printf(s, "BL power value:\t%s\n", value ? "On" : "Off");
 	seq_printf(s, "=====================\n");
 
+	seq_printf(s, "Has RF switch:\t%s\n",
+		priv->has_hw_rfkill_switch ? "Yes" : "No");
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
 		seq_printf(s, "Radio status:\t%s(%lu)\n",
 			   value ? "On" : "Off", value);
-- 
1.9.1
