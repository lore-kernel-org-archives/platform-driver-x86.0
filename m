From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: [PATCH] asus-laptop: get rid of parse_arg()
Date: Fri,  5 Aug 2016 23:57:10 +0300
Message-ID: <20160805205710.4735-1-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36329 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2998820AbcHEU50 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Aug 2016 16:57:26 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>

parse_arg() duplicates the funcionality of kstrtoint() so use the latter
function instead. There is no funcionality change except that in the
case of input being too big -ERANGE will be returned instead of -EINVAL
which is not bad because -ERANGE makes more sense here. The check for
!count is already done by the sysfs core so no need to duplicate it
again. Also, add some minor corrections to error handling to accommodate
the change in return values (parse_arg returned count if everything
succeeded whereas kstrtoint returns 0 in the same situation)

As a result of this patch asus-laptop.ko size is reduced by almost 1%:
add/remove: 0/1 grow/shrink: 1/6 up/down: 1/-149 (-148)
function                                     old     new   delta
__UNIQUE_ID_vermagic0                         69      70      +1
ls_switch_store                              133     117     -16
ledd_store                                   175     159     -16
display_store                                157     141     -16
ls_level_store                               193     176     -17
gps_store                                    200     178     -22
sysfs_acpi_set.isra                          148     125     -23
parse_arg.part                                39       -     -39
Total: Before=19160, After=19012, chg -0.77%

Signed-off-by: Giedrius Statkevičius <giedrius.statkevicius@gmail.com>
---
 drivers/platform/x86/asus-laptop.c | 77 ++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 15f1311..28551f5 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -932,30 +932,19 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(infos);
 
-static int parse_arg(const char *buf, unsigned long count, int *val)
-{
-	if (!count)
-		return 0;
-	if (count > 31)
-		return -EINVAL;
-	if (sscanf(buf, "%i", val) != 1)
-		return -EINVAL;
-	return count;
-}
-
 static ssize_t sysfs_acpi_set(struct asus_laptop *asus,
 			      const char *buf, size_t count,
 			      const char *method)
 {
 	int rv, value;
 
-	rv = parse_arg(buf, count, &value);
-	if (rv <= 0)
+	rv = kstrtoint(buf, 0, &value);
+	if (rv < 0)
 		return rv;
 
 	if (write_acpi_int(asus->handle, method, value))
 		return -ENODEV;
-	return rv;
+	return count;
 }
 
 /*
@@ -975,15 +964,17 @@ static ssize_t ledd_store(struct device *dev, struct device_attribute *attr,
 	struct asus_laptop *asus = dev_get_drvdata(dev);
 	int rv, value;
 
-	rv = parse_arg(buf, count, &value);
-	if (rv > 0) {
-		if (write_acpi_int(asus->handle, METHOD_LEDD, value)) {
-			pr_warn("LED display write failed\n");
-			return -ENODEV;
-		}
-		asus->ledd_status = (u32) value;
+	rv = kstrtoint(buf, 0, &value);
+	if (rv < 0)
+		return rv;
+
+	if (write_acpi_int(asus->handle, METHOD_LEDD, value)) {
+		pr_warn("LED display write failed\n");
+		return -ENODEV;
 	}
-	return rv;
+
+	asus->ledd_status = (u32) value;
+	return count;
 }
 static DEVICE_ATTR_RW(ledd);
 
@@ -1148,10 +1139,12 @@ static ssize_t display_store(struct device *dev, struct device_attribute *attr,
 	struct asus_laptop *asus = dev_get_drvdata(dev);
 	int rv, value;
 
-	rv = parse_arg(buf, count, &value);
-	if (rv > 0)
-		asus_set_display(asus, value);
-	return rv;
+	rv = kstrtoint(buf, 0, &value);
+	if (rv < 0)
+		return rv;
+
+	asus_set_display(asus, value);
+	return count;
 }
 static DEVICE_ATTR_WO(display);
 
@@ -1190,11 +1183,12 @@ static ssize_t ls_switch_store(struct device *dev,
 	struct asus_laptop *asus = dev_get_drvdata(dev);
 	int rv, value;
 
-	rv = parse_arg(buf, count, &value);
-	if (rv > 0)
-		asus_als_switch(asus, value ? 1 : 0);
+	rv = kstrtoint(buf, 0, &value);
+	if (rv < 0)
+		return rv;
 
-	return rv;
+	asus_als_switch(asus, value ? 1 : 0);
+	return count;
 }
 static DEVICE_ATTR_RW(ls_switch);
 
@@ -1219,14 +1213,15 @@ static ssize_t ls_level_store(struct device *dev, struct device_attribute *attr,
 	struct asus_laptop *asus = dev_get_drvdata(dev);
 	int rv, value;
 
-	rv = parse_arg(buf, count, &value);
-	if (rv > 0) {
-		value = (0 < value) ? ((15 < value) ? 15 : value) : 0;
-		/* 0 <= value <= 15 */
-		asus_als_level(asus, value);
-	}
+	rv = kstrtoint(buf, 0, &value);
+	if (rv < 0)
+		return rv;
+
+	value = (0 < value) ? ((15 < value) ? 15 : value) : 0;
+	/* 0 <= value <= 15 */
+	asus_als_level(asus, value);
 
-	return rv;
+	return count;
 }
 static DEVICE_ATTR_RW(ls_level);
 
@@ -1301,14 +1296,14 @@ static ssize_t gps_store(struct device *dev, struct device_attribute *attr,
 	int rv, value;
 	int ret;
 
-	rv = parse_arg(buf, count, &value);
-	if (rv <= 0)
-		return -EINVAL;
+	rv = kstrtoint(buf, 0, &value);
+	if (rv < 0)
+		return rv;
 	ret = asus_gps_switch(asus, !!value);
 	if (ret)
 		return ret;
 	rfkill_set_sw_state(asus->gps.rfkill, !value);
-	return rv;
+	return count;
 }
 static DEVICE_ATTR_RW(gps);
 
-- 
2.9.0
