From: Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] intel_menlow: avoid null pointer deference error
Date: Wed, 29 May 2019 09:55:51 +0800
Message-ID: <1559094951-25391-1-git-send-email-92siuyang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sujith.thomas@intel.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Young Xiao <92siuyang@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix a null pointer deference by acpi_driver_data() if device is
null (dereference before check). We should only set cdev and check
this is OK after we are sure device is not null.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 drivers/platform/x86/intel_menlow.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel_menlow.c
index 77eb870..28feb5c 100644
--- a/drivers/platform/x86/intel_menlow.c
+++ b/drivers/platform/x86/intel_menlow.c
@@ -180,9 +180,13 @@ static int intel_menlow_memory_add(struct acpi_device *device)
 
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
