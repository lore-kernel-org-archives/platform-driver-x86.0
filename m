From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH 2/3] Telemetry: remove redundant macro definition
Date: Fri, 14 Jul 2017 17:23:47 +0530
Message-ID: <1500033228-634-2-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1500033228-634-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500033228-634-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Telemetry driver includes intel_telemetry.h which defines
TELEM_MAX_OS_ALLOCATED_EVENTS already.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_telemetry_pltdrv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 6393b3b1d5a6..e0424d5a795a 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -46,7 +46,6 @@
 #define TELEM_SAMPLING_DEFAULT_PERIOD	0xD
 
 #define TELEM_MAX_EVENTS_SRAM		28
-#define TELEM_MAX_OS_ALLOCATED_EVENTS	20
 #define TELEM_SSRAM_STARTTIME_OFFSET	8
 #define TELEM_SSRAM_EVTLOG_OFFSET	16
 
-- 
2.7.4
