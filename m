From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5] platform/x86: thinkpad_acpi: lap or
 desk mode interface
Date: Thu, 2 Jul 2020 21:23:53 -0400
Message-ID: <20200703012353.26413-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org
Cc: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Newer Lenovo Thinkpad platforms have support to identify whether the
system is on-lap or not using an ACPI DYTC event from the firmware.

This patch provides the ability to retrieve the current mode via sysfs
entrypoints and will be used by userspace for thermal mode and WWAN
functionality

Co-developed-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Reviewed-by: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Reviewed-by: Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
---
Changes in v5:
 - Updated with review changes from Andy Shevchenko
 - Added ABI information to thinkpad-acpi.rst
 - improved error handling and parameter passing as recommended
 - code cleanup as recommended
 - added review tag from bnocera
Changes in v4:
 - Correct hotkey event comment as we're handling event
 - Remove unnecessary check in dytc_lapmode_refresh
Changes in v3:
- Fixed inaccurate comments
- Used BIT macro to check lapmode bit setting as recommended and update
  define name
- Check for new_state == dytc_lapmode in dytc_lapmode_refresh
Changes in v2:
- cleaned up initialisation sequence to be cleaner and avoid spamming
  platforms that don't have DYTC with warning message. Tested on P52
- Adding platform-driver-x86 mailing list for review as requested

 .../admin-guide/laptops/thinkpad-acpi.rst     |  15 +++
 drivers/platform/x86/thinkpad_acpi.c          | 111 +++++++++++++++++-
 2 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 822907dcc845..99066aa8d97b 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -50,6 +50,7 @@ detailed description):
 	- WAN enable and disable
 	- UWB enable and disable
 	- LCD Shadow (PrivacyGuard) enable and disable
+	- Lap mode sensor
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1432,6 +1433,20 @@ The first command ensures the best viewing angle and the latter one turns
 on the feature, restricting the viewing angles.
 
 
+DYTC Lapmode sensor
+------------------
+
+sysfs: dytc_lapmode
+
+Newer thinkpads and mobile workstations have the ability to determine if
+the device is in deskmode or lapmode. This feature is used by user space
+to decide if WWAN transmission can be increased to maximum power and is
+also useful for understanding the different thermal modes available as
+they differ between desk and lap mode.
+
+The property is read-only. If the platform doesn't have support the sysfs
+class is not created.
+
 EXPERIMENTAL: UWB
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ff7f0a4f2475..037eb77414f9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4022,8 +4022,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		return true;
 	case TP_HKEY_EV_THM_CSM_COMPLETED:
 		pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
-		/* recommended action: do nothing, we don't have
-		 * Lenovo ATM information */
+		/* Thermal event - pass on to event handler */
+		tpacpi_driver_event(hkey);
 		return true;
 	case TP_HKEY_EV_THM_TRANSFM_CHANGED:
 		pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
@@ -9795,6 +9795,105 @@ static struct ibm_struct lcdshadow_driver_data = {
 	.write = lcdshadow_write,
 };
 
+/*************************************************************************
+ * DYTC subdriver, for the Lenovo lapmode feature
+ */
+
+#define DYTC_CMD_GET          2 /* To get current IC function and mode */
+#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
+
+static bool dytc_lapmode;
+
+static void dytc_lapmode_notify_change(void)
+{
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
+}
+
+static int dytc_command(int command, int *output)
+{
+	acpi_handle dytc_handle;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
+		/* Platform doesn't support DYTC */
+		return -ENODEV;
+	}
+	if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
+		return -EIO;
+	return 0;
+}
+
+static int dytc_lapmode_get(bool *state)
+{
+	int output, err;
+
+	err = dytc_command(DYTC_CMD_GET, &output);
+	if (err)
+		return err;
+	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
+	return 0;
+}
+
+static void dytc_lapmode_refresh(void)
+{
+	bool new_state;
+	int err;
+
+	err = dytc_lapmode_get(&new_state);
+	if (err || (new_state == dytc_lapmode))
+		return;
+
+	dytc_lapmode = new_state;
+	dytc_lapmode_notify_change();
+}
+
+/* sysfs lapmode entry */
+static ssize_t dytc_lapmode_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
+}
+
+static DEVICE_ATTR_RO(dytc_lapmode);
+
+static struct attribute *dytc_attributes[] = {
+	&dev_attr_dytc_lapmode.attr,
+	NULL,
+};
+
+static const struct attribute_group dytc_attr_group = {
+	.attrs = dytc_attributes,
+};
+
+static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
+{
+	int err;
+
+	err = dytc_lapmode_get(&dytc_lapmode);
+	/* If support isn't available (ENODEV) then don't return an error
+	 * but just don't create the sysfs group
+	 */
+	if (err == -ENODEV)
+		return 0;
+	/* For all other errors we can flag the failure */
+	if (err)
+		return err;
+
+	/* Platform supports this feature - create the group */
+	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
+	return err;
+}
+
+static void dytc_exit(void)
+{
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
+}
+
+static struct ibm_struct dytc_driver_data = {
+	.name = "dytc",
+	.exit = dytc_exit,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -9842,6 +9941,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 
 		mutex_unlock(&kbdlight_mutex);
 	}
+
+	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
+		dytc_lapmode_refresh();
+
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
@@ -10280,6 +10383,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_lcdshadow_init,
 		.data = &lcdshadow_driver_data,
 	},
+	{
+		.init = tpacpi_dytc_init,
+		.data = &dytc_driver_data,
+	},
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.26.2
