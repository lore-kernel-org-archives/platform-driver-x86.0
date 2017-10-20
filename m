From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v11 15/15] tools/wmi: add a sample for dell smbios communication over WMI
Date: Fri, 20 Oct 2017 12:40:30 -0500
Message-ID: <08648de760ceca5d1b5f4ccb0bab663fcefec6be.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This application uses the character device /dev/wmi/dell-smbios
to perform SMBIOS communications from userspace.

It offers demonstrations of a few simple tasks:
 - Running a class/select command
 - Querying a token value
 - Activating a token

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
---
 MAINTAINERS                     |   1 +
 tools/Makefile                  |  14 +--
 tools/wmi/Makefile              |  18 ++++
 tools/wmi/dell-smbios-example.c | 210 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 237 insertions(+), 6 deletions(-)
 create mode 100644 tools/wmi/Makefile
 create mode 100644 tools/wmi/dell-smbios-example.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 84afbf8ef7d5..64529a3f6910 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3997,6 +3997,7 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-smbios-wmi.c
+F:	tools/wmi/dell-smbios-example.c
 
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
diff --git a/tools/Makefile b/tools/Makefile
index 9dfede37c8ff..9d2fd2606810 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -29,6 +29,7 @@ help:
 	@echo '  usb                    - USB testing tools'
 	@echo '  virtio                 - vhost test module'
 	@echo '  vm                     - misc vm tools'
+	@echo '  wmi			- WMI interface examples'
 	@echo '  x86_energy_perf_policy - Intel energy policy tool'
 	@echo ''
 	@echo 'You can do:'
@@ -57,7 +58,7 @@ acpi: FORCE
 cpupower: FORCE
 	$(call descend,power/$@)
 
-cgroup firewire hv guest spi usb virtio vm net iio gpio objtool leds: FORCE
+cgroup firewire hv guest spi usb virtio vm net iio gpio objtool leds wmi: FORCE
 	$(call descend,$@)
 
 liblockdep: FORCE
@@ -92,7 +93,7 @@ kvm_stat: FORCE
 all: acpi cgroup cpupower gpio hv firewire liblockdep \
 		perf selftests spi turbostat usb \
 		virtio vm net x86_energy_perf_policy \
-		tmon freefall iio objtool kvm_stat
+		tmon freefall iio objtool kvm_stat wmi
 
 acpi_install:
 	$(call descend,power/$(@:_install=),install)
@@ -100,7 +101,7 @@ acpi_install:
 cpupower_install:
 	$(call descend,power/$(@:_install=),install)
 
-cgroup_install firewire_install gpio_install hv_install iio_install perf_install spi_install usb_install virtio_install vm_install net_install objtool_install:
+cgroup_install firewire_install gpio_install hv_install iio_install perf_install spi_install usb_install virtio_install vm_install net_install objtool_install wmi_install:
 	$(call descend,$(@:_install=),install)
 
 liblockdep_install:
@@ -125,7 +126,8 @@ install: acpi_install cgroup_install cpupower_install gpio_install \
 		hv_install firewire_install iio_install liblockdep_install \
 		perf_install selftests_install turbostat_install usb_install \
 		virtio_install vm_install net_install x86_energy_perf_policy_install \
-		tmon_install freefall_install objtool_install kvm_stat_install
+		tmon_install freefall_install objtool_install kvm_stat_install \
+		wmi_install
 
 acpi_clean:
 	$(call descend,power/acpi,clean)
@@ -133,7 +135,7 @@ acpi_clean:
 cpupower_clean:
 	$(call descend,power/cpupower,clean)
 
-cgroup_clean hv_clean firewire_clean spi_clean usb_clean virtio_clean vm_clean net_clean iio_clean gpio_clean objtool_clean leds_clean:
+cgroup_clean hv_clean firewire_clean spi_clean usb_clean virtio_clean vm_clean wmi_clean net_clean iio_clean gpio_clean objtool_clean leds_clean:
 	$(call descend,$(@:_clean=),clean)
 
 liblockdep_clean:
@@ -171,6 +173,6 @@ clean: acpi_clean cgroup_clean cpupower_clean hv_clean firewire_clean \
 		perf_clean selftests_clean turbostat_clean spi_clean usb_clean virtio_clean \
 		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
 		freefall_clean build_clean libbpf_clean libsubcmd_clean liblockdep_clean \
-		gpio_clean objtool_clean leds_clean
+		gpio_clean objtool_clean leds_clean wmi_clean
 
 .PHONY: FORCE
diff --git a/tools/wmi/Makefile b/tools/wmi/Makefile
new file mode 100644
index 000000000000..e664f1167388
--- /dev/null
+++ b/tools/wmi/Makefile
@@ -0,0 +1,18 @@
+PREFIX ?= /usr
+SBINDIR ?= sbin
+INSTALL ?= install
+CFLAGS += -D__EXPORTED_HEADERS__ -I../../include/uapi -I../../include
+CC = $(CROSS_COMPILE)gcc
+
+TARGET = dell-smbios-example
+
+all: $(TARGET)
+
+%: %.c
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<
+
+clean:
+	$(RM) $(TARGET)
+
+install: dell-smbios-example
+	$(INSTALL) -D -m 755 $(TARGET) $(DESTDIR)$(PREFIX)/$(SBINDIR)/$(TARGET)
diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-example.c
new file mode 100644
index 000000000000..a5f97647c9c5
--- /dev/null
+++ b/tools/wmi/dell-smbios-example.c
@@ -0,0 +1,210 @@
+/*
+ *  Sample application for SMBIOS communication over WMI interface
+ *  Performs the following:
+ *  - Simple class/select lookup for TPM information
+ *  - Simple query of known tokens and their values
+ *  - Simple activation of a token
+ *
+ *  Copyright (C) 2017 Dell, Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+/* if uapi header isn't installed, this might not yet exist */
+#ifndef __packed
+#define __packed __attribute__((packed))
+#endif
+#include <linux/wmi.h>
+
+/* It would be better to discover these using udev, but for a simple
+ * application they're hardcoded
+ */
+static const char *ioctl_devfs = "/dev/wmi/dell-smbios";
+static const char *token_sysfs =
+			"/sys/bus/platform/devices/dell-smbios.0/tokens";
+
+static void show_buffer(struct dell_wmi_smbios_buffer *buffer)
+{
+	printf("Call: %x/%x [%x,%x,%x,%x]\nResults: [%8x,%8x,%8x,%8x]\n",
+	buffer->std.class, buffer->std.select,
+	buffer->std.input[0], buffer->std.input[1],
+	buffer->std.input[2], buffer->std.input[3],
+	buffer->std.output[0], buffer->std.output[1],
+	buffer->std.output[2], buffer->std.output[3]);
+}
+
+static int run_wmi_smbios_cmd(struct dell_wmi_smbios_buffer *buffer)
+{
+	int fd;
+	int ret;
+
+	fd = open(ioctl_devfs, O_NONBLOCK);
+	ret = ioctl(fd, DELL_WMI_SMBIOS_CMD, buffer);
+	close(fd);
+	return ret;
+}
+
+static int find_token(__u16 token, __u16 *location, __u16 *value)
+{
+	char location_sysfs[60];
+	char value_sysfs[57];
+	char buf[4096];
+	FILE *f;
+	int ret;
+
+	ret = sprintf(value_sysfs, "%s/%04x_value", token_sysfs, token);
+	if (ret < 0) {
+		printf("sprintf value failed\n");
+		return 2;
+	}
+	f = fopen(value_sysfs, "rb");
+	if (!f) {
+		printf("failed to open %s\n", value_sysfs);
+		return 2;
+	}
+	fread(buf, 1, 4096, f);
+	fclose(f);
+	*value = (__u16) strtol(buf, NULL, 16);
+
+	ret = sprintf(location_sysfs, "%s/%04x_location", token_sysfs, token);
+	if (ret < 0) {
+		printf("sprintf location failed\n");
+		return 1;
+	}
+	f = fopen(location_sysfs, "rb");
+	if (!f) {
+		printf("failed to open %s\n", location_sysfs);
+		return 2;
+	}
+	fread(buf, 1, 4096, f);
+	fclose(f);
+	*location = (__u16) strtol(buf, NULL, 16);
+
+	if (*location)
+		return 0;
+	return 2;
+}
+
+static int token_is_active(__u16 *location, __u16 *cmpvalue,
+			   struct dell_wmi_smbios_buffer *buffer)
+{
+	int ret;
+
+	buffer->std.class = CLASS_TOKEN_READ;
+	buffer->std.select = SELECT_TOKEN_STD;
+	buffer->std.input[0] = *location;
+	ret = run_wmi_smbios_cmd(buffer);
+	if (ret != 0 || buffer->std.output[0] != 0)
+		return ret;
+	ret = (buffer->std.output[1] == *cmpvalue);
+	return ret;
+}
+
+static int query_token(__u16 token, struct dell_wmi_smbios_buffer *buffer)
+{
+	__u16 location;
+	__u16 value;
+	int ret;
+
+	ret = find_token(token, &location, &value);
+	if (ret != 0) {
+		printf("unable to find token %04x\n", token);
+		return 1;
+	}
+	return token_is_active(&location, &value, buffer);
+}
+
+static int activate_token(struct dell_wmi_smbios_buffer *buffer,
+		   __u16 token)
+{
+	__u16 location;
+	__u16 value;
+	int ret;
+
+	ret = find_token(token, &location, &value);
+	if (ret != 0) {
+		printf("unable to find token %04x\n", token);
+		return 1;
+	}
+	buffer->std.class = CLASS_TOKEN_WRITE;
+	buffer->std.select = SELECT_TOKEN_STD;
+	buffer->std.input[0] = location;
+	buffer->std.input[1] = 1;
+	ret = run_wmi_smbios_cmd(buffer);
+	return ret;
+}
+
+static int query_buffer_size(__u64 *buffer_size)
+{
+	FILE *f;
+
+	f = fopen(ioctl_devfs, "rb");
+	if (!f)
+		return -EINVAL;
+	fread(buffer_size, sizeof(__u64), 1, f);
+	fclose(f);
+	return EXIT_SUCCESS;
+}
+
+int main(void)
+{
+	struct dell_wmi_smbios_buffer *buffer;
+	int ret;
+	__u64 value = 0;
+
+	ret = query_buffer_size(&value);
+	if (ret == EXIT_FAILURE || !value) {
+		printf("Unable to read buffer size\n");
+		goto out;
+	}
+	printf("Detected required buffer size %lld\n", value);
+
+	buffer = malloc(value);
+	if (buffer == NULL) {
+		printf("failed to alloc memory for ioctl\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+	buffer->length = value;
+
+	/* simple SMBIOS call for looking up TPM info */
+	buffer->std.class = CLASS_FLASH_INTERFACE;
+	buffer->std.select = SELECT_FLASH_INTERFACE;
+	buffer->std.input[0] = 2;
+	ret = run_wmi_smbios_cmd(buffer);
+	if (ret) {
+		printf("smbios ioctl failed: %d\n", ret);
+		ret = EXIT_FAILURE;
+		goto out;
+	}
+	show_buffer(buffer);
+
+	/* query some tokens */
+	ret = query_token(CAPSULE_EN_TOKEN, buffer);
+	printf("UEFI Capsule enabled token is: %d\n", ret);
+	ret = query_token(CAPSULE_DIS_TOKEN, buffer);
+	printf("UEFI Capsule disabled token is: %d\n", ret);
+
+	/* activate UEFI capsule token if disabled */
+	if (ret) {
+		printf("Enabling UEFI capsule token");
+		if (activate_token(buffer, CAPSULE_EN_TOKEN)) {
+			printf("activate failed\n");
+			ret = -1;
+			goto out;
+		}
+	}
+	ret = EXIT_SUCCESS;
+out:
+	free(buffer);
+	return ret;
+}
-- 
2.14.1
