From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 16/21] platform/x86: intel-vbtn: Fix return value check in check_acpi_dev()
Date: Sat,  8 Aug 2020 19:39:36 -0400
Message-ID: <20200808233941.3619277-16-sashal@kernel.org>
References: <20200808233941.3619277-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200808233941.3619277-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Lu Wei <luwei32@huawei.com>, Hulk Robot <hulkci@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Lu Wei <luwei32@huawei.com>

[ Upstream commit 64dd4a5a7d214a07e3d9f40227ec30ac8ba8796e ]

In the function check_acpi_dev(), if it fails to create
platform device, the return value is ERR_PTR() or NULL.
Thus it must use IS_ERR_OR_NULL() to check return value.

Fixes: 332e081225fc ("intel-vbtn: new driver for Intel Virtual Button")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Lu Wei <luwei32@huawei.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel-vbtn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index d122f33d43acb..c7c8b432c163f 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -272,7 +272,7 @@ check_acpi_dev(acpi_handle handle, u32 lvl, void *context, void **rv)
 		return AE_OK;
 
 	if (acpi_match_device_ids(dev, ids) == 0)
-		if (acpi_create_platform_device(dev, NULL))
+		if (!IS_ERR_OR_NULL(acpi_create_platform_device(dev, NULL)))
 			dev_info(&dev->dev,
 				 "intel-vbtn: created platform device\n");
 
-- 
2.25.1
