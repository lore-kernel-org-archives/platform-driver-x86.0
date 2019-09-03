From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH 2/8] tools/power/x86/intel-speed-select: Fix help option typo
Date: Tue,  3 Sep 2019 11:37:28 -0400
Message-ID: <20190903153734.11904-3-prarit@redhat.com>
References: <20190903153734.11904-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903153734.11904-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Help is -h, not --h.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: David Arcari <darcari@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 tools/power/x86/intel-speed-select/isst-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 91c5ad1685a1..d32af8210427 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1491,7 +1491,7 @@ static void usage(void)
 	printf("intel-speed-select [OPTIONS] FEATURE COMMAND COMMAND_ARGUMENTS\n");
 	printf("\nUse this tool to enumerate and control the Intel Speed Select Technology features,\n");
 	printf("\nFEATURE : [perf-profile|base-freq|turbo-freq|core-power]\n");
-	printf("\nFor help on each feature, use --h|--help\n");
+	printf("\nFor help on each feature, use -h|--help\n");
 	printf("\tFor example:  intel-speed-select perf-profile -h\n");
 
 	printf("\nFor additional help on each command for a feature, use --h|--help\n");
-- 
2.21.0
