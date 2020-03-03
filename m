From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] tools/power/x86/intel-speed-select: Fix mailbox usage for CLOS_PM_QOS_CONFIG
Date: Tue,  3 Mar 2020 14:50:43 -0800
Message-ID: <20200303225044.362525-2-srinivas.pandruvada@linux.intel.com>
References: <20200303225044.362525-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200303225044.362525-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Even for the products using MMIO, this message needs to be sent via
mail box. The previous fix done for this didn't properly address this.
That fix simply removed sending command via MMIO, but still didn't
trigger sending via mailbox.

Add additional condition to check for CLOS_PM_QOS_CONFIG, when MMIO
is supported on a platform.

Fixes: cd0e63706549 (tools/power/x86/intel-speed-select: Use mailbox for CLOS_PM_QOS_CONFIG)
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 0cf3548681f8..50db0cd23d8c 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -572,7 +572,8 @@ int isst_send_mbox_command(unsigned int cpu, unsigned char command,
 		"mbox_send: cpu:%d command:%x sub_command:%x parameter:%x req_data:%x\n",
 		cpu, command, sub_command, parameter, req_data);
 
-	if (isst_platform_info.mmio_supported && command == CONFIG_CLOS) {
+	if (isst_platform_info.mmio_supported && command == CONFIG_CLOS &&
+	    sub_command != CLOS_PM_QOS_CONFIG) {
 		unsigned int value;
 		int write = 0;
 		int clos_id, core_id, ret = 0;
-- 
2.24.1
