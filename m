From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] platform/x86: intel_pmc_core: Mark local function static
Date: Tue, 26 Mar 2019 13:29:12 -0700
Message-ID: <1553632152-18888-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

0day reports:

drivers/platform/x86/intel_pmc_core.c:833:5: sparse:
	symbol 'quirk_xtal_ignore' was not declared. Should it be static?

Mark the function static since it is indeed only called locally.

Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Fixes: 238f9c11351f ("platform/x86: intel_pmc_core: Quirk to ignore XTAL shutdown")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f2c621b55f49..9908d233305e 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -828,7 +828,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
  * the platform BIOS enforces 24Mhx Crystal to shutdown
  * before PMC can assert SLP_S0#.
  */
-int quirk_xtal_ignore(const struct dmi_system_id *id)
+static int quirk_xtal_ignore(const struct dmi_system_id *id)
 {
 	struct pmc_dev *pmcdev = &pmc;
 	u32 value;
-- 
2.7.4
