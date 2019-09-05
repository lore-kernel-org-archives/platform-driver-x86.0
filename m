From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH v2 3/9] tools/power/x86/intel-speed-select: Fix cpu-count output
Date: Thu,  5 Sep 2019 08:03:05 -0400
Message-ID: <20190905120311.15286-4-prarit@redhat.com>
References: <20190905120311.15286-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905120311.15286-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: andriy.shevchenko@intel.com, Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

I have a system with 28 threads/socket but intel-speed-select reports
a cpu-count of 29.

Fix an off-by-one error in the cpu_count() function.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: David Arcari <darcari@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 tools/power/x86/intel-speed-select/isst-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index d32af8210427..f81a28c6b586 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -304,7 +304,7 @@ static void set_cpu_present_cpu_mask(void)
 int get_cpu_count(int pkg_id, int die_id)
 {
 	if (pkg_id < MAX_PACKAGE_COUNT && die_id < MAX_DIE_PER_PACKAGE)
-		return cpu_cnt[pkg_id][die_id] + 1;
+		return cpu_cnt[pkg_id][die_id];
 
 	return 0;
 }
-- 
2.21.0
