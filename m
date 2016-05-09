From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v3 2/2] dell-laptop: Expose auxiliary MAC address if available
Date: Mon,  9 May 2016 11:24:59 -0500
Message-ID: <1462811099-16897-2-git-send-email-mario_limonciello@dell.com>
References: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

System with Type-C ports have a feature to expose an auxiliary
persistent MAC address.  This address is burned in at the
factory.

The intention of this address is to update the MAC address on
Type-C docks containing an ethernet adapter to match the
auxiliary address of the system connected to them.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/dell-laptop.c | 61 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 2c2f02b..7d29690 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -87,6 +87,7 @@ static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 static bool force_rfkill;
+static char *auxiliary_mac_address;
 
 module_param(force_rfkill, bool, 0444);
 MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
@@ -273,6 +274,54 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
 	{ }
 };
 
+/* get_aux_mac
+ * returns the auxiliary mac address
+ * for assigning to a Type-C ethernet device
+ * such as that found in the Dell TB15 dock
+ */
+static int get_aux_mac(void)
+{
+	struct calling_interface_buffer *buffer;
+	unsigned char *extended_buffer;
+	size_t length;
+	int ret;
+
+	buffer = dell_smbios_get_buffer();
+	length = 17;
+	extended_buffer = dell_smbios_send_extended_request(11, 6, &length);
+	ret = buffer->output[0];
+	if (ret != 0 || !extended_buffer) {
+		pr_debug("get_aux_mac: ext buffer: %p, len: %lu, ret: %d\n",
+			 extended_buffer, length, ret);
+		auxiliary_mac_address = NULL;
+		goto auxout;
+	}
+
+	/* address will be stored in byte 4-> */
+	auxiliary_mac_address = kmalloc(length, GFP_KERNEL);
+	memcpy(auxiliary_mac_address, extended_buffer, length);
+
+ auxout:
+	dell_smbios_release_buffer();
+	return dell_smbios_error(ret);
+}
+
+static ssize_t auxiliary_mac_show(struct device *dev,
+				  struct device_attribute *attr, char *page)
+{
+	return sprintf(page, "%s\n", auxiliary_mac_address);
+}
+
+static DEVICE_ATTR_RO(auxiliary_mac);
+static struct attribute *dell_attributes[] = {
+	&dev_attr_auxiliary_mac.attr,
+	NULL
+};
+
+static const struct attribute_group dell_attr_group = {
+	.attrs = dell_attributes,
+};
+
 /*
  * Derived from information in smbios-wireless-ctl:
  *
@@ -392,7 +441,6 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
  *     cbArg1, byte0 = 0x13
  *     cbRes1 Standard return codes (0, -1, -2)
  */
-
 static int dell_rfkill_set(void *data, bool blocked)
 {
 	struct calling_interface_buffer *buffer;
@@ -2003,6 +2051,12 @@ static int __init dell_init(void)
 		goto fail_rfkill;
 	}
 
+	ret = get_aux_mac();
+	if (!ret) {
+		sysfs_create_group(&platform_device->dev.kobj,
+				   &dell_attr_group);
+	}
+
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_init(&platform_device->dev);
 
@@ -2064,6 +2118,11 @@ fail_platform_driver:
 
 static void __exit dell_exit(void)
 {
+	if (auxiliary_mac_address) {
+		sysfs_remove_group(&platform_device->dev.kobj,
+				   &dell_attr_group);
+		kfree(auxiliary_mac_address);
+	}
 	debugfs_remove_recursive(dell_laptop_dir);
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
-- 
2.7.4
