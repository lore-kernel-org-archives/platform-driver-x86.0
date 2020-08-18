From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3] platform/x86: thinkpad_acpi: psensor
 interface
Date: Tue, 18 Aug 2020 15:15:58 -0400
Message-ID: <20200818191558.280009-1-markpearson@lenovo.com>
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
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Some Lenovo Thinkpad platforms are equipped with a 'palm sensor' so as
to be able to determine if a user is physically proximate to the device.

This patch provides the ability to retrieve the psensor state via sysfs
entrypoints and will be used by userspace for WWAN functionality to
control the transmission level safely

Co-developed-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
 - addressed formatting and coding style errors identified during review
Changes in v3:
 - I had missed updating thinkpad-acpi.rst in the v2 update so adding
   that back so it is correct. 

 .../admin-guide/laptops/thinkpad-acpi.rst     |  18 +++
 drivers/platform/x86/thinkpad_acpi.c          | 107 +++++++++++++++++-
 2 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 5e477869df18..6b57c52d8f13 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -51,6 +51,7 @@ detailed description):
 	- UWB enable and disable
 	- LCD Shadow (PrivacyGuard) enable and disable
 	- Lap mode sensor
+        - Palm sensor (aka psensor)
 
 A compatibility table by model and feature is maintained on the web
 site, http://ibm-acpi.sf.net/. I appreciate any success or failure
@@ -1447,6 +1448,23 @@ they differ between desk and lap mode.
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+Palm sensor
+------------------
+
+sysfs: psensor_state
+
+Certain thinkpads and mobile workstations are equipped with a palm sensor to
+detect when a user is physically near the device. This device, when present,
+is used in conjunction with the lapmode sensor to decide if WWAN transmission
+can be increased to maximum power.
+
+The property is read-only. If the platform doesn't have support the sysfs
+class is not created.
+
+Note - some platforms have a limitation whereby the EC firmware cannot
+determine if the sensor is installed or not. On these platforms the psensor
+state will always be reported as true to avoid high power being used incorrectly.
+
 EXPERIMENTAL: UWB
 -----------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 4864a5c189d4..41b75dd4755c 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4079,10 +4079,9 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	case TP_HKEY_EV_PALM_DETECTED:
 	case TP_HKEY_EV_PALM_UNDETECTED:
-		/* palm detected hovering the keyboard, forward to user-space
-		 * via netlink for consumption */
+		/* palm detected - pass on to event handler */
+		tpacpi_driver_event(hkey);
 		return true;
-
 	default:
 		/* report simply as unknown, no sensor dump */
 		return false;
@@ -9916,6 +9915,99 @@ static struct ibm_struct dytc_driver_data = {
 	.exit = dytc_exit,
 };
 
+/**********************************************************************
+ * Palm sensor subdriver
+ */
+
+#define PSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
+#define PSENSOR_ON_BIT      1 /* psensor status */
+
+static bool psensor_state;
+
+static void psensor_notify_change(void)
+{
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "psensor_state");
+}
+
+static int psensor_get(bool *state)
+{
+	acpi_handle psensor_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
+		return -ENODEV;
+
+	if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
+		return -EIO;
+
+	/* Check if sensor has a Psensor */
+	if (!(output & BIT(PSENSOR_PRESENT_BIT)))
+		return -ENODEV;
+
+	/* Return if psensor is set or not */
+	*state = output & BIT(PSENSOR_ON_BIT) ? true : false;
+	return 0;
+}
+
+static void psensor_state_refresh(void)
+{
+	bool new_state;
+	int err;
+
+	err = psensor_get(&new_state);
+	if (err || (new_state == psensor_state))
+		return;
+
+	psensor_state = new_state;
+	psensor_notify_change();
+}
+
+/* sysfs psensor entry */
+static ssize_t psensor_state_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	return sprintf(buf, "%d\n", psensor_state);
+}
+static DEVICE_ATTR_RO(psensor_state);
+
+static struct attribute *psensor_attributes[] = {
+	&dev_attr_psensor_state.attr,
+	NULL
+};
+
+static const struct attribute_group psensor_attr_group = {
+	.attrs = psensor_attributes,
+};
+
+static int tpacpi_psensor_init(struct ibm_init_struct *iibm)
+{
+	int err;
+
+	err = psensor_get(&psensor_state);
+	/*
+	 * If support isn't available (ENODEV) then don't return an error,
+	 * just don't create the sysfs group.
+	 */
+	if (err == -ENODEV)
+		return 0;
+	/* For all other errors we can flag the failure */
+	if (err)
+		return err;
+
+	return sysfs_create_group(&tpacpi_pdev->dev.kobj, &psensor_attr_group);
+}
+
+static void psensor_exit(void)
+{
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &psensor_attr_group);
+}
+
+static struct ibm_struct psensor_driver_data = {
+	.name = "psensor",
+	.exit = psensor_exit,
+};
+
 /****************************************************************************
  ****************************************************************************
  *
@@ -9967,6 +10059,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
 		dytc_lapmode_refresh();
 
+	if ((hkey_event == TP_HKEY_EV_PALM_DETECTED) ||
+		(hkey_event == TP_HKEY_EV_PALM_UNDETECTED))
+		psensor_state_refresh();
+
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
@@ -10409,6 +10505,11 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_dytc_init,
 		.data = &dytc_driver_data,
 	},
+	{
+		.init = tpacpi_psensor_init,
+		.data = &psensor_driver_data,
+	},
+
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
-- 
2.26.2
