From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: Remove warning for unused result
Date: Mon,  7 Oct 2019 09:47:54 -0700
Message-ID: <20191007164754.21125-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix warning for:
isst-config.c: In function ‘set_cpu_online_offline’:
isst-config.c:221:3: warning: ignoring return value of ‘write’,
declared with attribute warn_unused_result [-Wunused-result]
   write(fd, "1\n", 2);

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 2a9890c8395a..21fcfe621d3a 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -169,7 +169,7 @@ int get_topo_max_cpus(void)
 static void set_cpu_online_offline(int cpu, int state)
 {
 	char buffer[128];
-	int fd;
+	int fd, ret;
 
 	snprintf(buffer, sizeof(buffer),
 		 "/sys/devices/system/cpu/cpu%d/online", cpu);
@@ -179,9 +179,12 @@ static void set_cpu_online_offline(int cpu, int state)
 		err(-1, "%s open failed", buffer);
 
 	if (state)
-		write(fd, "1\n", 2);
+		ret = write(fd, "1\n", 2);
 	else
-		write(fd, "0\n", 2);
+		ret = write(fd, "0\n", 2);
+
+	if (ret == -1)
+		perror("Online/Offline: Operation failed\n");
 
 	close(fd);
 }
-- 
2.17.2
