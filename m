From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v11 08/15] platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens
Date: Fri, 20 Oct 2017 12:40:23 -0500
Message-ID: <363404cf80b9060fca645b5e64bda8de75f59b56.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently userspace tools can access system tokens via the dcdbas
kernel module and a SMI call that will cause the platform to execute
SMM code.

With a goal in mind of deprecating the dcdbas kernel module a different
method for accessing these tokens from userspace needs to be created.

This is intentionally marked to only be readable as a process with
CAP_SYS_ADMIN as it can contain sensitive information about the
platform's configuration.

While adding this interface I found that some tokens are duplicated.
These need to be ignored from sysfs to avoid duplicate files.

MAINTAINERS was missing for this driver.  Add myself and Pali to
maintainers list for it.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
---
 .../ABI/testing/sysfs-platform-dell-smbios         |  21 ++
 MAINTAINERS                                        |   7 +
 drivers/platform/x86/dell-smbios.c                 | 212 ++++++++++++++++++++-
 3 files changed, 239 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios b/Documentation/ABI/testing/sysfs-platform-dell-smbios
new file mode 100644
index 000000000000..205d3b6361e0
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios
@@ -0,0 +1,21 @@
+What:		/sys/devices/platform/<platform>/tokens/*
+Date:		November 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		A read-only description of Dell platform tokens
+		available on the machine.
+
+		Each token attribute is available as a pair of
+		sysfs attributes readable by a process with
+		CAP_SYS_ADMIN.
+
+		For example the token ID "5" would be available
+		as the following attributes:
+
+		0005_location
+		0005_value
+
+		Tokens will vary from machine to machine, and
+		only tokens available on that machine will be
+		displayed.
diff --git a/MAINTAINERS b/MAINTAINERS
index f4cf35950b08..09e774f1d0b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3978,6 +3978,13 @@ M:	"Maciej W. Rozycki" <macro@linux-mips.org>
 S:	Maintained
 F:	drivers/net/fddi/defxx.*
 
+DELL SMBIOS DRIVER
+M:	Pali Rohár <pali.rohar@gmail.com>
+M:	Mario Limonciello <mario.limonciello@dell.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/dell-smbios.*
+
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali.rohar@gmail.com>
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 7e779278d054..9e2b396861bb 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -16,10 +16,12 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/capability.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/gfp.h>
 #include <linux/mutex.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include "../../firmware/dcdbas.h"
@@ -39,7 +41,11 @@ static DEFINE_MUTEX(buffer_mutex);
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
+static struct platform_device *platform_device;
 static struct calling_interface_token *da_tokens;
+static struct device_attribute *token_location_attrs;
+static struct device_attribute *token_value_attrs;
+static struct attribute **token_attrs;
 
 int dell_smbios_error(int value)
 {
@@ -157,6 +163,26 @@ static void __init parse_da_table(const struct dmi_header *dm)
 	da_num_tokens += tokens;
 }
 
+static void zero_duplicates(struct device *dev)
+{
+	int i, j;
+
+	for (i = 0; i < da_num_tokens; i++) {
+		for (j = i+1; j < da_num_tokens; j++) {
+			if (da_tokens[i].tokenID == 0 ||
+			    da_tokens[j].tokenID == 0)
+				continue;
+			if (da_tokens[i].tokenID == da_tokens[j].tokenID) {
+				dev_dbg(dev, "Zeroing dup token ID %x(%x/%x)\n",
+					da_tokens[j].tokenID,
+					da_tokens[j].location,
+					da_tokens[j].value);
+				da_tokens[j].tokenID = 0;
+			}
+		}
+	}
+}
+
 static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 {
 	switch (dm->type) {
@@ -170,6 +196,154 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
+static int match_attribute(struct device *dev,
+			   struct device_attribute *attr)
+{
+	int i;
+
+	for (i = 0; i < da_num_tokens * 2; i++) {
+		if (!token_attrs[i])
+			continue;
+		if (strcmp(token_attrs[i]->name, attr->attr.name) == 0)
+			return i/2;
+	}
+	dev_dbg(dev, "couldn't match: %s\n", attr->attr.name);
+	return -EINVAL;
+}
+
+static ssize_t location_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	int i;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	i = match_attribute(dev, attr);
+	if (i > 0)
+		return scnprintf(buf, PAGE_SIZE, "%08x", da_tokens[i].location);
+	return 0;
+}
+
+static ssize_t value_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	int i;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	i = match_attribute(dev, attr);
+	if (i > 0)
+		return scnprintf(buf, PAGE_SIZE, "%08x", da_tokens[i].value);
+	return 0;
+}
+
+static struct attribute_group smbios_attribute_group = {
+	.name = "tokens"
+};
+
+static struct platform_driver platform_driver = {
+	.driver = {
+		.name = "dell-smbios",
+	},
+};
+
+static int build_tokens_sysfs(struct platform_device *dev)
+{
+	char buffer_location[13];
+	char buffer_value[10];
+	char *location_name;
+	char *value_name;
+	size_t size;
+	int ret;
+	int i, j;
+
+	/* (number of tokens  + 1 for null terminated */
+	size = sizeof(struct device_attribute) * (da_num_tokens + 1);
+	token_location_attrs = kzalloc(size, GFP_KERNEL);
+	if (!token_location_attrs)
+		return -ENOMEM;
+	token_value_attrs = kzalloc(size, GFP_KERNEL);
+	if (!token_value_attrs)
+		goto out_allocate_value;
+
+	/* need to store both location and value + terminator*/
+	size = sizeof(struct attribute *) * ((2 * da_num_tokens) + 1);
+	token_attrs = kzalloc(size, GFP_KERNEL);
+	if (!token_attrs)
+		goto out_allocate_attrs;
+
+	for (i = 0, j = 0; i < da_num_tokens; i++) {
+		/* skip empty */
+		if (da_tokens[i].tokenID == 0)
+			continue;
+		/* add location */
+		sprintf(buffer_location, "%04x_location",
+			da_tokens[i].tokenID);
+		location_name = kstrdup(buffer_location, GFP_KERNEL);
+		if (location_name == NULL)
+			goto out_unwind_strings;
+		sysfs_attr_init(&token_location_attrs[i].attr);
+		token_location_attrs[i].attr.name = location_name;
+		token_location_attrs[i].attr.mode = 0444;
+		token_location_attrs[i].show = location_show;
+		token_attrs[j++] = &token_location_attrs[i].attr;
+
+		/* add value */
+		sprintf(buffer_value, "%04x_value",
+			da_tokens[i].tokenID);
+		value_name = kstrdup(buffer_value, GFP_KERNEL);
+		if (value_name == NULL)
+			goto loop_fail_create_value;
+		sysfs_attr_init(&token_value_attrs[i].attr);
+		token_value_attrs[i].attr.name = value_name;
+		token_value_attrs[i].attr.mode = 0444;
+		token_value_attrs[i].show = value_show;
+		token_attrs[j++] = &token_value_attrs[i].attr;
+		continue;
+
+loop_fail_create_value:
+		kfree(value_name);
+		goto out_unwind_strings;
+	}
+	smbios_attribute_group.attrs = token_attrs;
+
+	ret = sysfs_create_group(&dev->dev.kobj, &smbios_attribute_group);
+	if (ret)
+		goto out_unwind_strings;
+	return 0;
+
+out_unwind_strings:
+	for (i = i-1; i > 0; i--) {
+		kfree(token_location_attrs[i].attr.name);
+		kfree(token_value_attrs[i].attr.name);
+	}
+	kfree(token_attrs);
+out_allocate_attrs:
+	kfree(token_value_attrs);
+out_allocate_value:
+	kfree(token_location_attrs);
+
+	return -ENOMEM;
+}
+
+static void free_group(struct platform_device *pdev)
+{
+	int i;
+
+	sysfs_remove_group(&pdev->dev.kobj,
+				&smbios_attribute_group);
+	for (i = 0; i < da_num_tokens; i++) {
+		kfree(token_location_attrs[i].attr.name);
+		kfree(token_value_attrs[i].attr.name);
+	}
+	kfree(token_attrs);
+	kfree(token_value_attrs);
+	kfree(token_location_attrs);
+}
+
+
 static int __init dell_smbios_init(void)
 {
 	const struct dmi_device *valid;
@@ -197,9 +371,40 @@ static int __init dell_smbios_init(void)
 		ret = -ENOMEM;
 		goto fail_buffer;
 	}
+	ret = platform_driver_register(&platform_driver);
+	if (ret)
+		goto fail_platform_driver;
+
+	platform_device = platform_device_alloc("dell-smbios", 0);
+	if (!platform_device) {
+		ret = -ENOMEM;
+		goto fail_platform_device_alloc;
+	}
+	ret = platform_device_add(platform_device);
+	if (ret)
+		goto fail_platform_device_add;
+
+	/* duplicate tokens will cause problems building sysfs files */
+	zero_duplicates(&platform_device->dev);
+
+	ret = build_tokens_sysfs(platform_device);
+	if (ret)
+		goto fail_create_group;
 
 	return 0;
 
+fail_create_group:
+	platform_device_del(platform_device);
+
+fail_platform_device_add:
+	platform_device_put(platform_device);
+
+fail_platform_device_alloc:
+	platform_driver_unregister(&platform_driver);
+
+fail_platform_driver:
+	free_page((unsigned long)buffer);
+
 fail_buffer:
 	kfree(da_tokens);
 	return ret;
@@ -207,8 +412,13 @@ static int __init dell_smbios_init(void)
 
 static void __exit dell_smbios_exit(void)
 {
-	kfree(da_tokens);
+	if (platform_device) {
+		free_group(platform_device);
+		platform_device_unregister(platform_device);
+		platform_driver_unregister(&platform_driver);
+	}
 	free_page((unsigned long)buffer);
+	kfree(da_tokens);
 }
 
 subsys_initcall(dell_smbios_init);
-- 
2.14.1
