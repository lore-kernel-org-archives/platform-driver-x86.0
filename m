From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 3/3] thermal: int340x_thermal: fix: Update Tiger Lake ACPI device IDs
Date: Fri, 27 Mar 2020 13:24:54 -0700
Message-ID: <376696de4a8b18d57a3b45ce7902b24e383b1f1b.1585335927.git.gayatri.kammela@intel.com>
References: <cover.1585335927.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1585335927.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1585335927.git.gayatri.kammela@intel.com>
References: <cover.1585335927.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, lenb@kernel.org, dvhart@infradead.org, alex.hung@canonical.com, rui.zhang@intel.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Tiger Lake's new unique ACPI device IDs for Intel thermal driver are not
valid because of missing 'C' in the IDs. Fix the IDs by updating them.

After the update, the new IDs should now look like
INT1040 --> INTC1040
INT1043 --> INTC1043

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Suggested-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 2 +-
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
index efae0c02d898..71a9877b85a5 100644
--- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -369,7 +369,7 @@ static int int3400_thermal_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3400_thermal_match[] = {
-	{"INT1040", 0},
+	{"INTC1040", 0},
 	{"INT3400", 0},
 	{}
 };
diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
index aeece1e136a5..3849d5869609 100644
--- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
@@ -282,7 +282,7 @@ static int int3403_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int3403_device_ids[] = {
-	{"INT1043", 0},
+	{"INTC1043", 0},
 	{"INT3403", 0},
 	{"", 0},
 };
-- 
2.17.1
