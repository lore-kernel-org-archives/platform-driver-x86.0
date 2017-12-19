From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] platform/x86/mlxcpld-hotplug: Delete an error message for a
 failed memory allocation in mlxcpld_hotplug_attr_init()
Date: Tue, 19 Dec 2017 21:03:29 +0100
Message-ID: <679408d6-5412-562e-8051-319302635354@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Language: en-GB
Sender: kernel-janitors-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Dec 2017 20:56:56 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/platform/x86/mlxcpld-hotplug.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/mlxcpld-hotplug.c b/drivers/platform/x86/mlxcpld-hotplug.c
index aff3686b3b37..d45cb8be221f 100644
--- a/drivers/platform/x86/mlxcpld-hotplug.c
+++ b/drivers/platform/x86/mlxcpld-hotplug.c
@@ -165,11 +165,8 @@ static int mlxcpld_hotplug_attr_init(struct mlxcpld_hotplug_priv_data *priv)
 			PRIV_DEV_ATTR(i).nr = MLXCPLD_HOTPLUG_ATTR_TYPE_FAN;
 		}
 
-		if (!PRIV_ATTR(i)->name) {
-			dev_err(&priv->pdev->dev, "Memory allocation failed for sysfs attribute %d.\n",
-				i + 1);
+		if (!PRIV_ATTR(i)->name)
 			return -ENOMEM;
-		}
 
 		PRIV_DEV_ATTR(i).dev_attr.attr.name = PRIV_ATTR(i)->name;
 		PRIV_DEV_ATTR(i).dev_attr.attr.mode = S_IRUGO;
-- 
2.15.1

