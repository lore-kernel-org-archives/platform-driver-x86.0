From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 7/9] platform/x86: hp-wmi: Use DEVICE_ATTR_(RO|RW) helper macros
Date: Wed, 19 Apr 2017 19:25:19 -0700
Message-ID: <6791b5f6e7994b55265f9154d4e0d23f96b0d659.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org
List-Id: platform-driver-x86.vger.kernel.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Use the DEVICE_ATTR_(RO|RW) macros, ranaming the show and store
functions accordingly.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 89d6278..ccacd1a 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -397,7 +397,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	return 0;
 }
 
-static ssize_t show_display(struct device *dev, struct device_attribute *attr,
+static ssize_t display_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
@@ -406,7 +406,7 @@ static ssize_t show_display(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", value);
 }
 
-static ssize_t show_hddtemp(struct device *dev, struct device_attribute *attr,
+static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
@@ -415,7 +415,7 @@ static ssize_t show_hddtemp(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", value);
 }
 
-static ssize_t show_als(struct device *dev, struct device_attribute *attr,
+static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
@@ -424,7 +424,7 @@ static ssize_t show_als(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", value);
 }
 
-static ssize_t show_dock(struct device *dev, struct device_attribute *attr,
+static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
@@ -433,8 +433,8 @@ static ssize_t show_dock(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", value);
 }
 
-static ssize_t show_tablet(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
 	if (value < 0)
@@ -442,8 +442,8 @@ static ssize_t show_tablet(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", value);
 }
 
-static ssize_t show_postcode(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
 {
 	/* Get the POST error code of previous boot failure. */
 	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
@@ -452,8 +452,8 @@ static ssize_t show_postcode(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "0x%x\n", value);
 }
 
-static ssize_t set_als(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t als_store(struct device *dev, struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	u32 tmp = simple_strtoul(buf, NULL, 10);
 	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
@@ -464,8 +464,8 @@ static ssize_t set_als(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static ssize_t set_postcode(struct device *dev, struct device_attribute *attr,
-		       const char *buf, size_t count)
+static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
 {
 	long unsigned int tmp2;
 	int ret;
@@ -485,12 +485,12 @@ static ssize_t set_postcode(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(display, S_IRUGO, show_display, NULL);
-static DEVICE_ATTR(hddtemp, S_IRUGO, show_hddtemp, NULL);
-static DEVICE_ATTR(als, S_IRUGO | S_IWUSR, show_als, set_als);
-static DEVICE_ATTR(dock, S_IRUGO, show_dock, NULL);
-static DEVICE_ATTR(tablet, S_IRUGO, show_tablet, NULL);
-static DEVICE_ATTR(postcode, S_IRUGO | S_IWUSR, show_postcode, set_postcode);
+static DEVICE_ATTR_RO(display);
+static DEVICE_ATTR_RO(hddtemp);
+static DEVICE_ATTR_RW(als);
+static DEVICE_ATTR_RO(dock);
+static DEVICE_ATTR_RO(tablet);
+static DEVICE_ATTR_RW(postcode);
 
 static void hp_wmi_notify(u32 value, void *context)
 {
-- 
2.9.3
