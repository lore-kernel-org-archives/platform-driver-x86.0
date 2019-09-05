From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH v2 8/9] tools/power/x86/intel-speed-select: Output success/failed for command output
Date: Thu,  5 Sep 2019 08:03:10 -0400
Message-ID: <20190905120311.15286-9-prarit@redhat.com>
References: <20190905120311.15286-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905120311.15286-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: andriy.shevchenko@intel.com, Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Command output has confusing data, returning "0" on success.  For example

|# ./intel-speed-select -c 14 turbo-freq enable
Intel(R) Speed Select Technology
Executing on CPU model:106[0x6a]
 package-1
   die-0
     cpu-14
       turbo-freq
         enable:0

To avoid confusion change the command output to 'success' or 'failed'.

v2: Remove help output line.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: David Arcari <darcari@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 tools/power/x86/intel-speed-select/isst-config.c  | 1 -
 tools/power/x86/intel-speed-select/isst-display.c | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index f81a28c6b586..78f0cebda1da 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1514,7 +1514,6 @@ static void usage(void)
 	printf("\tResult display uses a common format for each command:\n");
 	printf("\tResults are formatted in text/JSON with\n");
 	printf("\t\tPackage, Die, CPU, and command specific results.\n");
-	printf("\t\t\tFor Set commands, status is 0 for success and rest for failures\n");
 	exit(1);
 }
 
diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index 890a01bfee4b..8500cf2997a6 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -519,7 +519,10 @@ void isst_display_result(int cpu, FILE *outf, char *feature, char *cmd,
 	snprintf(header, sizeof(header), "%s", feature);
 	format_and_print(outf, 4, header, NULL);
 	snprintf(header, sizeof(header), "%s", cmd);
-	snprintf(value, sizeof(value), "%d", result);
+	if (!result)
+		snprintf(value, sizeof(value), "success");
+	else
+		snprintf(value, sizeof(value), "failed(error %d)", result);
 	format_and_print(outf, 5, header, value);
 
 	format_and_print(outf, 1, NULL, NULL);
-- 
2.21.0
