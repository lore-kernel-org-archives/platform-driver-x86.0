From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v5 08/14] platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens
Date: Fri,  6 Oct 2017 23:59:52 -0500
Message-ID: <f8c1a8f8f04773f54c37eb14614cba88cbd7cab9.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95]:51434 "EHLO
        esa5.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751205AbdJGFAQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 01:00:16 -0400
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>

Currently userspace tools can access system tokens via the dcdbas
kernel module and a SMI call that will cause the platform to execute
SMM code.

With a goal in mind of deprecating the dcdbas kernel module a different
method for accessing these tokens from userspace needs to be created.

This is intentionally marked to only be readable as root as it can
contain sensitive information about the platform's configuration.

MAINTAINERS was missing for this driver.  Add myself and Pali to
maintainers list for it.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 .../ABI/testing/sysfs-platform-dell-smbios         | 16 ++++++
 MAINTAINERS                                        |  7 +++
 drivers/platform/x86/dell-smbios.c                 | 64 ++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios b/Documentation/ABI/testing/sysfs-platform-dell-smbios
new file mode 100644
index 000000000000..d97f4bd5bd91
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios
@@ -0,0 +1,16 @@
+What:		/sys/devices/platform/<platform>/tokens
+Date:		November 2017
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 659dbeec4191..2e3f2aea0370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3967,6 +3967,13 @@ M:	"Maciej W. Rozycki" <macro@linux-mips.org>
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
index 873d1c3f7641..7275d1d48190 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include "../../firmware/dcdbas.h"
+#include <linux/platform_device.h>
 #include "dell-smbios.h"
 
 struct calling_interface_structure {
@@ -39,6 +40,7 @@ static DEFINE_MUTEX(buffer_mutex);
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
+static struct platform_device *platform_device;
 static struct calling_interface_token *da_tokens;
 
 int dell_smbios_error(int value)
@@ -170,6 +172,40 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
 	}
 }
 
+static ssize_t tokens_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	size_t off = 0;
+	int to_print;
+	int i;
+
+	to_print = min(da_num_tokens, (int)(PAGE_SIZE - 1) / 15);
+	for (i = 0; i < to_print; i++) {
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
+static struct platform_driver platform_driver = {
+	.driver = {
+		.name = "dell-smbios",
+	},
+};
+
 static int __init dell_smbios_init(void)
 {
 	const struct dmi_device *valid;
@@ -197,9 +233,37 @@ static int __init dell_smbios_init(void)
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
+	ret = sysfs_create_group(&platform_device->dev.kobj,
+				 &smbios_attribute_group);
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
-- 
2.14.1
