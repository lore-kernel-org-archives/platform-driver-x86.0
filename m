From: chris@cnpbagwell.com
Subject: [PATCH v2 2/2] eeepc-wmi: Add cpufv sysfs interface
Date: Mon, 11 Oct 2010 18:47:18 -0500
Message-ID: <1286840838-16844-2-git-send-email-chris@cnpbagwell.com>
References: <1286840838-16844-1-git-send-email-chris@cnpbagwell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:40472 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753754Ab0JKXrg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Oct 2010 19:47:36 -0400
Received: by gwj17 with SMTP id 17so1218530gwj.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2010 16:47:35 -0700 (PDT)
In-Reply-To: <1286840838-16844-1-git-send-email-chris@cnpbagwell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, corentin.chary@gmail.com, yong.y.wang@intel.com
Cc: Chris Bagwell <chris@cnpbagwell.com>

From: Chris Bagwell <chris@cnpbagwell.com>

eeepc-laptop provides a sysfs interface to read and control what it
calls cpufv.  When WMI is enabled, the ACPI interface changes slightly
and becames a write-only control with 3 valid values.

Expose cpufv again to allow for user space utils that can extended battery
life noticably and come a little closer to parity with eeepc-laptop.

Write-only is OK for most user space apps because read status was
mostly used to prevent unneeded mode changes.  Since this same check
to ignore changes to same mode also exists in the DSDT then it was
wasted ACPI call.

acpi_osi="!Windows 2009" can be used for get back eeepc-laptop's
read support of cpufv for debugging things such as behaviour
during resume.

This patch was tested with EEE PC 1005PE by monitoring powertop output while
writing values of "0", "1", and "2" and by reviewing the decompiled DSDT of
an 1201NL and comparing it to 1005PE's DSDT.

Signed-off-by: Chris Bagwell <chris@cnpbagwell.com>
---
 drivers/platform/x86/eeepc-wmi.c |   51 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 21df266..462ceab 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -57,6 +57,7 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 
 #define EEEPC_WMI_METHODID_DEVS	0x53564544
 #define EEEPC_WMI_METHODID_DSTS	0x53544344
+#define EEEPC_WMI_METHODID_CFVS	0x53564643
 
 #define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
 
@@ -297,6 +298,49 @@ static void eeepc_wmi_notify(u32 value, void *context)
 	kfree(obj);
 }
 
+static int store_cpufv(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
+{
+	int value;
+	struct acpi_buffer input = { (acpi_size)sizeof(value), &value };
+	acpi_status status;
+
+	if (!count || sscanf(buf, "%i", &value) != 1)
+		return -EINVAL;
+	if (value < 0 || value > 2)
+		return -EINVAL;
+
+	status = wmi_evaluate_method(EEEPC_WMI_MGMT_GUID,
+				     1, EEEPC_WMI_METHODID_CFVS, &input, NULL);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	else
+		return count;
+}
+
+static DEVICE_ATTR(cpufv, S_IRUGO | S_IWUSR, NULL, store_cpufv);
+
+static void eeepc_wmi_sysfs_exit(struct platform_device *device)
+{
+	device_remove_file(&device->dev, &dev_attr_cpufv);
+}
+
+static int eeepc_wmi_sysfs_init(struct platform_device *device)
+{
+	int retval = -ENOMEM;
+
+	retval = device_create_file(&device->dev, &dev_attr_cpufv);
+	if (retval)
+		goto error_sysfs;
+
+	return 0;
+
+error_sysfs:
+	eeepc_wmi_sysfs_exit(platform_device);
+	return retval;
+}
+
 static int __devinit eeepc_wmi_platform_probe(struct platform_device *device)
 {
 	struct eeepc_wmi *eeepc;
@@ -392,8 +436,14 @@ static int __init eeepc_wmi_init(void)
 		goto del_dev;
 	}
 
+	err = eeepc_wmi_sysfs_init(platform_device);
+	if (err)
+		goto del_sysfs;
+
 	return 0;
 
+del_sysfs:
+	eeepc_wmi_sysfs_exit(platform_device);
 del_dev:
 	platform_device_del(platform_device);
 put_dev:
@@ -408,6 +458,7 @@ static void __exit eeepc_wmi_exit(void)
 {
 	struct eeepc_wmi *eeepc;
 
+	eeepc_wmi_sysfs_exit(platform_device);
 	eeepc = platform_get_drvdata(platform_device);
 	platform_driver_unregister(&platform_driver);
 	platform_device_unregister(platform_device);
-- 
1.7.3.1
