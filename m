From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V8 06/11]  misc/pvpanic : grouping ACPI related stuff
Date: Tue, 6 Nov 2018 22:57:17 +0800
Message-ID: <1541516242-98568-6-git-send-email-peng.hao2@zte.com.cn>
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

Grouping ACPI related stuff and make preparation to break
the ACPI dependency w/o any functional change.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index c7f62bd..a9676b7 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -32,32 +32,12 @@
 
 static void __iomem *base;
 
+#define PVPANIC_PANICKED        (1 << 0)
+
 MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
 MODULE_DESCRIPTION("pvpanic device driver");
 MODULE_LICENSE("GPL");
 
-static int pvpanic_add(struct acpi_device *device);
-static int pvpanic_remove(struct acpi_device *device);
-
-static const struct acpi_device_id pvpanic_device_ids[] = {
-	{ "QEMU0001", 0 },
-	{ "", 0 },
-};
-MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
-
-#define PVPANIC_PANICKED	(1 << 0)
-
-static struct acpi_driver pvpanic_driver = {
-	.name =		"pvpanic",
-	.class =	"QEMU",
-	.ids =		pvpanic_device_ids,
-	.ops =		{
-				.add =		pvpanic_add,
-				.remove =	pvpanic_remove,
-			},
-	.owner =	THIS_MODULE,
-};
-
 static void
 pvpanic_send_event(unsigned int event)
 {
@@ -77,6 +57,25 @@
 	.priority = 1, /* let this called before broken drm_fb_helper */
 };
 
+static int pvpanic_add(struct acpi_device *device);
+static int pvpanic_remove(struct acpi_device *device);
+
+static const struct acpi_device_id pvpanic_device_ids[] = {
+	{ "QEMU0001", 0 },
+	{ "", 0 },
+};
+MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
+
+static struct acpi_driver pvpanic_driver = {
+	.name =		"pvpanic",
+	.class =	"QEMU",
+	.ids =		pvpanic_device_ids,
+	.ops =		{
+				.add =		pvpanic_add,
+				.remove =	pvpanic_remove,
+			},
+	.owner =	THIS_MODULE,
+};
 
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
-- 
1.8.3.1
