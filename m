From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 05/10] tools/power/x86/intel-speed-select: Use mailbox for CLOS_PM_QOS_CONFIG
Date: Mon,  4 Nov 2019 03:02:41 -0800
Message-ID: <20191104110246.70465-6-srinivas.pandruvada@linux.intel.com>
References: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Use mailbox to read/write CLOS_PM_QOS_CONFIG instead of read/write to
MMIO offset.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index c563ecaf44e1..2a3650f025b9 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -574,12 +574,6 @@ int isst_send_mbox_command(unsigned int cpu, unsigned char command,
 			if (!ret && !write)
 				*resp = value;
 			break;
-		case CLOS_PM_QOS_CONFIG:
-			ret = isst_send_mmio_command(cpu, PM_QOS_CONFIG_OFFSET,
-						     write, &value);
-			if (!ret && !write)
-				*resp = value;
-			break;
 		case CLOS_STATUS:
 			break;
 		default:
-- 
2.17.2
