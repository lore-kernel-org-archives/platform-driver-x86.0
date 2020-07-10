From: Lu Wei <luwei32@huawei.com>
Subject: [PATCH v3 2/2] intel-vbtn: Fix return value check in check_acpi_dev()
Date: Fri, 10 Jul 2020 17:04:23 +0800
Message-ID: <1594371863-20827-3-git-send-email-luwei32@huawei.com>
References: <1594371863-20827-1-git-send-email-luwei32@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1594371863-20827-1-git-send-email-luwei32@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alex.hung@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, acelan.kao@canonical.com, andy.shevchenko@gmail.com, luwei32@huawei.com
List-Id: platform-driver-x86.vger.kernel.org

In the function check_acpi_dev(), if it fails to create
platform device, the return value is ERR_PTR() or NULL.
Thus it must use IS_ERR_OR_NULL to check return value.

Fixes: 332e0812 ("intel-vbtn: new driver for Intel Virtual Button")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lu Wei <luwei32@huawei.com>
---
v2->v3
- Modify format

 drivers/platform/x86/intel-vbtn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
