From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH] ideapad: Report hard block off if it is never on
Date: Wed, 16 Dec 2015 11:49:33 +0800
Message-ID: <1450237773-1685-1-git-send-email-ike.pan@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hardware radio switch is rare on recently ideapad and some of them
reported radio hardware blocked by error. With more and more ideapads
available in market to maintain the dmi table becomes a
never-finished job.

Therefore I am thinking an easy way to detect by response from
hardware. This patch will make driver says hardware switch is not
blocked if the response from ACPI is always radio blocked.

For an ideapad without radio switch, no matter what ACPI says, driver
will report false on hardware blocked.

For an ideapad with radio switch, if driver loaded with radio on, no
behavior is changed.

For an ideapad with radio switch and driver loaded with radio off,
driver will report unblocked falsely and network manager might not
scan if wireless driver reports blocked. Once the switch is on,
driver will report correct information.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index a313dfc..91ccb4e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -482,11 +482,16 @@ static void ideapad_sync_rfk_state(struct ideapad_private *priv)
 {
 	unsigned long hw_blocked = 0;
 	int i;
+	static int hw_unblock_once;
 
 	if (priv->has_hw_rfkill_switch) {
 		if (read_ec_data(priv->adev->handle, VPCCMD_R_RF, &hw_blocked))
 			return;
+		if (hw_blocked)
+			hw_unblock_once = 1;
 		hw_blocked = !hw_blocked;
+		if (!hw_unblock_once)
+			hw_blocked = 0;
 	}
 
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
-- 
1.9.1
