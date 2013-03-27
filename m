From: Colin King <colin.king@canonical.com>
Subject: [PATCH] intel_menlow: avoid null pointer deference error
Date: Wed, 27 Mar 2013 14:29:45 +0000
Message-ID: <1364394585-20191-1-git-send-email-colin.king@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59995 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619Ab3C0O3u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Mar 2013 10:29:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sujith Thomas <sujith.thomas@intel.com>, Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix a null pointer deference by acpi_driver_data() if device is
null.  We should only set cdev and check this is OK after we are
sure device is not null.

Smatch analysis:
drivers/platform/x86/intel_menlow.c:207 intel_menlow_memory_remove()
  warn: variable dereferenced before check 'device' (see line 205)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/intel_menlow.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel_menlow.c
index d6cfc15..42691c6 100644
--- a/drivers/platform/x86/intel_menlow.c
+++ b/drivers/platform/x86/intel_menlow.c
@@ -202,9 +202,13 @@ static int intel_menlow_memory_add(struct acpi_device *device)
 
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
1.8.1.2
