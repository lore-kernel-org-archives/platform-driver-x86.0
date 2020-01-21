From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v4 26/38] mfd: intel_soc_pmic: Add SCU IPC member to struct intel_soc_pmic
Date: Tue, 21 Jan 2020 19:01:02 +0300
Message-ID: <20200121160114.60007-27-mika.westerberg@linux.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Both PMIC drivers (intel_soc_pmic_mrfld and intel_soc_pmic_bxtwc) will
be using this field going forward to access the SCU IPC instance.

While there add kernel-doc for the intel_soc_pmic structure.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/mfd/intel_soc_pmic.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/mfd/intel_soc_pmic.h b/include/linux/mfd/intel_soc_pmic.h
index bfecd6bd4990..1e462549f5f1 100644
--- a/include/linux/mfd/intel_soc_pmic.h
+++ b/include/linux/mfd/intel_soc_pmic.h
@@ -13,6 +13,20 @@
 
 #include <linux/regmap.h>
 
+/**
+ * struct intel_soc_pmic - Intel SoC PMIC data
+ * @irq: Master interrupt number of the parent PMIC device
+ * @regmap: Pointer to the parent PMIC device regmap structure
+ * @irq_chip_data: IRQ chip data for the PMIC itself
+ * @irq_chip_data_pwrbtn: Chained IRQ chip data for the power button
+ * @irq_chip_data_tmu: Chained IRQ chip data for the time management unit
+ * @irq_chip_data_bcu: Chained IRQ chip data for the burst control unit
+ * @irq_chip_data_adc: Chained IRQ chip data for the general purpose ADC
+ * @irq_chip_data_chgr: Chained IRQ chip data for the external charger
+ * @irq_chip_data_crit: Chained IRQ chip data for the critical event handler
+ * @dev: Pointer to the parent PMIC device
+ * @scu: Pointer to the SCU IPC device data structure
+ */
 struct intel_soc_pmic {
 	int irq;
 	struct regmap *regmap;
@@ -24,6 +38,7 @@ struct intel_soc_pmic {
 	struct regmap_irq_chip_data *irq_chip_data_chgr;
 	struct regmap_irq_chip_data *irq_chip_data_crit;
 	struct device *dev;
+	struct intel_scu_ipc_dev *scu;
 };
 
 int intel_soc_pmic_exec_mipi_pmic_seq_element(u16 i2c_address, u32 reg_address,
-- 
2.24.1
