From: Kuppuswamy Sathyanarayanan
        <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v5 1/6] platform/x86: intel_pmc_ipc: fix gcr offset
Date: Mon,  3 Apr 2017 17:24:29 -0700
Message-ID: <bf5a86829e9403d93e85270b2898b3c548417a05.1491264643.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <CAENHMvOyzbhDQzvpYFcxC9mvsfDGrco9RMy+rU=faT6RN_uW3A@mail.gmail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAENHMvOyzbhDQzvpYFcxC9mvsfDGrco9RMy+rU=faT6RN_uW3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, david.e.box-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rajneesh.bhardwaj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

According to Broxton APL PMC spec, gcr mem region starts
at offset 0x1000 from ipc mem base address. In this driver,
PLAT_RESOURCE_GCR_OFFSET macro defines the offset of GCR
memory region from IPC mem region. So we should use 0x1000(4K)
as GCR offset. But currently this driver uses 0x1008 as GCT
offset.This patch fixes this issue.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/platform/x86/intel_pmc_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes since v4:
 *  None

Changes since v3:
 * Updated the commit history

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 0651d47..0a33592 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -82,7 +82,7 @@
 /* exported resources from IFWI */
 #define PLAT_RESOURCE_IPC_INDEX		0
 #define PLAT_RESOURCE_IPC_SIZE		0x1000
-#define PLAT_RESOURCE_GCR_OFFSET	0x1008
+#define PLAT_RESOURCE_GCR_OFFSET	0x1000
 #define PLAT_RESOURCE_GCR_SIZE		0x1000
 #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
 #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
