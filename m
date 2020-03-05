From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 24/27] tools/power/x86/intel-speed-select: Print friendly warning for bad command line
Date: Thu,  5 Mar 2020 14:45:35 -0800
Message-ID: <20200305224538.490864-25-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

When user specifies invalid option, display "Unknown Option: ignore",
instead of "no match". Also display error for garbage on the command
line.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 2a81fb881f04..924cb871d6d2 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -2400,9 +2400,12 @@ static void parse_cmd_args(int argc, int start, char **argv)
 			}
 			break;
 		default:
-			printf("no match\n");
+			printf("Unknown option: ignore\n");
 		}
 	}
+
+	if (argv[optind])
+		printf("Garbage at the end of command: ignore\n");
 }
 
 static void isst_help(void)
-- 
2.24.1
