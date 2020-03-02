From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 08/19] platform/x86: intel_scu_ipc: Add managed function to register SCU IPC
Date: Mon,  2 Mar 2020 16:33:16 +0300
Message-ID: <20200302133327.55929-9-mika.westerberg@linux.intel.com>
References: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Drivers such as intel_pmc_ipc.c can be unloaded as well so in order to
support those in this driver add a new function that can be called to
unregister the SCU IPC when it is not needed anymore.

We also add a managed version of the intel_scu_ipc_register() that takes
care of calling intel_scu_ipc_unregister() automatically when the driver
is unbound.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h | 10 +++++
 drivers/platform/x86/intel_scu_ipc.c | 62 ++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index d5f6ae514172..11d457af68c5 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -25,6 +25,16 @@ __intel_scu_ipc_register(struct device *parent,
 #define intel_scu_ipc_register(parent, scu_data)  \
 	__intel_scu_ipc_register(parent, scu_data, THIS_MODULE)
 
+void intel_scu_ipc_unregister(struct intel_scu_ipc_dev *scu);
+
+struct intel_scu_ipc_dev *
+__devm_intel_scu_ipc_register(struct device *parent,
+			      const struct intel_scu_ipc_data *scu_data,
+			      struct module *owner);
+
+#define devm_intel_scu_ipc_register(parent, scu_data)  \
+	__devm_intel_scu_ipc_register(parent, scu_data, THIS_MODULE)
+
 struct intel_scu_ipc_dev *intel_scu_ipc_dev_get(void);
 void intel_scu_ipc_dev_put(struct intel_scu_ipc_dev *scu);
 struct intel_scu_ipc_dev *devm_intel_scu_ipc_dev_get(struct device *dev);
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 608034ea7af5..d9cf7f7602b0 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -637,6 +637,68 @@ __intel_scu_ipc_register(struct device *parent,
 }
 EXPORT_SYMBOL_GPL(__intel_scu_ipc_register);
 
+/**
+ * intel_scu_ipc_unregister() - Unregister SCU IPC
+ * @scu: SCU IPC handle
+ *
+ * This unregisters the SCU IPC device and releases the acquired
+ * resources once the refcount goes to zero.
+ */
+void intel_scu_ipc_unregister(struct intel_scu_ipc_dev *scu)
+{
+	mutex_lock(&ipclock);
+	if (!WARN_ON(!ipcdev)) {
+		ipcdev = NULL;
+		device_unregister(&scu->dev);
+	}
+	mutex_unlock(&ipclock);
+}
+EXPORT_SYMBOL_GPL(intel_scu_ipc_unregister);
+
+static void devm_intel_scu_ipc_unregister(struct device *dev, void *res)
+{
+	struct intel_scu_ipc_devres *dr = res;
+	struct intel_scu_ipc_dev *scu = dr->scu;
+
+	intel_scu_ipc_unregister(scu);
+}
+
+/**
+ * __devm_intel_scu_ipc_register() - Register managed SCU IPC device
+ * @parent: Parent device
+ * @scu_data: Data used to configure SCU IPC
+ * @owner: Module registering the SCU IPC device
+ *
+ * Call this function to register managed SCU IPC mechanism under
+ * @parent. Returns pointer to the new SCU IPC device or ERR_PTR() in
+ * case of failure. The caller may use the returned instance if it needs
+ * to do SCU IPC calls itself.
+ */
+struct intel_scu_ipc_dev *
+__devm_intel_scu_ipc_register(struct device *parent,
+			      const struct intel_scu_ipc_data *scu_data,
+			      struct module *owner)
+{
+	struct intel_scu_ipc_devres *dr;
+	struct intel_scu_ipc_dev *scu;
+
+	dr = devres_alloc(devm_intel_scu_ipc_unregister, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return NULL;
+
+	scu = __intel_scu_ipc_register(parent, scu_data, owner);
+	if (IS_ERR(scu)) {
+		devres_free(dr);
+		return scu;
+	}
+
+	dr->scu = scu;
+	devres_add(parent, dr);
+
+	return scu;
+}
+EXPORT_SYMBOL_GPL(__devm_intel_scu_ipc_register);
+
 static int __init intel_scu_ipc_init(void)
 {
 	return class_register(&intel_scu_ipc_class);
-- 
2.25.0
