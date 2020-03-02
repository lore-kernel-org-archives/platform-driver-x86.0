From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v7 17/19] platform/x86: intel_telemetry: Add telemetry_get_pltdata()
Date: Mon,  2 Mar 2020 16:33:25 +0300
Message-ID: <20200302133327.55929-18-mika.westerberg@linux.intel.com>
References: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add new function that allows telemetry modules to get pointer to the
platform specific configuration. This is needed to allow the telemetry
debugfs module to fetch PMC IPC instance in the subsequent patch.

This also allows us to replace telemetry_pltconfig_valid() with
telemetry_get_pltdata() as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_telemetry.h         |  2 +-
 drivers/platform/x86/intel_telemetry_core.c    | 17 ++++++-----------
 drivers/platform/x86/intel_telemetry_debugfs.c |  3 +--
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
index 274aaf0dae48..2c0e7d7a10e9 100644
--- a/arch/x86/include/asm/intel_telemetry.h
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -95,7 +95,7 @@ int telemetry_set_pltdata(const struct telemetry_core_ops *ops,
 
 int telemetry_clear_pltdata(void);
 
-int telemetry_pltconfig_valid(void);
+struct telemetry_plt_config *telemetry_get_pltdata(void);
 
 int telemetry_get_evtname(enum telemetry_unit telem_unit,
 			  const char **name, int len);
diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
index d4040bb222b4..fdf55b5d6948 100644
--- a/drivers/platform/x86/intel_telemetry_core.c
+++ b/drivers/platform/x86/intel_telemetry_core.c
@@ -353,21 +353,16 @@ int telemetry_clear_pltdata(void)
 EXPORT_SYMBOL_GPL(telemetry_clear_pltdata);
 
 /**
- * telemetry_pltconfig_valid() - Checkif platform config is valid
+ * telemetry_get_pltdata() - Return telemetry platform config
  *
- * Usage by other than telemetry module is invalid
- *
- * Return: 0 success, < 0 for failure
+ * May be used by other telemetry modules to get platform specific
+ * configuration.
  */
-int telemetry_pltconfig_valid(void)
+struct telemetry_plt_config *telemetry_get_pltdata(void)
 {
-	if (telm_core_conf.plt_config)
-		return 0;
-
-	else
-		return -EINVAL;
+	return telm_core_conf.plt_config;
 }
-EXPORT_SYMBOL_GPL(telemetry_pltconfig_valid);
+EXPORT_SYMBOL_GPL(telemetry_get_pltdata);
 
 static inline int telemetry_get_pssevtname(enum telemetry_unit telem_unit,
 					   const char **name, int len)
diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 8e3fb55ac1ae..85a456aa0ab9 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -911,8 +911,7 @@ static int __init telemetry_debugfs_init(void)
 
 	debugfs_conf = (struct telemetry_debugfs_conf *)id->driver_data;
 
-	err = telemetry_pltconfig_valid();
-	if (err < 0) {
+	if (!telemetry_get_pltdata()) {
 		pr_info("Invalid pltconfig, ensure IPC1 device is enabled in BIOS\n");
 		return -ENODEV;
 	}
-- 
2.25.0
