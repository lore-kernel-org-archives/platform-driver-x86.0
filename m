From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] isst: isst_if.h: drop a duplicated word
Date: Sat, 18 Jul 2020 17:29:03 -0700
Message-ID: <20200719002903.20469-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Drop the repeated word "for" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
---
This description could still use some better wording.

 include/uapi/linux/isst_if.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/include/uapi/linux/isst_if.h
+++ linux-next-20200717/include/uapi/linux/isst_if.h
@@ -69,7 +69,7 @@ struct isst_if_cpu_maps {
  * @logical_cpu:	Logical CPU number to get target PCI device.
  * @reg:		PUNIT register offset
  * @value:		For write operation value to write and for
- *			for read placeholder read value
+ *			read placeholder read value
  *
  * Structure to specify read/write data to PUNIT registers.
  */
