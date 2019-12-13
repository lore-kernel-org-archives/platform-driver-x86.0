From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 3/4] platform/x86: intel-hid: Add new Tiger Lake hardware ID to support HID driver
Date: Fri, 13 Dec 2019 10:14:22 -0800
Message-ID: <a70a856e9a87c89ba92da514c1dda1f46f10b0de.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>, Zhang Rui <rui.zhang@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Tiger Lake has a new unique hardware ID to support Intel's HID event
filter driver. Hence, add it.

Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel-hid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index ef6d4bd77b1a..43d590250228 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -19,6 +19,7 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alex Hung");
 
 static const struct acpi_device_id intel_hid_ids[] = {
+	{"INT1051", 0},
 	{"INT33D5", 0},
 	{"", 0},
 };
-- 
2.17.1
