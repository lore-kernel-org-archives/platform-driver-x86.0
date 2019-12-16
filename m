From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 3/5] acpi: device_pm: Add new Tiger Lake hardware ID to support ACPI device power management
Date: Mon, 16 Dec 2019 10:31:50 -0800
Message-ID: <ede54916a71e4e517b533f4e601be9c1284142d7.1576520244.git.gayatri.kammela@intel.com>
References: <cover.1576520244.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576520244.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576520244.git.gayatri.kammela@intel.com>
References: <cover.1576520244.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Tiger Lake has a new unique hardware ID that supports ACPI device power
management. Hence, add it to the list of special device power management
IDs.

Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/acpi/device_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 5e4a8860a9c0..b64c62bfcea5 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -1321,6 +1321,7 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
 	 */
 	static const struct acpi_device_id special_pm_ids[] = {
 		{"PNP0C0B", }, /* Generic ACPI fan */
+		{"INT1044", }, /* Fan for Tiger Lake generation */
 		{"INT3404", }, /* Fan */
 		{}
 	};
-- 
2.17.1
