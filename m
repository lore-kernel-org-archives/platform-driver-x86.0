From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 8/9] add support for battery charging threshold (eco mode)
Date: Sat, 22 Aug 2020 02:14:32 +0800
Message-ID: <20200821181433.17653-9-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Add battery charging threshold (aka ECO mode) support.

NOTE: The state of ECO mode is persistent until the next POST cycle which reset
it to previous state.


Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 86 ++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 6779099a3ec9..6355d60dc3eb 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -13,6 +13,7 @@
  *
  * ChangeLog:
  *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *			add support for battery charging threshold (eco mode)
  *			resolve hotkey double trigger
  *			add write support to mute
  *			fix sticky_key init bug
@@ -147,7 +148,10 @@ MODULE_LICENSE("GPL");
 #define METHOD_HKEY_SQTY	"SQTY"
 #define METHOD_HKEY_SINF	"SINF"
 #define METHOD_HKEY_SSET	"SSET"
-#define HKEY_NOTIFY		 0x80
+#define METHOD_ECWR		"\\_SB.ECWR"
+#define HKEY_NOTIFY		0x80
+#define ECO_MODE_OFF		0x00
+#define ECO_MODE_ON		0x80
 
 #define ACPI_PCC_DRIVER_NAME	"Panasonic Laptop Support"
 #define ACPI_PCC_DEVICE_NAME	"Hotkey"
@@ -156,7 +160,7 @@ MODULE_LICENSE("GPL");
 #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
 
 /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
-   ENV_STATEs: Normal temp=0x01, High temp=0x81, N/A=0x00
+   ECO_MODEs: 0x03 = off, 0x83 = on
 */
 enum SINF_BITS { SINF_NUM_BATTERIES = 0,
 		 SINF_LCD_TYPE,
@@ -168,7 +172,7 @@ enum SINF_BITS { SINF_NUM_BATTERIES = 0,
 		 SINF_DC_CUR_BRIGHT,
 		 SINF_MUTE,
 		 SINF_RESERVED,
-		 SINF_ENV_STATE,
+		 SINF_ECO_MODE = 0x0A,
 		 SINF_STICKY_KEY = 0x80,
 	};
 /* R1 handles SINF_AC_CUR_BRIGHT as SINF_CUR_BRIGHT, doesn't know AC state */
@@ -222,6 +226,7 @@ struct pcc_acpi {
 	acpi_handle		handle;
 	unsigned long		num_sifr;
 	int			sticky_key;
+	int			eco_mode;
 	int			mute;
 	u32			*sinf;
 	struct acpi_device	*device;
@@ -534,6 +539,77 @@ static ssize_t sticky_key_store(struct device *dev, struct device_attribute *att
 	return count;
 }
 
+static ssize_t eco_mode_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	struct acpi_device *acpi = to_acpi_device(dev);
+	struct pcc_acpi *pcc = acpi_driver_data(acpi);
+	int result;
+
+	if (!acpi_pcc_retrieve_biosdata(pcc))
+		return -EIO;
+
+	switch (pcc->sinf[SINF_ECO_MODE]) {
+	case (ECO_MODE_OFF + 3):
+		result = 0;
+		break;
+	case (ECO_MODE_ON + 3):
+		result = 1;
+		break;
+	default:
+		result = -EIO;
+		break;
+	}
+	return snprintf(buf, PAGE_SIZE, "%u\n", result);
+}
+
+static ssize_t eco_mode_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct acpi_device *acpi = to_acpi_device(dev);
+	struct pcc_acpi *pcc = acpi_driver_data(acpi);
+	int err, state;
+
+	union acpi_object param[2];
+	struct acpi_object_list input;
+	acpi_status status;
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = 0x15;
+	param[1].type = ACPI_TYPE_INTEGER;
+	input.count = 2;
+	input.pointer = param;
+
+	err = kstrtoint(buf, 0, &state);
+	if (err)
+		return err;
+
+	switch (state) {
+	case 0:
+		param[1].integer.value = ECO_MODE_OFF;
+		pcc->sinf[SINF_ECO_MODE] = 0;
+		pcc->eco_mode = 0;
+		break;
+	case 1:
+		param[1].integer.value = ECO_MODE_ON;
+		pcc->sinf[SINF_ECO_MODE] = 1;
+		pcc->eco_mode = 1;
+		break;
+	default:
+		/* nothing to do */
+		return count;
+	}
+
+	status = acpi_evaluate_object(NULL, METHOD_ECWR,
+				       &input, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s evaluation failed\n", METHOD_ECWR);
+		return -EINVAL;
+	}
+
+	return count;
+}
+
 static ssize_t cdpower_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
@@ -556,6 +632,7 @@ static DEVICE_ATTR_RO(numbatt);
 static DEVICE_ATTR_RO(lcdtype);
 static DEVICE_ATTR_RW(mute);
 static DEVICE_ATTR_RW(sticky_key);
+static DEVICE_ATTR_RW(eco_mode);
 static DEVICE_ATTR_RW(cdpower);
 
 static struct attribute *pcc_sysfs_entries[] = {
@@ -563,6 +640,7 @@ static struct attribute *pcc_sysfs_entries[] = {
 	&dev_attr_lcdtype.attr,
 	&dev_attr_mute.attr,
 	&dev_attr_sticky_key.attr,
+	&dev_attr_eco_mode.attr,
 	&dev_attr_cdpower.attr,
 	NULL,
 };
@@ -714,6 +792,7 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 		return -EINVAL;
 
 	acpi_pcc_write_sset(pcc, SINF_MUTE, pcc->mute);
+	acpi_pcc_write_sset(pcc, SINF_ECO_MODE, pcc->eco_mode);
 	acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, pcc->sticky_key);
 
 	return 0;
@@ -784,6 +863,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 	acpi_pcc_write_sset(pcc, SINF_STICKY_KEY, 0);
 	pcc->sticky_key = 0;
 
+	pcc->eco_mode = pcc->sinf[SINF_ECO_MODE];
 	pcc->mute = pcc->sinf[SINF_MUTE];
 
 	/* add sysfs attributes */
-- 
2.17.5
