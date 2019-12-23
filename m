From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 27/37] mfd: intel_soc_pmic_bxtwc: Convert to use new SCU IPC API
Date: Mon, 23 Dec 2019 17:17:06 +0300
Message-ID: <20191223141716.13727-28-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Convert the Intel Broxton Whiskey Cover PMIC driver to use the new SCU
IPC API. This allows us to get rid of the PMC IPC implementation which
is now covered in SCU IPC driver.

Also move PMIC specific IPC message constants to the PMIC driver from
the intel_pmc_ipc.h header.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 arch/x86/include/asm/intel_pmc_ipc.h |  3 ---
 drivers/mfd/intel_soc_pmic_bxtwc.c   | 22 +++++++++++++++-------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
index e6da1ce26256..b438a488f613 100644
--- a/arch/x86/include/asm/intel_pmc_ipc.h
+++ b/arch/x86/include/asm/intel_pmc_ipc.h
@@ -3,9 +3,6 @@
 #define  _ASM_X86_INTEL_PMC_IPC_H_
 
 /* Commands */
-#define PMC_IPC_PMIC_ACCESS		0xFF
-#define		PMC_IPC_PMIC_ACCESS_READ	0x0
-#define		PMC_IPC_PMIC_ACCESS_WRITE	0x1
 #define PMC_IPC_USB_PWR_CTRL		0xF0
 #define PMC_IPC_PMIC_BLACKLIST_SEL	0xEF
 #define PMC_IPC_PHY_CONFIG		0xEE
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 739cfb5b69fe..60aba2a1561c 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -15,7 +15,7 @@
 #include <linux/mfd/intel_soc_pmic_bxtwc.h>
 #include <linux/module.h>
 
-#include <asm/intel_pmc_ipc.h>
+#include <asm/intel_scu_ipc.h>
 
 /* PMIC device registers */
 #define REG_ADDR_MASK		0xFF00
@@ -58,6 +58,10 @@
 /* Whiskey Cove PMIC share same ACPI ID between different platforms */
 #define BROXTON_PMIC_WC_HRV	4
 
+#define PMC_PMIC_ACCESS		0xFF
+#define PMC_PMIC_READ		0x0
+#define PMC_PMIC_WRITE		0x1
+
 enum bxtwc_irqs {
 	BXTWC_PWRBTN_LVL1_IRQ = 0,
 	BXTWC_TMU_LVL1_IRQ,
@@ -288,9 +292,9 @@ static int regmap_ipc_byte_reg_read(void *context, unsigned int reg,
 
 	ipc_in[0] = reg;
 	ipc_in[1] = i2c_addr;
-	ret = intel_pmc_ipc_command(PMC_IPC_PMIC_ACCESS,
-			PMC_IPC_PMIC_ACCESS_READ,
-			ipc_in, sizeof(ipc_in), (u32 *)ipc_out, 1);
+	ret = intel_scu_ipc_dev_command(pmic->scu, PMC_PMIC_ACCESS,
+					PMC_PMIC_READ, ipc_in, sizeof(ipc_in),
+					ipc_out, sizeof(ipc_out));
 	if (ret) {
 		dev_err(pmic->dev, "Failed to read from PMIC\n");
 		return ret;
@@ -321,9 +325,9 @@ static int regmap_ipc_byte_reg_write(void *context, unsigned int reg,
 	ipc_in[0] = reg;
 	ipc_in[1] = i2c_addr;
 	ipc_in[2] = val;
-	ret = intel_pmc_ipc_command(PMC_IPC_PMIC_ACCESS,
-			PMC_IPC_PMIC_ACCESS_WRITE,
-			ipc_in, sizeof(ipc_in), NULL, 0);
+	ret = intel_scu_ipc_dev_command(pmic->scu, PMC_PMIC_ACCESS,
+					PMC_PMIC_WRITE, ipc_in, sizeof(ipc_in),
+					NULL, 0);
 	if (ret) {
 		dev_err(pmic->dev, "Failed to write to PMIC\n");
 		return ret;
@@ -457,6 +461,10 @@ static int bxtwc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, pmic);
 	pmic->dev = &pdev->dev;
 
+	pmic->scu = devm_intel_scu_ipc_dev_get(&pdev->dev);
+	if (!pmic->scu)
+		return -EPROBE_DEFER;
+
 	pmic->regmap = devm_regmap_init(&pdev->dev, NULL, pmic,
 					&bxtwc_regmap_config);
 	if (IS_ERR(pmic->regmap)) {
-- 
2.24.0
