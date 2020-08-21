From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 5/9] fix sticky key init bug
Date: Sat, 22 Aug 2020 02:14:29 +0800
Message-ID: <20200821181433.17653-6-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The return value of the sticky key on some models (e.g. CF-W5) do not reflect its
state. How to retrieve its state from firmware is unkown. The safest bet is to reset
it at module init and store its state in pcc struct.


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index abf70e6e6578..c77292588a8a 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -13,6 +13,7 @@
  *
  * ChangeLog:
  *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *			fix sticky_key init bug
  *			fix naming of platform files for consistency with other
  *			modules
  *			split MODULE_AUTHOR() by one author per macro call
@@ -218,7 +219,7 @@ static const struct key_entry panasonic_keymap[] = {
 struct pcc_acpi {
 	acpi_handle		handle;
 	unsigned long		num_sifr;
-	int			sticky_mode;
+	int			sticky_key;
 	u32			*sinf;
 	struct acpi_device	*device;
 	struct input_dev	*input_dev;
@@ -491,7 +492,7 @@ static ssize_t sticky_key_show(struct device *dev, struct device_attribute *attr
 	if (!acpi_pcc_retrieve_biosdata(pcc))
 		return -EIO;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_STICKY_KEY]);
+	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sticky_key);
 }
 
 static ssize_t sticky_key_store(struct device *dev, struct device_attribute *attr,
@@ -499,12 +500,14 @@ static ssize_t sticky_key_store(struct device *dev, struct device_attribute *att
 {
 	struct acpi_device *acpi = to_acpi_device(dev);
 	struct pcc_acpi *pcc = acpi_driver_data(acpi);
-	int val;
+	int err, val;
 
-	if (count && sscanf(buf, "%i", &val) == 1 &&
-	    (val == 0 || val == 1)) {
+	err = kstrtoint(buf, 0, &val);
+	if (err)
+		return err;
+	if (val == 0 || val == 1) {
 		acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, val);
-		pcc->sticky_mode = val;
+		pcc->sticky_key = val;
 	}
 
 	return count;
@@ -687,7 +690,9 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 	if (!pcc)
 		return -EINVAL;
 
-	return acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, pcc->sticky_mode);
+	acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, pcc->sticky_key);
+
+	return 0;
 }
 #endif
 
@@ -751,8 +756,9 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	/* read the initial brightness setting from the hardware */
 	pcc->backlight->props.brightness = pcc->sinf[SINF_AC_CUR_BRIGHT];
 
-	/* read the initial sticky key mode from the hardware */
-	pcc->sticky_mode = pcc->sinf[SINF_STICKY_KEY];
+	/* Reset initial sticky key mode since the hardware register state is not consistent */
+	acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, 0);
+	pcc->sticky_key = 0;
 
 	/* add sysfs attributes */
 	result = sysfs_create_group(&device->dev.kobj, &pcc_attr_group);
-- 
2.17.5
