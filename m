From: Kenneth Chan <kenneth.t.chan@gmail.com>
Subject: [PATCH 4/9] fix naming of platform files for consistency with other modules
Date: Sat, 22 Aug 2020 02:14:28 +0800
Message-ID: <20200821181433.17653-5-kenneth.t.chan@gmail.com>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: laforge@gnumonks.org, Kenneth Chan <kenneth.t.chan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Change platform device function names for consistency with other modules

Signed-off-by: Kenneth Chan <kenneth.t.chan@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 162b6c560af1..abf70e6e6578 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -13,6 +13,8 @@
  *
  * ChangeLog:
  *	Aug.18, 2020	Kenneth Chan <kenneth.t.chan@gmail.com>
+ *			fix naming of platform files for consistency with other
+ *			modules
  *			split MODULE_AUTHOR() by one author per macro call
  *			replace ACPI prints with pr_*() macros
  *		-v0.97	add support for cdpower hardware switch
@@ -444,7 +446,7 @@ static int set_optd_power_state(int new_state)
 
 /* sysfs user interface functions */
 
-static ssize_t show_numbatt(struct device *dev, struct device_attribute *attr,
+static ssize_t numbatt_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct acpi_device *acpi = to_acpi_device(dev);
@@ -456,7 +458,7 @@ static ssize_t show_numbatt(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_NUM_BATTERIES]);
 }
 
-static ssize_t show_lcdtype(struct device *dev, struct device_attribute *attr,
+static ssize_t lcdtype_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct acpi_device *acpi = to_acpi_device(dev);
@@ -468,7 +470,7 @@ static ssize_t show_lcdtype(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_LCD_TYPE]);
 }
 
-static ssize_t show_mute(struct device *dev, struct device_attribute *attr,
+static ssize_t mute_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct acpi_device *acpi = to_acpi_device(dev);
@@ -480,7 +482,7 @@ static ssize_t show_mute(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_MUTE]);
 }
 
-static ssize_t show_sticky(struct device *dev, struct device_attribute *attr,
+static ssize_t sticky_key_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct acpi_device *acpi = to_acpi_device(dev);
@@ -492,7 +494,7 @@ static ssize_t show_sticky(struct device *dev, struct device_attribute *attr,
 	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sinf[SINF_STICKY_KEY]);
 }
 
-static ssize_t set_sticky(struct device *dev, struct device_attribute *attr,
+static ssize_t sticky_key_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	struct acpi_device *acpi = to_acpi_device(dev);
@@ -526,10 +528,10 @@ static ssize_t cdpower_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(numbatt, S_IRUGO, show_numbatt, NULL);
-static DEVICE_ATTR(lcdtype, S_IRUGO, show_lcdtype, NULL);
-static DEVICE_ATTR(mute, S_IRUGO, show_mute, NULL);
-static DEVICE_ATTR(sticky_key, S_IRUGO | S_IWUSR, show_sticky, set_sticky);
+static DEVICE_ATTR_RO(numbatt);
+static DEVICE_ATTR_RO(lcdtype);
+static DEVICE_ATTR_RO(mute);
+static DEVICE_ATTR_RW(sticky_key);
 static DEVICE_ATTR_RW(cdpower);
 
 static struct attribute *pcc_sysfs_entries[] = {
-- 
2.17.5
