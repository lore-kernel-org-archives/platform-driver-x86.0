From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 2/5] acpi: fan: Add new Tiger Lake hardware ID to support fan driver in ACPI
Date: Mon, 16 Dec 2019 10:31:49 -0800
Message-ID: <161ebb92ec8a841c1cb10331ef7cc182d1027a78.1576520244.git.gayatri.kammela@intel.com>
References: <cover.1576520244.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576520244.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576520244.git.gayatri.kammela@intel.com>
References: <cover.1576520244.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Tiger Lake has a new unique hardware ID to support fan driver. Hence,
add it.

Cc: Rafael J. Wysocki <rafael@kernel.org>
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
