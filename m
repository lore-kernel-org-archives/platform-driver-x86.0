From: Richard Hughes <hughsient@gmail.com>
Subject: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Wed, 06 May 2020 16:52:46 +0100
Message-ID: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
Sender: owner-linux-security-module@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Export standard LPC configuration values from various LPC/eSPI
controllers. This allows userspace components such as fwupd to
verify the most basic SPI protections are set correctly.
For instance, checking BIOSWE is disabled and BLE is enabled.

More cutting-edge checks (e.g. PRx and BootGuard) can be added
once the basics are in place. Exporting these values from the
kernel allows us to report the security level of the platform
without rebooting and running an unsigned EFI binary like
chipsec.

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 MAINTAINERS                          |   6 +
 drivers/platform/x86/Kconfig         |  10 ++
 drivers/platform/x86/Makefile        |   1 +
 drivers/platform/x86/intel_spi_lpc.c | 183 +++++++++++++++++++++++++++
 4 files changed, 200 insertions(+)
 create mode 100644 drivers/platform/x86/intel_spi_lpc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2926327e4976..2779a8d48f1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -401,6 +401,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/i2c-multi-instantiate.c
 
+SPI LPC configuration
+M:	Richard Hughes <richard@hughsie.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/intel_spi_lpc.c
+
 ACPI PMIC DRIVERS
 M:	"Rafael J. Wysocki" <rjw@rjwysocki.net>
 M:	Len Brown <lenb@kernel.org>
diff --git a/drivers/platform/x86/Kconfig
b/drivers/platform/x86/Kconfig
index 0ad7ad8cf8e1..5f7441cde5e7 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -837,6 +837,16 @@ config INTEL_VBTN
 	  To compile this driver as a module, choose M here: the module
will
 	  be called intel_vbtn.
 
+config INTEL_SPI_LPC
+	tristate "Intel SPI LPC configuration"
+	depends on SECURITY
+	help
+	  Export LPC configuration attributes for the system SPI chip.
+
+	  To compile this driver as a module, choose M here: the module
will
+	  be called intel_spi_lpc.
+	  If unsure, say N.
+
 config SURFACE3_WMI
 	tristate "Surface 3 WMI Driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile
b/drivers/platform/x86/Makefile
index 53408d965874..e8f6901bb165 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_INTEL_INT0002_VGPIO)	+=
intel_int0002_vgpio.o
 obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
 obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
 obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
+obj-$(CONFIG_INTEL_SPI_LPC)		+= intel_spi_lpc.o
 
 # Microsoft
 obj-$(CONFIG_SURFACE3_WMI)		+= surface3-wmi.o
diff --git a/drivers/platform/x86/intel_spi_lpc.c
b/drivers/platform/x86/intel_spi_lpc.c
new file mode 100644
index 000000000000..dd573593a0f5
--- /dev/null
+++ b/drivers/platform/x86/intel_spi_lpc.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SPI LPC flash platform security driver
+ *
+ * Copyright 2020 (c) Richard Hughes (richard@hughsie.com)
+ *
+ * This file is licensed under  the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <linux/module.h>
+#include <linux/security.h>
+#include <linux/pci.h>
+
+/* LPC bridge PCI config space registers */
+#define BIOS_CNTL_REG				0xDC
+#define BIOS_CNTL_WRITE_ENABLE_MASK		0x01
+#define BIOS_CNTL_LOCK_ENABLE_MASK		0x02
+#define BIOS_CNTL_WP_DISABLE_MASK		0x20
+
+/*
+ * This data only exists for exporting the supported PCI ids via
+ * MODULE_DEVICE_TABLE.  We do not actually register a pci_driver.
+ */
+static const struct pci_device_id pci_tbl[] = {
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x02a4)}, /* Comet Lake SPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x34a4)}, /* Ice Lake-LP SPI
*/
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9c66)}, /* 8 Series SPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9ce6)}, /* Wildcat Point-LP
GSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9d2a)}, /* Sunrise Point-
LP/SPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9d4e)}, /* Sunrise Point
LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x9da4)}, /* Cannon Point-LP
SPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa140)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa141)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa142)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa143)}, /* H110 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa144)}, /* H170 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa145)}, /* Z170 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa146)}, /* Q170 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa147)}, /* Q150 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa148)}, /* B150 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa149)}, /* C236 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa14a)}, /* C232 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa14b)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa14c)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa14d)}, /* QM170 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa14e)}, /* HM170 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa14f)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa150)}, /* CM236 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa151)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa152)}, /* HM175 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa153)}, /* QM175 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa154)}, /* CM238 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa155)}, /* Sunrise Point-H
LPC */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa1c1)}, /* C621 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa1c2)}, /* C622 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa1c3)}, /* C624 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa1c4)}, /* C625 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa1c5)}, /* C626 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa1c6)}, /* C627 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa1c7)}, /* C628 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa304)}, /* H370 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa305)}, /* Z390 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa306)}, /* Q370 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa30c)}, /* QM370 LPC/eSPI */
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0xa324)}, /* Cannon Lake PCH
SPI */
+	{0, }
+};
+MODULE_DEVICE_TABLE(pci, pci_tbl);
+
+struct dentry *spi_dir;
+struct dentry *spi_bioswe;
+struct dentry *spi_ble;
+struct dentry *spi_smm_bwp;
+struct pci_dev *dev;
+const u8 bios_cntl_off = BIOS_CNTL_REG;
+
+static ssize_t bioswe_read(struct file *filp, char __user *buf,
+			   size_t count, loff_t *ppos)
+{
+	char tmp[2];
+	u8 bios_cntl_val;
+
+	pci_read_config_byte(dev, bios_cntl_off, &bios_cntl_val);
+	sprintf(tmp, "%d\n",
+		bios_cntl_val & BIOS_CNTL_WRITE_ENABLE_MASK ? 1 : 0);
+	return simple_read_from_buffer(buf, count, ppos, tmp,
sizeof(tmp));
+}
+
+static const struct file_operations spi_bioswe_ops = {
+	.read  = bioswe_read,
+};
+
+static ssize_t ble_read(struct file *filp, char __user *buf,
+			size_t count, loff_t *ppos)
+{
+	char tmp[2];
+	u8 bios_cntl_val;
+
+	pci_read_config_byte(dev, bios_cntl_off, &bios_cntl_val);
+	sprintf(tmp, "%d\n",
+		bios_cntl_val & BIOS_CNTL_LOCK_ENABLE_MASK ? 1 : 0);
+	return simple_read_from_buffer(buf, count, ppos, tmp,
sizeof(tmp));
+}
+
+static const struct file_operations spi_ble_ops = {
+	.read  = ble_read,
+};
+
+static ssize_t smm_bwp_read(struct file *filp, char __user *buf,
+			    size_t count, loff_t *ppos)
+{
+	char tmp[2];
+	u8 bios_cntl_val;
+
+	pci_read_config_byte(dev, bios_cntl_off, &bios_cntl_val);
+	sprintf(tmp, "%d\n",
+		bios_cntl_val & BIOS_CNTL_WP_DISABLE_MASK ? 1 : 0);
+	return simple_read_from_buffer(buf, count, ppos, tmp,
sizeof(tmp));
+}
+
+static const struct file_operations spi_smm_bwp_ops = {
+	.read  = smm_bwp_read,
+};
+
+static int __init mod_init(void)
+{
+	int i;
+
+	/* Find SPI Controller */
+	for (i = 0; !dev && pci_tbl[i].vendor; ++i)
+		dev = pci_get_device(pci_tbl[i].vendor,
+				     pci_tbl[i].device, NULL);
+	if (!dev)
+		return -ENODEV;
+
+	spi_dir = securityfs_create_dir("spi", NULL);
+	if (IS_ERR(spi_dir))
+		return -1;
+
+	spi_bioswe =
+	    securityfs_create_file("bioswe",
+				   0600, spi_dir, NULL,
+				   &spi_bioswe_ops);
+	if (IS_ERR(spi_bioswe))
+		goto out;
+	spi_ble =
+	    securityfs_create_file("ble",
+				   0600, spi_dir, NULL,
+				   &spi_ble_ops);
+	if (IS_ERR(spi_ble))
+		goto out;
+	spi_smm_bwp =
+	    securityfs_create_file("smm_bwp",
+				   0600, spi_dir, NULL,
+				   &spi_smm_bwp_ops);
+	if (IS_ERR(spi_smm_bwp))
+		goto out;
+
+	return 0;
+out:
+	securityfs_remove(spi_bioswe);
+	securityfs_remove(spi_ble);
+	securityfs_remove(spi_smm_bwp);
+	securityfs_remove(spi_dir);
+	return -1;
+}
+
+static void __exit mod_exit(void)
+{
+	securityfs_remove(spi_bioswe);
+	securityfs_remove(spi_ble);
+	securityfs_remove(spi_smm_bwp);
+	securityfs_remove(spi_dir);
+}
+
+module_init(mod_init);
+module_exit(mod_exit);
+
+MODULE_DESCRIPTION("SPI LPC flash platform security driver");
+MODULE_AUTHOR("Richard Hughes <richard@hughsie.com>");
+MODULE_LICENSE("GPL");
