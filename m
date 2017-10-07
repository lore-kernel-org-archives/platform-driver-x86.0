From: sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [RFC v4 5/8] platform/x86: intel_punit_ipc: Fix resource ioremap warning
Date: Fri,  6 Oct 2017 19:33:59 -0700
Message-ID: <e677dbe8c35639f64cb2beb753b0550998176f74.1507340643.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1507340643.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1507340643.git.sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

For PUNIT device, ISPDRIVER_IPC and GTDDRIVER_IPC resources are
not mandatory. So when PMC IPC driver creates a PUNIT device, if
these resources are not available then it creates dummy resource
entries for these missing resources. But during PUNIT device probe
, doing ioremap on these dummy resources generates following warning
messages.

intel_punit_ipc intel_punit_ipc: can't request region for resource [mem
0x00000000]
intel_punit_ipc intel_punit_ipc: can't request region for resource [mem
0x00000000]
intel_punit_ipc intel_punit_ipc: can't request region for resource [mem
0x00000000]
intel_punit_ipc intel_punit_ipc: can't request region for resource [mem
0x00000000]

This patch fixes this issue by adding extra check for resource size
before performing ioremap operation.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/platform/x86/intel_punit_ipc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
index a47a41f..b5b8901 100644
--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -252,28 +252,28 @@ static int intel_punit_get_bars(struct platform_device *pdev)
 	 * - GTDRIVER_IPC BASE_IFACE
 	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	if (res) {
+	if (res && resource_size(res) > 1) {
 		addr = devm_ioremap_resource(&pdev->dev, res);
 		if (!IS_ERR(addr))
 			punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-	if (res) {
+	if (res && resource_size(res) > 1) {
 		addr = devm_ioremap_resource(&pdev->dev, res);
 		if (!IS_ERR(addr))
 			punit_ipcdev->base[ISPDRIVER_IPC][BASE_IFACE] = addr;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 4);
-	if (res) {
+	if (res && resource_size(res) > 1) {
 		addr = devm_ioremap_resource(&pdev->dev, res);
 		if (!IS_ERR(addr))
 			punit_ipcdev->base[GTDRIVER_IPC][BASE_DATA] = addr;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 5);
-	if (res) {
+	if (res && resource_size(res) > 1) {
 		addr = devm_ioremap_resource(&pdev->dev, res);
 		if (!IS_ERR(addr))
 			punit_ipcdev->base[GTDRIVER_IPC][BASE_IFACE] = addr;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
