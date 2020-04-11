From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 013/149] tools/power/x86/intel-speed-select: Fix mailbox usage for CLOS_PM_QOS_CONFIG
Date: Sat, 11 Apr 2020 19:01:30 -0400
Message-ID: <20200411230347.22371-13-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

[ Upstream commit 8ddbda76245f5d10e00020db34455404019efc91 ]

Even for the products using MMIO, this message needs to be sent via
mail box. The previous fix done for this didn't properly address this.
That fix simply removed sending command via MMIO, but still didn't
trigger sending via mailbox.

Add additional condition to check for CLOS_PM_QOS_CONFIG, when MMIO
is supported on a platform.

Fixes: cd0e63706549 (tools/power/x86/intel-speed-select: Use mailbox for CLOS_PM_QOS_CONFIG)
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/power/x86/intel-speed-select/isst-config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 2b2b8167c65be..6a973e7832228 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -571,7 +571,8 @@ int isst_send_mbox_command(unsigned int cpu, unsigned char command,
 		"mbox_send: cpu:%d command:%x sub_command:%x parameter:%x req_data:%x\n",
 		cpu, command, sub_command, parameter, req_data);
 
-	if (isst_platform_info.mmio_supported && command == CONFIG_CLOS) {
+	if (isst_platform_info.mmio_supported && command == CONFIG_CLOS &&
+	    sub_command != CLOS_PM_QOS_CONFIG) {
 		unsigned int value;
 		int write = 0;
 		int clos_id, core_id, ret = 0;
-- 
2.20.1
