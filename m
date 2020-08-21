From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 6/9] add write support to mute
Date: Sat, 22 Aug 2020 02:14:30 +0800
Message-ID: <20200821181433.17653-7-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Add write support to the mute platform device


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index c77292588a8a..3b0294ee9d3e 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -13,6 +13,7 @@
  *
  * ChangeLog:
  *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *			add write support to mute
  *			fix sticky_key init bug
  *			fix naming of platform files for consistency with other
  *			modules
@@ -220,6 +221,7 @@ struct pcc_acpi {
 	acpi_handle		handle;
 	unsigned long		num_sifr;
 	int			sticky_key;
+	int			mute;
 	u32			*sinf;
 	struct acpi_device	*device;
 	struct input_dev	*input_dev;
@@ -483,6 +485,24 @@ static ssize_t mute_show(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_MUTE]);
 }
 
+static ssize_t mute_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct acpi_device *acpi = to_acpi_device(dev);
+	struct pcc_acpi *pcc = acpi_driver_data(acpi);
+	int err, val;
+
+	err = kstrtoint(buf, 0, &val);
+	if (err)
+		return err;
+	if (val == 0 || val == 1) {
+		acpi_pcc_write_sset(pcc, SINF_MUTE, val);
+		pcc->mute = val;
+	}
+
+	return count;
+}
+
 static ssize_t sticky_key_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
@@ -533,7 +553,7 @@ static ssize_t cdpower_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(numbatt);
 static DEVICE_ATTR_RO(lcdtype);
-static DEVICE_ATTR_RO(mute);
+static DEVICE_ATTR_RW(mute);
 static DEVICE_ATTR_RW(sticky_key);
 static DEVICE_ATTR_RW(cdpower);
 
@@ -690,6 +710,7 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 	if (!pcc)
 		return -EINVAL;
 
+	acpi_pcc_write_sset(pcc, SINF_MUTE, pcc->mute);
 	acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, pcc->sticky_key);
 
 	return 0;
@@ -760,6 +781,8 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, 0);
 	pcc->sticky_key = 0;
 
+	pcc->mute = pcc->sinf[SINF_MUTE];
+
 	/* add sysfs attributes */
 	result = sysfs_create_group(&device->dev.kobj, &pcc_attr_group);
 	if (result)
-- 
2.17.5
