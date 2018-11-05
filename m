From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V7 3/9]  misc/pvpanic: add MMIO support
Date: Mon, 5 Nov 2018 18:40:25 +0800
Message-ID: <1541414431-84128-3-git-send-email-peng.hao2@zte.com.cn>
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

On some architectures (e.g. arm64), it's preferable to use MMIO, since
this can be used standalone. Add MMIO support to the pvpanic driver.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
[Use acpi_dev_resource_memory API. - Andy] 
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 49c59e1..22fb487 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -41,7 +41,7 @@
 
 #define PVPANIC_PANICKED	(1 << 0)
 
-static u16 port;
+static void __iomem *base;
 
 static struct acpi_driver pvpanic_driver = {
 	.name =		"pvpanic",
@@ -57,7 +57,7 @@
 static void
 pvpanic_send_event(unsigned int event)
 {
-	outb(event, port);
+	 iowrite8(event, base);
 }
 
 static int
@@ -80,7 +80,11 @@
 	struct resource r;
 
 	if (acpi_dev_resource_io(res, &r)) {
-		port = r.start;
+		base = (void __iomem *) ioport_map(r.start,
+					r.end - r.start + 1);
+		return AE_OK;
+	} else if (acpi_dev_resource_memory(res, &r)) {
+		base = ioremap(r.start, r.end - r.start + 1);
 		return AE_OK;
 	}
 
@@ -101,7 +105,7 @@ static int pvpanic_add(struct acpi_device *device)
 	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
 			    pvpanic_walk_resources, NULL);
 
-	if (!port)
+	if (!base)
 		return -ENODEV;
 
 	atomic_notifier_chain_register(&panic_notifier_list,
@@ -115,6 +119,8 @@ static int pvpanic_remove(struct acpi_device *device)
 
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					 &pvpanic_panic_nb);
+	iounmap(base);
+
 	return 0;
 }
 
-- 
1.8.3.1
