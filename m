From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 05/27] tools/power/x86/intel-speed-select: Special handling for CPU 0 online/offline
Date: Thu,  5 Mar 2020 14:45:16 -0800
Message-ID: <20200305224538.490864-6-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

When "-o" option for force online/offline is used with command:
perf-profile set-config-level

If the config level calls for CPU 0 online/offline, then call fails
as there is special kernel setup required for CPU 0 online/offline
and the currently not setup for that.

But when call is for online CPU 0, then don't fail. Just warn that
this system is not setup for CPU 0 online/offline.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 405b03cba248..b8f4846d7c78 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -220,8 +220,14 @@ static void set_cpu_online_offline(int cpu, int state)
 		 "/sys/devices/system/cpu/cpu%d/online", cpu);
 
 	fd = open(buffer, O_WRONLY);
-	if (fd < 0)
+	if (fd < 0) {
+		if (!cpu && state) {
+			fprintf(stderr, "This system is not configured for CPU 0 online/offline\n");
+			fprintf(stderr, "Ignoring online request for CPU 0 as this is already online\n");
+			return;
+		}
 		err(-1, "%s open failed", buffer);
+	}
 
 	if (state)
 		ret = write(fd, "1\n", 2);
-- 
2.24.1
