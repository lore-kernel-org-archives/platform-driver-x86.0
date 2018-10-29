From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V3 3/5]  misc/pvpanic: add MMIO support
Date: Mon, 29 Oct 2018 19:32:21 +0800
Message-ID: <1540812743-1825-3-git-send-email-peng.hao2@zte.com.cn>
References: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

On some architectures (e.g. arm64), it's preferable to use MMIO, since
this can be used standalone. Add MMIO support to the pvpanic driver.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 9450376..cfd7fef 100644
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
@@ -64,12 +64,19 @@
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
 {
+	struct acpi_resource_fixed_memory32 *fixmem32;
+
 	switch (res->type) {
 	case ACPI_RESOURCE_TYPE_END_TAG:
 		return AE_OK;
 
 	case ACPI_RESOURCE_TYPE_IO:
-		port = res->data.io.minimum;
+		base = (void __iomem *) ioport_map(res->data.io.minimum, 1);
+		return AE_OK;
+
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		fixmem32 = &res->data.fixed_memory32;
+		base = ioremap(fixmem32->address, fixmem32->address_length);
 		return AE_OK;
 
 	default:
@@ -91,7 +98,7 @@ static int pvpanic_add(struct acpi_device *device)
 	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
 			    pvpanic_walk_resources, NULL);
 
-	if (!port)
+	if (!base)
 		return -ENODEV;
 
 	atomic_notifier_chain_register(&panic_notifier_list,
@@ -105,6 +112,9 @@ static int pvpanic_remove(struct acpi_device *device)
 
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					 &pvpanic_panic_nb);
+
+	iounmap(base);
+
 	return 0;
 }
 
-- 
1.8.3.1
