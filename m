From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 2/2] dell-laptop: Expose auxiliary MAC address if available
Date: Sat,  7 May 2016 01:21:02 -0500
Message-ID: <1462602062-32404-2-git-send-email-mario_limonciello@dell.com>
References: <1462602062-32404-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462602062-32404-1-git-send-email-mario_limonciello@dell.com>
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
 drivers/platform/x86/dell-laptop.c | 62 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 2c2f02b..f818ddf 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -87,6 +87,7 @@ static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 static bool force_rfkill;
+static char *auxiliary_mac_address;
 
 module_param(force_rfkill, bool, 0444);
 MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
@@ -273,6 +274,58 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
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
+	int ret;
+	unsigned char *address =
+		(unsigned char *) __get_free_page(GFP_KERNEL | GFP_DMA32);
+
+	buffer = dell_smbios_get_buffer();
+
+	/* prepare a 17 byte buffer */
+	dell_smbios_prepare_v2_call(address, 17);
+	buffer->input[0] = virt_to_phys(address);
+	dell_smbios_send_request(11, 6);
+	ret = buffer->output[0];
+
+	if (ret != 0)
+		goto auxout;
+
+	dell_smbios_clear_buffer();
+
+	/* address will be stored in byte 4-> */
+	auxiliary_mac_address = kmalloc(13, GFP_KERNEL);
+	memcpy(auxiliary_mac_address, &address[4], 13);
+
+ auxout:
+	free_page((unsigned long)address);
+	dell_smbios_release_buffer();
+	return dell_smbios_error(ret);
+
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
+static const struct attribute_group dell_attr_group = {
+.attrs = dell_attributes,
+};
+
+
 /*
  * Derived from information in smbios-wireless-ctl:
  *
@@ -392,7 +445,6 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
  *     cbArg1, byte0 = 0x13
  *     cbRes1 Standard return codes (0, -1, -2)
  */
-
 static int dell_rfkill_set(void *data, bool blocked)
 {
 	struct calling_interface_buffer *buffer;
@@ -2003,6 +2055,12 @@ static int __init dell_init(void)
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
 
@@ -2048,6 +2106,7 @@ static int __init dell_init(void)
 		backlight_update_status(dell_backlight_device);
 	}
 
+
 	return 0;
 
 fail_backlight:
@@ -2064,6 +2123,7 @@ fail_platform_driver:
 
 static void __exit dell_exit(void)
 {
+	kfree(auxiliary_mac_address);
 	debugfs_remove_recursive(dell_laptop_dir);
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
-- 
2.7.4
