From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] platform/x86: intel-wmi-thunderbolt: Add dynamic debugging
Date: Wed, 26 Sep 2018 11:10:58 -0500
Message-ID: <1537978258-2907-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mika Westerberg <mika.westerberg@intel.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Some users have been reporting issues with thunderbolt being turned off
before fully initialized.  This is suspected to be caused by userspace
turning off the Thunderbolt controller using intel-wmi-thunderbolt
prematurely.

Details are available here:
https://bugzilla.kernel.org/show_bug.cgi?id=201227
https://bugzilla.kernel.org/show_bug.cgi?id=199631

Userspace has already made some mitigiations for this situation:
https://github.com/hughsie/fwupd/commit/ef6f1d76983c9b66
https://github.com/hughsie/fwupd/commit/c07ce5b4889a5384

To allow easier debugging of this situation add output that can be turned
on with dynamic debugging to better root cause this problem.

Suggested-by: Mika Westerberg <mika.westerberg@intel.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/intel-wmi-thunderbolt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel-wmi-thunderbolt.c
index c2257bd..ce5fbf0 100644
--- a/drivers/platform/x86/intel-wmi-thunderbolt.c
+++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
@@ -38,12 +38,16 @@ static ssize_t force_power_store(struct device *dev,
 	input.length = sizeof(u8);
 	input.pointer = &mode;
 	mode = hex_to_bin(buf[0]);
+	dev_dbg(dev, "force_power: storing %#x\n", mode);
 	if (mode == 0 || mode == 1) {
 		status = wmi_evaluate_method(INTEL_WMI_THUNDERBOLT_GUID, 0, 1,
 					     &input, NULL);
-		if (ACPI_FAILURE(status))
+		if (ACPI_FAILURE(status)) {
+			dev_dbg(dev, "force_power: failed to evaluate ACPI method\n");
 			return -ENODEV;
+		}
 	} else {
+		dev_dbg(dev, "force_power: unsupported mode\n");
 		return -EINVAL;
 	}
 	return count;
-- 
2.7.4
