From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 28/36] mfd: intel_soc_pmic_mrfld: Convert to use new SCU IPC API
Date: Mon, 13 Jan 2020 16:56:15 +0300
Message-ID: <20200113135623.56286-29-mika.westerberg@linux.intel.com>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This converts the Intel Merrifield PMIC driver over the new SCU IPC API
where the SCU IPC instance is passed to the functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/intel_soc_pmic_mrfld.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 26a1551c5faf..bd94c989d232 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -74,10 +74,11 @@ static const struct mfd_cell bcove_dev[] = {
 static int bcove_ipc_byte_reg_read(void *context, unsigned int reg,
 				    unsigned int *val)
 {
+	struct intel_soc_pmic *pmic = context;
 	u8 ipc_out;
 	int ret;
 
-	ret = intel_scu_ipc_ioread8(reg, &ipc_out);
+	ret = intel_scu_ipc_dev_ioread8(pmic->scu, reg, &ipc_out);
 	if (ret)
 		return ret;
 
@@ -88,10 +89,11 @@ static int bcove_ipc_byte_reg_read(void *context, unsigned int reg,
 static int bcove_ipc_byte_reg_write(void *context, unsigned int reg,
 				     unsigned int val)
 {
+	struct intel_soc_pmic *pmic = context;
 	u8 ipc_in = val;
 	int ret;
 
-	ret = intel_scu_ipc_iowrite8(reg, ipc_in);
+	ret = intel_scu_ipc_dev_iowrite8(pmic->scu, reg, ipc_in);
 	if (ret)
 		return ret;
 
@@ -117,6 +119,10 @@ static int bcove_probe(struct platform_device *pdev)
 	if (!pmic)
 		return -ENOMEM;
 
+	pmic->scu = devm_intel_scu_ipc_dev_get(dev);
+	if (!pmic->scu)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, pmic);
 	pmic->dev = &pdev->dev;
 
-- 
2.24.1
