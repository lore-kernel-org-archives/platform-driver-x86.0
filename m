From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 2/4] acpi: fan: Add new Tiger Lake hardware ID to support fan driver in acpi
Date: Fri, 13 Dec 2019 10:14:21 -0800
Message-ID: <3c1ed2c9964c63fc956ec249d7bfce8d49f53fee.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576260216.git.gayatri.kammela@intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Tiger Lake has a new unique hardware ID to support fan driver. Hence,
add it.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/acpi/fan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/fan.c b/drivers/acpi/fan.c
index 816b0803f7fb..13708fb48038 100644
--- a/drivers/acpi/fan.c
+++ b/drivers/acpi/fan.c
@@ -25,6 +25,7 @@ static int acpi_fan_remove(struct platform_device *pdev);
 
 static const struct acpi_device_id fan_device_ids[] = {
 	{"PNP0C0B", 0},
+	{"INT1044", 0},
 	{"INT3404", 0},
 	{"", 0},
 };
-- 
2.17.1
