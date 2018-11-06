From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH v8 02/11]  misc/pvpanic: simplify the code using acpi_dev_resource_io
Date: Tue, 6 Nov 2018 22:57:13 +0800
Message-ID: <1541516242-98568-2-git-send-email-peng.hao2@zte.com.cn>
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

Use acpi_dev_resource_io API.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index fd86dab..49c59e1 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -77,17 +77,14 @@
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
 {
-	switch (res->type) {
-	case ACPI_RESOURCE_TYPE_END_TAG:
-		return AE_OK;
+	struct resource r;
 
-	case ACPI_RESOURCE_TYPE_IO:
-		port = res->data.io.minimum;
+	if (acpi_dev_resource_io(res, &r)) {
+		port = r.start;
 		return AE_OK;
-
-	default:
-		return AE_ERROR;
 	}
+
+	return AE_ERROR;
 }
 
 static int pvpanic_add(struct acpi_device *device)
-- 
1.8.3.1
