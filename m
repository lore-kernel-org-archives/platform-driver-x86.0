From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [RESEND][PATCH v2] tools/power/x86/intel-speed-select: Add .gitignore file
Date: Wed, 10 Jul 2019 10:23:00 -0700
Message-ID: <20190710172300.70367-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, andriy.shevchenko@intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, David Arcari <darcari@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Prarit Bhargava <prarit@redhat.com>

Add a .gitignore file for build include/ and final binary.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: David Arcari <darcari@redhat.com>
---
 tools/power/x86/intel-speed-select/.gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 tools/power/x86/intel-speed-select/.gitignore

diff --git a/tools/power/x86/intel-speed-select/.gitignore b/tools/power/x86/intel-speed-select/.gitignore
new file mode 100644
index 000000000000..f61145925ce9
--- /dev/null
+++ b/tools/power/x86/intel-speed-select/.gitignore
@@ -0,0 +1,2 @@
+include/
+intel-speed-select
-- 
2.17.2
