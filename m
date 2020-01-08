From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 24/36] platform/x86: intel_scu_ipc: Add function to remove SCU IPC
Date: Wed,  8 Jan 2020 14:41:49 +0300
Message-ID: <20200108114201.27908-25-mika.westerberg@linux.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Drivers such as intel_pmc_ipc.c can be unloaded as well so in order to
support those in this driver add a new function that can be called to
remove the SCU IPC if the driver is unloaded.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h |  1 +
 drivers/platform/x86/intel_scu_ipc.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index 9895b60386c5..250127eb1e38 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -32,6 +32,7 @@ struct intel_scu_ipc_pdata {
 
 struct intel_scu_ipc_dev *
 intel_scu_ipc_probe(struct device *dev, const struct intel_scu_ipc_pdata *pdata);
+void intel_scu_ipc_remove(struct intel_scu_ipc_dev *scu);
 
 struct intel_scu_ipc_dev *intel_scu_ipc_dev_get(void);
 void intel_scu_ipc_dev_put(struct intel_scu_ipc_dev *scu);
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index cc29f504adcf..9fa0ea95198b 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -566,3 +566,21 @@ intel_scu_ipc_probe(struct device *dev, const struct intel_scu_ipc_pdata *pdata)
 	return scu;
 }
 EXPORT_SYMBOL_GPL(intel_scu_ipc_probe);
+
+/**
+ * intel_scu_ipc_remove() - Remove SCU IPC
+ * @scu: SCU IPC handle
+ *
+ * This unregisters the SCU IPC device and releases the interrupt.
+ */
+void intel_scu_ipc_remove(struct intel_scu_ipc_dev *scu)
+{
+	mutex_lock(&ipclock);
+	if (!WARN_ON(!scu->dev)) {
+		if (scu->irq > 0)
+			devm_free_irq(scu->dev, scu->irq, scu);
+		scu->dev = NULL;
+	}
+	mutex_unlock(&ipclock);
+}
+EXPORT_SYMBOL_GPL(intel_scu_ipc_remove);
-- 
2.24.1
