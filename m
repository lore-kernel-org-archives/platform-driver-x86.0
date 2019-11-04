From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 10/10] tools/power/x86/intel-speed-select: Increment version
Date: Mon,  4 Nov 2019 03:02:46 -0800
Message-ID: <20191104110246.70465-11-srinivas.pandruvada@linux.intel.com>
References: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Since the tool now adds support for another Intel SST implementation,
increment version number.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index e0bad43697dc..944183f9ed5a 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -15,7 +15,7 @@ struct process_cmd_struct {
 	int arg;
 };
 
-static const char *version_str = "v1.0";
+static const char *version_str = "v1.1";
 static const int supported_api_ver = 1;
 static struct isst_if_platform_info isst_platform_info;
 static char *progname;
-- 
2.17.2
