From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs interface for SMBIOS tokens
Date: Thu, 21 Sep 2017 08:57:11 -0500
Message-ID: <1342f21a4f2c9af86d3033a9af9d9a4d05d27106.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
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
 .../ABI/testing/sysfs-platform-dell-wmi-smbios     | 16 +++++++++
 drivers/platform/x86/dell-wmi-smbios.c             | 38 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios b/Documentation/ABI/testing/sysfs-platform-dell-wmi-smbios
new file mode 100644
index 000000000000..6d151f2dffba
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
+		ID @ Location : value
+
+		For example token:
+		5 @ 5 : 3
diff --git a/drivers/platform/x86/dell-wmi-smbios.c b/drivers/platform/x86/dell-wmi-smbios.c
index 7f896701fb7b..c3701fdadf7b 100644
--- a/drivers/platform/x86/dell-wmi-smbios.c
+++ b/drivers/platform/x86/dell-wmi-smbios.c
@@ -189,6 +189,34 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
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
+		off += scnprintf(buf+off, PAGE_SIZE-off, "%x @ %x : %x\n",
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
 static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 {
 	int ret;
@@ -206,8 +234,16 @@ static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 		goto fail_buffer;
 	}
 
+	ret = sysfs_create_group(&wdev->dev.kobj, &smbios_attribute_group);
+	if (ret)
+		goto fail_create_group;
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
+
 	return 0;
 
+fail_create_group:
+	free_page((unsigned long)buffer);
+
 fail_buffer:
 	kfree(da_tokens);
 	return ret;
@@ -215,8 +251,10 @@ static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 
 static int dell_wmi_smbios_remove(struct wmi_device *wdev)
 {
+	sysfs_remove_group(&wdev->dev.kobj, &smbios_attribute_group);
 	kfree(da_tokens);
 	free_page((unsigned long)buffer);
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
 	return 0;
 }
 
-- 
2.14.1
