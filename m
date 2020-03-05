From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 23/27] tools/power/x86/intel-speed-select: Fix avx options for turbo-freq feature
Date: Thu,  5 Mar 2020 14:45:34 -0800
Message-ID: <20200305224538.490864-24-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Specifying "avx2" and "avx512" option for display filter doesn't work
with short option "-r", only works with --try-type. Also compare full
6 characters for "avx512" string.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index a44ec2f76f52..2a81fb881f04 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -2329,7 +2329,7 @@ static void parse_cmd_args(int argc, int start, char **argv)
 	option_index = start;
 
 	optind = start + 1;
-	while ((opt = getopt_long(argc, argv, "b:l:t:c:d:e:n:m:p:w:hoa",
+	while ((opt = getopt_long(argc, argv, "b:l:t:c:d:e:n:m:p:w:r:hoa",
 				  long_options, &option_index)) != -1) {
 		switch (opt) {
 		case 'a':
@@ -2355,7 +2355,7 @@ static void parse_cmd_args(int argc, int start, char **argv)
 				fact_avx = 0x01;
 			} else if (!strncmp(optarg, "avx2", 4)) {
 				fact_avx = 0x02;
-			} else if (!strncmp(optarg, "avx512", 4)) {
+			} else if (!strncmp(optarg, "avx512", 6)) {
 				fact_avx = 0x04;
 			} else {
 				fprintf(outf, "Invalid sse,avx options\n");
-- 
2.24.1
