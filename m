From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.1 41/51] platform/x86: intel-vbtn: Report switch events when event wakes device
Date: Tue, 25 Jun 2019 23:40:57 -0400
Message-ID: <20190626034117.23247-41-sashal@kernel.org>
References: <20190626034117.23247-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626034117.23247-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Mathew King <mathewk@chromium.org>, Jett Rink <jettrink@chromium.org>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Mathew King <mathewk@chromium.org>

[ Upstream commit cb1921b17adbe6509538098ac431033378cd7165 ]

When a switch event, such as tablet mode/laptop mode or docked/undocked,
wakes a device make sure that the value of the swich is reported.
Without when a device is put in tablet mode from laptop mode when it is
suspended or vice versa the device will wake up but mode will be
incorrect.

Tested by suspending a device in laptop mode and putting it in tablet
mode, the device resumes and is in tablet mode. When suspending the
device in tablet mode and putting it in laptop mode the device resumes
and is in laptop mode.

Signed-off-by: Mathew King <mathewk@chromium.org>
Reviewed-by: Jett Rink <jettrink@chromium.org>
Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel-vbtn.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 06cd7e818ed5..a0d0cecff55f 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -76,12 +76,24 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	struct platform_device *device = context;
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
 	unsigned int val = !(event & 1); /* Even=press, Odd=release */
-	const struct key_entry *ke_rel;
+	const struct key_entry *ke, *ke_rel;
 	bool autorelease;
 
 	if (priv->wakeup_mode) {
-		if (sparse_keymap_entry_from_scancode(priv->input_dev, event)) {
+		ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
+		if (ke) {
 			pm_wakeup_hard_event(&device->dev);
+
+			/*
+			 * Switch events like tablet mode will wake the device
+			 * and report the new switch position to the input
+			 * subsystem.
+			 */
+			if (ke->type == KE_SW)
+				sparse_keymap_report_event(priv->input_dev,
+							   event,
+							   val,
+							   0);
 			return;
 		}
 		goto out_unknown;
-- 
2.20.1
