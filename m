From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 14/27] tools/power/x86/intel-speed-select: Display error for invalid priority type
Date: Thu,  5 Mar 2020 14:45:25 -0800
Message-ID: <20200305224538.490864-15-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

When priority type for core-power enable command is anything more than 1
display error before change to 1, which is ordered priority.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-core.c b/tools/power/x86/intel-speed-select/isst-core.c
index 732d9a5eacf1..f69c009ef6f6 100644
--- a/tools/power/x86/intel-speed-select/isst-core.c
+++ b/tools/power/x86/intel-speed-select/isst-core.c
@@ -897,6 +897,9 @@ int isst_pm_qos_config(int cpu, int enable_clos, int priority_type)
 	else
 		req = req & ~BIT(1);
 
+	if (priority_type > 1)
+		fprintf(stderr, "Invalid priority type: Changing type to ordered\n");
+
 	if (priority_type)
 		req = req | BIT(2);
 	else
-- 
2.24.1
