From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH 3/7] intel-speed-select: Add check for CascadeLake-N models
Date: Thu, 26 Sep 2019 08:54:57 -0400
Message-ID: <20190926125501.1616-4-prarit@redhat.com>
References: <20190926125501.1616-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926125501.1616-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Three CascadeLake-N models (6252N, 6230N, and 5218N) have SST-PBF support.

Return an error if the CascadeLake processor is not one of these specific
models.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index bb6f8f5986c9..ae8e3b5153ad 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -71,7 +71,7 @@ void debug_printf(const char *format, ...)
 	va_end(args);
 }
 
-static void update_cpu_model(void)
+static int update_cpu_model(void)
 {
 	unsigned int ebx, ecx, edx;
 	unsigned int fms, family;
@@ -81,6 +81,32 @@ static void update_cpu_model(void)
 	cpu_model = (fms >> 4) & 0xf;
 	if (family == 6 || family == 0xf)
 		cpu_model += ((fms >> 16) & 0xf) << 4;
+
+	/* only three CascadeLake-N models are supported */
+	if (cpu_model == 0x55) {
+		FILE *fp;
+		size_t n;
+		char *line;
+		int ret = 1;
+
+		fp = fopen("/proc/cpuinfo", "r");
+		if (!fp)
+			err(-1, "cannot open /proc/cpuinfo\n");
+
+		while (getline(&line, &n, fp) > 0) {
+			if (strstr(line, "model name")) {
+				if (strstr(line, "6252N") ||
+				    strstr(line, "6230N") ||
+				    strstr(line, "5218N"))
+					ret = 0;
+				break;
+			}
+		}
+		free(line);
+		fclose(fp);
+		return ret;
+	}
+	return 0;
 }
 
 /* Open a file, and exit on failure */
@@ -1638,7 +1664,9 @@ static void cmdline(int argc, char **argv)
 		fprintf(stderr, "Feature name and|or command not specified\n");
 		exit(0);
 	}
-	update_cpu_model();
+	ret = update_cpu_model();
+	if (ret)
+		err(-1, "Invalid CPU model (%d)\n", cpu_model);
 	printf("Intel(R) Speed Select Technology\n");
 	printf("Executing on CPU model:%d[0x%x]\n", cpu_model, cpu_model);
 	set_max_cpu_num();
-- 
2.21.0
