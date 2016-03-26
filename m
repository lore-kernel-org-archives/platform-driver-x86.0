From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] intel_menlow: reduce code duplication
Date: Sat, 26 Mar 2016 22:40:26 +0100
Message-ID: <1459028427-4053-1-git-send-email-linux@rasmusvillemoes.dk>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36064 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754124AbcCZVke (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Mar 2016 17:40:34 -0400
Received: by mail-wm0-f42.google.com with SMTP id l71so2568385wmg.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Mar 2016 14:40:33 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sujith Thomas <sujith.thomas@intel.com>, Darren Hart <dvhart@infradead.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

aux0_show and aux1_show consists of almost identical code. Pull that
into a common helper and make them thin wrappers. Similarly for
_store.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/platform/x86/intel_menlow.c | 48 ++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel_menlow.c
index 0a919d81662c..ae3a2a831533 100644
--- a/drivers/platform/x86/intel_menlow.c
+++ b/drivers/platform/x86/intel_menlow.c
@@ -306,33 +306,32 @@ static int sensor_set_auxtrip(acpi_handle handle, int index, int value)
 #define to_intel_menlow_attr(_attr)	\
 	container_of(_attr, struct intel_menlow_attribute, attr)
 
-static ssize_t aux0_show(struct device *dev,
-			 struct device_attribute *dev_attr, char *buf)
+static ssize_t aux_show(struct device *dev, struct device_attribute *dev_attr,
+			char *buf, int idx)
 {
 	struct intel_menlow_attribute *attr = to_intel_menlow_attr(dev_attr);
 	unsigned long long value;
 	int result;
 
-	result = sensor_get_auxtrip(attr->handle, 0, &value);
+	result = sensor_get_auxtrip(attr->handle, idx, &value);
 
 	return result ? result : sprintf(buf, "%lu", DECI_KELVIN_TO_CELSIUS(value));
 }
 
-static ssize_t aux1_show(struct device *dev,
+static ssize_t aux0_show(struct device *dev,
 			 struct device_attribute *dev_attr, char *buf)
 {
-	struct intel_menlow_attribute *attr = to_intel_menlow_attr(dev_attr);
-	unsigned long long value;
-	int result;
-
-	result = sensor_get_auxtrip(attr->handle, 1, &value);
+	return aux_show(dev, dev_attr, buf, 0);
+}
 
-	return result ? result : sprintf(buf, "%lu", DECI_KELVIN_TO_CELSIUS(value));
+static ssize_t aux1_show(struct device *dev,
+			 struct device_attribute *dev_attr, char *buf)
+{
+	return aux_show(dev, dev_attr, buf, 1);
 }
 
-static ssize_t aux0_store(struct device *dev,
-			  struct device_attribute *dev_attr,
-			  const char *buf, size_t count)
+static ssize_t aux_store(struct device *dev, struct device_attribute *dev_attr,
+			 const char *buf, size_t count, int idx)
 {
 	struct intel_menlow_attribute *attr = to_intel_menlow_attr(dev_attr);
 	int value;
@@ -345,27 +344,22 @@ static ssize_t aux0_store(struct device *dev,
 	if (value < 0)
 		return -EINVAL;
 
-	result = sensor_set_auxtrip(attr->handle, 0, CELSIUS_TO_DECI_KELVIN(value));
+	result = sensor_set_auxtrip(attr->handle, idx, CELSIUS_TO_DECI_KELVIN(value));
 	return result ? result : count;
 }
 
-static ssize_t aux1_store(struct device *dev,
+static ssize_t aux0_store(struct device *dev,
 			  struct device_attribute *dev_attr,
 			  const char *buf, size_t count)
 {
-	struct intel_menlow_attribute *attr = to_intel_menlow_attr(dev_attr);
-	int value;
-	int result;
-
-	/*Sanity check; should be a positive integer */
-	if (!sscanf(buf, "%d", &value))
-		return -EINVAL;
-
-	if (value < 0)
-		return -EINVAL;
+	return aux_store(dev, dev_attr, buf, count, 0);
+}
 
-	result = sensor_set_auxtrip(attr->handle, 1, CELSIUS_TO_DECI_KELVIN(value));
-	return result ? result : count;
+static ssize_t aux1_store(struct device *dev,
+			  struct device_attribute *dev_attr,
+			  const char *buf, size_t count)
+{
+	return aux_store(dev, dev_attr, buf, count, 1);
 }
 
 /* BIOS can enable/disable the thermal user application in dabney platform */
-- 
2.1.4
