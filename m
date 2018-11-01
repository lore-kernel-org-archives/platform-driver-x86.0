From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V5 5/8]  misc/pvpanic: simplify the code using acpi_dev_resource_io
Date: Thu, 1 Nov 2018 23:09:59 +0800
Message-ID: <1541085002-42993-5-git-send-email-peng.hao2@zte.com.cn>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

use acpi_dev_resource_io API.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 0bcf1cd..c20fdff 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -64,17 +64,15 @@
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
+
 }
 
 static int pvpanic_add(struct acpi_device *device)
-- 
1.8.3.1
