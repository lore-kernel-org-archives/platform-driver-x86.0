From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V2 2/4]  misc/pvpanic: add MMIO support
Date: Thu, 25 Oct 2018 01:12:14 +0800
Message-ID: <1540401136-78500-2-git-send-email-peng.hao2@zte.com.cn>
References: <1540401136-78500-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540401136-78500-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

On some architectures (e.g. arm64), it's preferable to use MMIO, since
this can be used standalone. Add MMIO support to the pvpanic driver.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index fd86dab..bcfefdd 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -43,6 +43,8 @@
 
 static u16 port;
 
+static void __iomem *base;
+
 static struct acpi_driver pvpanic_driver = {
 	.name =		"pvpanic",
 	.class =	"QEMU",
@@ -57,7 +59,10 @@
 static void
 pvpanic_send_event(unsigned int event)
 {
-	outb(event, port);
+	if (port)
+		outb(event, port);
+	else if (base)
+		writeb(event, base);
 }
 
 static int
@@ -77,6 +82,8 @@
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
 {
+	struct acpi_resource_fixed_memory32 *fixmem32;
+
 	switch (res->type) {
 	case ACPI_RESOURCE_TYPE_END_TAG:
 		return AE_OK;
@@ -85,6 +92,11 @@
 		port = res->data.io.minimum;
 		return AE_OK;
 
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		fixmem32 = &res->data.fixed_memory32;
+		base = ioremap(fixmem32->address, fixmem32->address_length);
+		return AE_OK;
+
 	default:
 		return AE_ERROR;
 	}
@@ -104,7 +116,7 @@ static int pvpanic_add(struct acpi_device *device)
 	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
 			    pvpanic_walk_resources, NULL);
 
-	if (!port)
+	if (!port && !base)
 		return -ENODEV;
 
 	atomic_notifier_chain_register(&panic_notifier_list,
@@ -118,6 +130,8 @@ static int pvpanic_remove(struct acpi_device *device)
 
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					 &pvpanic_panic_nb);
+	if (base)
+		iounmap(base);
 	return 0;
 }
 
-- 
1.8.3.1
