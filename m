From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 8/9] platform/x86: hp-wmi: Do not shadow errors in sysfs show functions
Date: Wed, 19 Apr 2017 19:25:20 -0700
Message-ID: <45e338841cbfe6ad21ec277a0c0974a3e532c07d.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41627 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937994AbdDTC0Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 22:26:24 -0400
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

The new hp_wmi_read_int function returns a negative value in case of
error, pass this on directly rather than always replacing it with
-EINVAL.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index ccacd1a..90b8652 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -402,7 +402,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
 {
 	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
 	if (value < 0)
-		return -EINVAL;
+		return value;
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -411,7 +411,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
 {
 	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
 	if (value < 0)
-		return -EINVAL;
+		return value;
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -420,7 +420,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 {
 	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
 	if (value < 0)
-		return -EINVAL;
+		return value;
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -429,7 +429,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 {
 	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
 	if (value < 0)
-		return -EINVAL;
+		return value;
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -438,7 +438,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
 {
 	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
 	if (value < 0)
-		return -EINVAL;
+		return value;
 	return sprintf(buf, "%d\n", value);
 }
 
@@ -448,7 +448,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
 	/* Get the POST error code of previous boot failure. */
 	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
 	if (value < 0)
-		return -EINVAL;
+		return value;
 	return sprintf(buf, "0x%x\n", value);
 }
 
-- 
2.9.3
