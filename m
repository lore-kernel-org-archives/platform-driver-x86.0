From: Colin King <colin.king@canonical.com>
Subject: [PATCH] intel_menlow: set cdev after null device check to avoid null pointer dereference
Date: Mon, 28 Mar 2016 17:18:39 +0100
Message-ID: <1459181919-13825-1-git-send-email-colin.king@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51053 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754002AbcC1QSo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 12:18:44 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sujith Thomas <sujith.thomas@intel.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

intel_menlow_memory_remove sanity checks to see if device is null, however,
this check is performed after we have already passed device into a call
to acpi_driver_data.  If device is null, then acpi_driver_data will produce
a null pointer dereference on device. The correct action is to sanity check
device, then assign cdev, then check if cdev is null.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/intel_menlow.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel_menlow.c
index 0a919d8..185a1bd 100644
--- a/drivers/platform/x86/intel_menlow.c
+++ b/drivers/platform/x86/intel_menlow.c
@@ -196,9 +196,13 @@ static int intel_menlow_memory_add(struct acpi_device *device)
 
 static int intel_menlow_memory_remove(struct acpi_device *device)
 {
-	struct thermal_cooling_device *cdev = acpi_driver_data(device);
+	struct thermal_cooling_device *cdev;
+
+	if (!device)
+		return -EINVAL;
 
-	if (!device || !cdev)
+	cdev = acpi_driver_data(device);
+	if (!cdev)
 		return -EINVAL;
 
 	sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
-- 
2.7.4
