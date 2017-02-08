From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: intel_pmc_ipc: fix division in 32-bit case
Date: Wed,  8 Feb 2017 18:00:28 +0200
Message-ID: <20170208160028.13308-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Shanth Murthy <shanth.murthy@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On 32-bit x86 platforms we can't do 64-bit divisions:

	ERROR: "__udivdi3" [drivers/platform/x86/intel_pmc_ipc.ko] undefined!

Replace plain division by do_div() macro call.

Reported-by: Darren Hart <dvhart@infradead.org>
Cc: Shanth Murthy <shanth.murthy@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 46202b6e7c87..8ad4d7b43423 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -62,7 +62,12 @@
 #define GCR_TELEM_SHLW_S0IX_OFFSET	0x1080
 
 /* Residency with clock rate at 19.2MHz to usecs */
-#define S0IX_RESIDENCY_IN_USECS(d, s)		(((d) + (s)) * 10 / 192)
+#define S0IX_RESIDENCY_IN_USECS(d, s)		\
+({						\
+	u64 result = 10ull * ((d) + (s));	\
+	do_div(result, 192);			\
+	result;					\
+})
 
 /*
  * 16-byte buffer for sending data associated with IPC command.
-- 
2.11.0
