From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 36/37] mfd: intel_pmc_bxt: Switch to use driver->dev_groups
Date: Mon, 23 Dec 2019 17:17:15 +0300
Message-ID: <20191223141716.13727-37-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The driver core provides support for adding additional attributes for
devices via new ->dev_groups member of struct device_driver. Convert the
driver to use that instead of adding the attributes manually.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mfd/intel_pmc_bxt.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/intel_pmc_bxt.c b/drivers/mfd/intel_pmc_bxt.c
index 1591e4ecf5e5..ff3f6cd63531 100644
--- a/drivers/mfd/intel_pmc_bxt.c
+++ b/drivers/mfd/intel_pmc_bxt.c
@@ -244,6 +244,11 @@ static const struct attribute_group intel_pmc_group = {
 	.attrs = intel_pmc_attrs,
 };
 
+static const struct attribute_group *intel_pmc_groups[] = {
+	&intel_pmc_group,
+	NULL,
+};
+
 static int pmc_create_punit_device(void)
 {
 	struct mfd_cell punit = {
@@ -492,27 +497,14 @@ static int intel_pmc_probe(struct platform_device *pdev)
 	ret = pmc_create_devices();
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to create pmc devices\n");
-		goto err_ipc;
-	}
-
-	ret = sysfs_create_group(&pdev->dev.kobj, &intel_pmc_group);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
-			ret);
-		goto err_ipc;
+		intel_scu_ipc_remove(scu);
 	}
 
-	return 0;
-
-err_ipc:
-	intel_scu_ipc_remove(scu);
-
 	return ret;
 }
 
 static int intel_pmc_remove(struct platform_device *pdev)
 {
-	sysfs_remove_group(&pdev->dev.kobj, &intel_pmc_group);
 	intel_scu_ipc_remove(platform_get_drvdata(pdev));
 	pmcdev.dev = NULL;
 	return 0;
@@ -524,6 +516,7 @@ static struct platform_driver intel_pmc_driver = {
 	.driver = {
 		.name = "intel_pmc_bxt",
 		.acpi_match_table = ACPI_PTR(intel_pmc_acpi_ids),
+		.dev_groups = intel_pmc_groups,
 	},
 };
 
-- 
2.24.0
