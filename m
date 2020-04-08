From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/6] platform/x86: intel_cht_int33fe: Switch to use acpi_dev_hid_uid_match()
Date: Wed,  8 Apr 2020 19:09:05 +0300
Message-ID: <20200408160905.12101-6-andriy.shevchenko@linux.intel.com>
References: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200408160905.12101-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Since we have a generic helper, drop custom implementation in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_cht_int33fe_typec.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
index 904e75d39953..e89defb33067 100644
--- a/drivers/platform/x86/intel_cht_int33fe_typec.c
+++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
@@ -40,16 +40,13 @@ static int cht_int33fe_check_for_max17047(struct device *dev, void *data)
 {
 	struct i2c_client **max17047 = data;
 	struct acpi_device *adev;
-	const char *hid;
 
 	adev = ACPI_COMPANION(dev);
 	if (!adev)
 		return 0;
 
-	hid = acpi_device_hid(adev);
-
 	/* The MAX17047 ACPI node doesn't have an UID, so we don't check that */
-	if (strcmp(hid, "MAX17047"))
+	if (!acpi_dev_hid_uid_match(adev, "MAX17047", NULL))
 		return 0;
 
 	*max17047 = to_i2c_client(dev);
-- 
2.25.1
