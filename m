From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 4/4] thermal: int340x_thermal: Add new Tiger Lake hardware IDs to support thermal driver
Date: Fri, 13 Dec 2019 10:14:23 -0800
Message-ID: <8964445c268f61beb8fbaa3f54b469ddd7f8cafa.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Tiger Lake has a new unique hardware IDs to support thermal driver.
Hence, add them.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhang rui <rui.zhang@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 1 +
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
index 3517883b5cdb..efae0c02d898 100644
--- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -369,6 +369,7 @@ static int int3400_thermal_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3400_thermal_match[] = {
+	{"INT1040", 0},
 	{"INT3400", 0},
 	{}
 };
diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
index a7bbd8584ae2..aeece1e136a5 100644
--- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
@@ -282,6 +282,7 @@ static int int3403_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3403_device_ids[] = {
+	{"INT1043", 0},
 	{"INT3403", 0},
 	{"", 0},
 };
-- 
2.17.1
