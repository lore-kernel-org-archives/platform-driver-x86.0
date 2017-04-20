From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 4/9] platform/x86: hp-wmi: Refactor redundant HPWMI_READ functions
Date: Wed, 19 Apr 2017 19:25:16 -0700
Message-ID: <1dd50801a0dbb8bd6ec1411b5c644a01a35b0136.1492654448.git.dvhart@infradead.org>
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

Several functions perform the same WMI read int with different query
arguments. Refactor this into a single hp_wmi_read_int function.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 82 +++++++++++++------------------------------
 1 file changed, 24 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 60d1e4c..758c229 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -252,55 +252,35 @@ static int hp_wmi_perform_query(int query, int write, void *buffer,
 	return 0;
 }
 
-static int hp_wmi_display_state(void)
+static int hp_wmi_read_int(int query)
 {
-	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
-	return state;
-}
+	int val = 0, ret;
 
-static int hp_wmi_hddtemp_state(void)
-{
-	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
-	return state;
-}
+	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
+				   sizeof(val), sizeof(val));
 
-static int hp_wmi_als_state(void)
-{
-	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
-	return state;
+
+	return val;
 }
 
 static int hp_wmi_dock_state(void)
 {
-	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
 
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
+	if (state < 0)
+		return state;
 
 	return state & 0x1;
 }
 
 static int hp_wmi_tablet_state(void)
 {
-	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
+	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
+
+	if (state < 0)
+		return state;
 
 	return (state & 0x4) ? 1 : 0;
 }
@@ -430,20 +410,10 @@ static int hp_wmi_rfkill2_refresh(void)
 	return 0;
 }
 
-static int hp_wmi_post_code_state(void)
-{
-	int state = 0;
-	int ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
-	return state;
-}
-
 static ssize_t show_display(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
-	int value = hp_wmi_display_state();
+	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
 	if (value < 0)
 		return -EINVAL;
 	return sprintf(buf, "%d\n", value);
@@ -452,7 +422,7 @@ static ssize_t show_display(struct device *dev, struct device_attribute *attr,
 static ssize_t show_hddtemp(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
-	int value = hp_wmi_hddtemp_state();
+	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
 	if (value < 0)
 		return -EINVAL;
 	return sprintf(buf, "%d\n", value);
@@ -461,7 +431,7 @@ static ssize_t show_hddtemp(struct device *dev, struct device_attribute *attr,
 static ssize_t show_als(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	int value = hp_wmi_als_state();
+	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
 	if (value < 0)
 		return -EINVAL;
 	return sprintf(buf, "%d\n", value);
@@ -489,7 +459,7 @@ static ssize_t show_postcode(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	/* Get the POST error code of previous boot failure. */
-	int value = hp_wmi_post_code_state();
+	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
 	if (value < 0)
 		return -EINVAL;
 	return sprintf(buf, "0x%x\n", value);
@@ -540,9 +510,9 @@ static void hp_wmi_notify(u32 value, void *context)
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
 	u32 event_id, event_data;
 	union acpi_object *obj;
-	int key_code = 0, ret;
 	acpi_status status;
 	u32 *location;
+	int key_code;
 
 	status = wmi_get_event_data(value, &response);
 	if (status != AE_OK) {
@@ -593,11 +563,8 @@ static void hp_wmi_notify(u32 value, void *context)
 	case HPWMI_SMART_ADAPTER:
 		break;
 	case HPWMI_BEZEL_BUTTON:
-		ret = hp_wmi_perform_query(HPWMI_HOTKEY_QUERY, HPWMI_READ,
-					   &key_code,
-					   sizeof(key_code),
-					   sizeof(key_code));
-		if (ret)
+		key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
+		if (key_code < 0)
 			break;
 
 		if (!sparse_keymap_report_event(hp_wmi_input_dev,
@@ -726,12 +693,11 @@ static void cleanup_sysfs(struct platform_device *device)
 
 static int __init hp_wmi_rfkill_setup(struct platform_device *device)
 {
-	int err, wireless = 0;
+	int err, wireless;
 
-	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
-				   sizeof(wireless), sizeof(wireless));
-	if (err)
-		return err;
+	wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+	if (wireless)
+		return wireless;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE, &wireless,
 				   sizeof(wireless), 0);
-- 
2.9.3
