From: Lu Wei <luwei32@huawei.com>
Subject: [PATCH v2] ACPI / platform: Fix return value check in check_acpi_dev()
Date: Fri, 5 Jun 2020 19:38:14 +0800
Message-ID: <1591357094-39850-1-git-send-email-luwei32@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alex.hung@canonical.com, dvhart@infradead.org, andy@infradead.org, acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In the function check_acpi_dev(), if it fails to create
platform device, the return value is ERR_PTR() or NULL. Thus it must
use IS_ERR_OR_NULL to check return value.

Fixes: ecc83e52b28c (intel-hid: new hid event driver for hotkeys)
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lu Wei <luwei32@huawei.com>
---
v1->v2
 - Modify commit message
 drivers/platform/x86/intel-hid.c  | 2 +-
 drivers/platform/x86/intel-vbtn.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index cc7dd4d..c45250c 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -564,7 +564,7 @@ check_acpi_dev(acpi_handle handle, u32 lvl, void *context, void **rv)
 		return AE_OK;
 
 	if (acpi_match_device_ids(dev, ids) == 0)
-		if (acpi_create_platform_device(dev, NULL))
+		if (!IS_ERR_OR_NULL(acpi_create_platform_device(dev, NULL)))
 			dev_info(&dev->dev,
 				 "intel-hid: created platform device\n");
 
diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index b588093..e1aa526 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -251,7 +251,7 @@ check_acpi_dev(acpi_handle handle, u32 lvl, void *context, void **rv)
 		return AE_OK;
 
 	if (acpi_match_device_ids(dev, ids) == 0)
-		if (acpi_create_platform_device(dev, NULL))
+		if (!IS_ERR_OR_NULL(acpi_create_platform_device(dev, NULL)))
 			dev_info(&dev->dev,
 				 "intel-vbtn: created platform device\n");
 
-- 
2.7.4
