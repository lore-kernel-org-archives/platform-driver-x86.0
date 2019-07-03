From: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 20/35] platform/x86/asus: Use kmemdup rather than duplicating its implementation
Date: Thu,  4 Jul 2019 00:29:51 +0800
Message-ID: <20190703162951.32737-1-huangfq.daxian@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fuqian Huang <huangfq.daxian@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)
  - Split into two patches.

 drivers/platform/x86/asus-wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9b18a184e0aa..472b317ad814 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -260,12 +260,11 @@ static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
 	 * Copy to dma capable address otherwise memory corruption occurs as
 	 * bios has to be able to access it.
 	 */
-	input.pointer = kzalloc(args.length, GFP_DMA | GFP_KERNEL);
+	input.pointer = kmemdup(args.pointer, args.length, GFP_DMA | GFP_KERNEL);
 	input.length = args.length;
 	if (!input.pointer)
 		return -ENOMEM;
 	phys_addr = virt_to_phys(input.pointer);
-	memcpy(input.pointer, args.pointer, args.length);
 
 	status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_AGFN,
 					phys_addr, 0, &retval);
-- 
2.11.0
