From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] intel-wmi-thunderbolt: fix some error cases
Date: Thu, 14 Sep 2017 01:41:55 -0500
Message-ID: <1505371315-30159-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95]:61714 "EHLO
        esa5.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751181AbdINGmz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Sep 2017 02:42:55 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>

These were raised by Lukas Wunner as potential DOS attacks against
the system log by passing bad data to sysfs.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/intel-wmi-thunderbolt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel-wmi-thunderbolt.c
index 32fb6cc..c2257bd 100644
--- a/drivers/platform/x86/intel-wmi-thunderbolt.c
+++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
@@ -41,13 +41,10 @@ static ssize_t force_power_store(struct device *dev,
 	if (mode == 0 || mode == 1) {
 		status = wmi_evaluate_method(INTEL_WMI_THUNDERBOLT_GUID, 0, 1,
 					     &input, NULL);
-		if (ACPI_FAILURE(status)) {
-			pr_err("intel-wmi-thunderbolt: failed setting %s\n",
-			       buf);
+		if (ACPI_FAILURE(status))
 			return -ENODEV;
-		}
 	} else {
-		pr_err("intel-wmi-thunderbolt: unsupported mode: %d", mode);
+		return -EINVAL;
 	}
 	return count;
 }
-- 
2.7.4
