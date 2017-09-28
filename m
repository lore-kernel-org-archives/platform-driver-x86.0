From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v3 6/8] platform/x86: dell-wmi-smbios: Add a sysfs interface for SMBIOS tokens
Date: Wed, 27 Sep 2017 23:02:18 -0500
Message-ID: <64094c86a6083c3d4c34d1f005e8a71d07b61240.1506571188.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently userspace tools can access system tokens via the dcdbas
kernel module and a SMI call that will cause the platform to execute
SMM code.

With a goal in mind of deprecating the dcdbas kernel module a different
method for accessing these tokens from userspace needs to be created.

This is intentionally marked to only be readable as root as it can
contain sensitive information about the platform's configuration.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 .../ABI/testing/sysfs-platform-dell-wmi-smbios     | 16 ++++++++++
 drivers/platform/x86/dell-smbios.c                 | 36 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios b/Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios
new file mode 100644
index 000000000000..4cbff5ffe380
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios
@@ -0,0 +1,16 @@
+What:		/sys/devices/platform/<platform>/tokens
+Date:		October 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		A read-only description of Dell platform tokens
+		available on the machine.
+
+		The tokens will be displayed in the following
+		machine readable format with each token on a
+		new line:
+
+		ID	Location	value
+
+		For example token:
+		5	5	3
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 4174afbade13..ac176953e46e 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -229,6 +229,34 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
+static ssize_t tokens_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	size_t off = 0;
+	int i;
+
+	for (i = 0; i < da_num_tokens; i++) {
+		if (off > PAGE_SIZE)
+			break;
+		off += scnprintf(buf+off, PAGE_SIZE-off, "%04x\t%04x\t%04x\n",
+		da_tokens[i].tokenID, da_tokens[i].location,
+		da_tokens[i].value);
+	}
+
+	return off;
+}
+
+DEVICE_ATTR(tokens, 0400, tokens_show, NULL);
+
+static struct attribute *smbios_attrs[] = {
+	&dev_attr_tokens.attr,
+	NULL
+};
+
+static const struct attribute_group smbios_attribute_group = {
+	.attrs = smbios_attrs,
+};
+
 static int dell_wmi_smbios_open(struct inode *inode, struct file *file)
 {
 	return nonseekable_open(inode, file);
@@ -367,10 +395,16 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 		ret = -ENOMEM;
 		goto fail_devfs_buffer;
 	}
+	ret = sysfs_create_group(&wdev->dev.kobj, &smbios_attribute_group);
+	if (ret)
+		goto fail_create_group;
 
 	wmi_dev = wdev;
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
 	return 0;
 
+fail_create_group:
+	free_pages((unsigned long)devfs_buffer, 3);
 fail_devfs_buffer:
 	free_pages((unsigned long)internal_buffer, 3);
 	return ret;
@@ -381,6 +415,8 @@ static int dell_smbios_wmi_remove(struct wmi_device *wdev)
 	wmi_dev = NULL;
 	free_pages((unsigned long)internal_buffer, 3);
 	free_pages((unsigned long)devfs_buffer, 3);
+	sysfs_remove_group(&wdev->dev.kobj, &smbios_attribute_group);
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
 	return 0;
 }
 
-- 
2.14.1
