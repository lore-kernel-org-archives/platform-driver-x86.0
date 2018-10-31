From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V4 3/5]  misc/pvpanic: add MMIO support
Date: Wed, 31 Oct 2018 21:37:19 +0800
Message-ID: <1540993041-25611-3-git-send-email-peng.hao2@zte.com.cn>
References: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

On some architectures (e.g. arm64), it's preferable to use MMIO, since
this can be used standalone. Add MMIO support to the pvpanic driver.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 9450376..d0e28b2 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -28,7 +28,7 @@
 
 #define PVPANIC_PANICKED	(1 << 0)
 
-static u16 port;
+static void __iomem *base;
 
 static struct acpi_driver pvpanic_driver = {
 	.name =		"pvpanic",
@@ -44,7 +44,7 @@
 static void
 pvpanic_send_event(unsigned int event)
 {
-	outb(event, port);
+	iowrite8(event, base);
 }
 
 static int
@@ -64,12 +64,21 @@
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
 {
+	struct resource r;
+
 	switch (res->type) {
 	case ACPI_RESOURCE_TYPE_END_TAG:
 		return AE_OK;
 
 	case ACPI_RESOURCE_TYPE_IO:
-		port = res->data.io.minimum;
+		if (acpi_dev_resource_io(res, &r))
+			base = (void __iomem *) ioport_map(r.start,
+						r.end - r.start + 1);
+		return AE_OK;
+
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		if (acpi_dev_resource_memory(res, &r))
+			base = ioremap(r.start, r.end - r.start + 1);
 		return AE_OK;
 
 	default:
@@ -91,7 +100,7 @@ static int pvpanic_add(struct acpi_device *device)
 	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
 			    pvpanic_walk_resources, NULL);
 
-	if (!port)
+	if (!base)
 		return -ENODEV;
 
 	atomic_notifier_chain_register(&panic_notifier_list,
@@ -105,6 +114,9 @@ static int pvpanic_remove(struct acpi_device *device)
 
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					 &pvpanic_panic_nb);
+	if (base)
+		iounmap(base);
+
 	return 0;
 }
 
-- 
1.8.3.1
