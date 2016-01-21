From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH] MAINTAINERS: Combine multiple telemetry entries
Date: Thu, 21 Jan 2016 09:30:50 +0530
Message-ID: <1453348850-18866-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch combines all the telemetry file entries in MAINTAINERS via
wildcard.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 MAINTAINERS |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cb872cb..02a330c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5695,10 +5695,8 @@ INTEL TELEMETRY DRIVER
 M:	Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/intel_telemetry_core.c
 F:	arch/x86/include/asm/intel_telemetry.h
-F:	drivers/platform/x86/intel_telemetry_pltdrv.c
-F:	drivers/platform/x86/intel_telemetry_debugfs.c
+F:	drivers/platform/x86/intel_telemetry*
 
 IOC3 ETHERNET DRIVER
 M:	Ralf Baechle <ralf@linux-mips.org>
-- 
1.7.9.5
