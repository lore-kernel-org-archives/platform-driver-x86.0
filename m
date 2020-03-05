From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 15/27] tools/power/x86/intel-speed-select: Enhance help for core-power assoc
Date: Thu,  5 Mar 2020 14:45:26 -0800
Message-ID: <20200305224538.490864-16-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Enhance help to specify CPU and clos by an example.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 4230a19664d3..75c8e1a933ef 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -2104,6 +2104,10 @@ static void set_clos_assoc(int arg)
 		fprintf(stderr, "Associate a clos id to a CPU\n");
 		fprintf(stderr,
 			"\tSpecify targeted clos id with [--clos|-c]\n");
+		fprintf(stderr,
+			"\tFor example to associate clos 1 to CPU 0: issue\n");
+		fprintf(stderr,
+			"\tintel-speed-select --cpu 0 core-power assoc --clos 1\n");
 		exit(0);
 	}
 
-- 
2.24.1
