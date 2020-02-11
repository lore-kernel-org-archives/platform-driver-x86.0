From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v5 10/18] mfd: intel_soc_pmic_bxtwc: Convert to use new SCU IPC API
Date: Tue, 11 Feb 2020 16:25:55 +0300
Message-ID: <20200211132603.73509-11-mika.westerberg@linux.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Convert the Intel Broxton Whiskey Cover PMIC driver to use the new SCU
IPC API. This allows us to get rid of the PMC IPC implementation which
is now covered in SCU IPC driver. We drop the error log if the IPC
command fails because intel_scu_ipc_dev_command() does that already.

Also move PMIC specific IPC message constants to the PMIC driver from
the intel_pmc_ipc.h header.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_pmc_ipc.h |  3 ---
 drivers/mfd/intel_soc_pmic_bxtwc.c   | 34 ++++++++++++++--------------
 2 files changed, 17 insertions(+), 20 deletions(-)

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
index 739cfb5b69fe..eba89780dbe7 100644
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
@@ -288,13 +292,12 @@ static int regmap_ipc_byte_reg_read(void *context, unsigned int reg,
 
 	ipc_in[0] = reg;
 	ipc_in[1] = i2c_addr;
-	ret = intel_pmc_ipc_command(PMC_IPC_PMIC_ACCESS,
-			PMC_IPC_PMIC_ACCESS_READ,
-			ipc_in, sizeof(ipc_in), (u32 *)ipc_out, 1);
-	if (ret) {
-		dev_err(pmic->dev, "Failed to read from PMIC\n");
+	ret = intel_scu_ipc_dev_command(pmic->scu, PMC_PMIC_ACCESS,
+					PMC_PMIC_READ, ipc_in, sizeof(ipc_in),
+					ipc_out, sizeof(ipc_out));
+	if (ret)
 		return ret;
-	}
+
 	*val = ipc_out[0];
 
 	return 0;
@@ -303,7 +306,6 @@ static int regmap_ipc_byte_reg_read(void *context, unsigned int reg,
 static int regmap_ipc_byte_reg_write(void *context, unsigned int reg,
 				       unsigned int val)
 {
-	int ret;
 	int i2c_addr;
 	u8 ipc_in[3];
 	struct intel_soc_pmic *pmic = context;
@@ -321,15 +323,9 @@ static int regmap_ipc_byte_reg_write(void *context, unsigned int reg,
 	ipc_in[0] = reg;
 	ipc_in[1] = i2c_addr;
 	ipc_in[2] = val;
-	ret = intel_pmc_ipc_command(PMC_IPC_PMIC_ACCESS,
-			PMC_IPC_PMIC_ACCESS_WRITE,
-			ipc_in, sizeof(ipc_in), NULL, 0);
-	if (ret) {
-		dev_err(pmic->dev, "Failed to write to PMIC\n");
-		return ret;
-	}
-
-	return 0;
+	return intel_scu_ipc_dev_command(pmic->scu, PMC_PMIC_ACCESS,
+					 PMC_PMIC_WRITE, ipc_in, sizeof(ipc_in),
+					 NULL, 0);
 }
 
 /* sysfs interfaces to r/w PMIC registers, required by initial script */
@@ -457,6 +453,10 @@ static int bxtwc_probe(struct platform_device *pdev)
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
2.25.0
