From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 1/9] platform/x86: hp-wmi: Cleanup local variable declarations
Date: Wed, 19 Apr 2017 19:25:13 -0700
Message-ID: <ef8e0bbccb1402af3532d3abc684844eb602d5ba.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:54890 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763359AbdDTC0Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 22:26:16 -0400
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Declare like types on one line. Order declarations in decreasing length
where possible.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 5ca9328..e772105 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -346,15 +346,14 @@ static const struct rfkill_ops hp_wmi_rfkill_ops = {
 
 static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 {
+	int mask = 0x200 << (r * 8);
 	int wireless = 0;
-	int mask;
+
 	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0,
 			     &wireless, sizeof(wireless),
 			     sizeof(wireless));
 	/* TBD: Pass error */
 
-	mask = 0x200 << (r * 8);
-
 	if (wireless & mask)
 		return false;
 	else
@@ -363,15 +362,14 @@ static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 
 static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 {
+	int mask = 0x800 << (r * 8);
 	int wireless = 0;
-	int mask;
+
 	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0,
 			     &wireless, sizeof(wireless),
 			     sizeof(wireless));
 	/* TBD: Pass error */
 
-	mask = 0x800 << (r * 8);
-
 	if (wireless & mask)
 		return false;
 	else
@@ -395,8 +393,8 @@ static const struct rfkill_ops hp_wmi_rfkill2_ops = {
 
 static int hp_wmi_rfkill2_refresh(void)
 {
-	int err, i;
 	struct bios_rfkill2_state state;
+	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 0, &state,
 				   0, sizeof(state));
@@ -502,9 +500,9 @@ static ssize_t set_als(struct device *dev, struct device_attribute *attr,
 static ssize_t set_postcode(struct device *dev, struct device_attribute *attr,
 		       const char *buf, size_t count)
 {
+	long unsigned int tmp2;
 	int ret;
 	u32 tmp;
-	long unsigned int tmp2;
 
 	ret = kstrtoul(buf, 10, &tmp2);
 	if (ret || tmp2 != 1)
@@ -530,11 +528,11 @@ static DEVICE_ATTR(postcode, S_IRUGO | S_IWUSR, show_postcode, set_postcode);
 static void hp_wmi_notify(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
 	u32 event_id, event_data;
+	union acpi_object *obj;
 	int key_code = 0, ret;
-	u32 *location;
 	acpi_status status;
+	u32 *location;
 
 	status = wmi_get_event_data(value, &response);
 	if (status != AE_OK) {
@@ -645,8 +643,7 @@ static void hp_wmi_notify(u32 value, void *context)
 static int __init hp_wmi_input_setup(void)
 {
 	acpi_status status;
-	int err;
-	int val;
+	int err, val;
 
 	hp_wmi_input_dev = input_allocate_device();
 	if (!hp_wmi_input_dev)
@@ -719,8 +716,7 @@ static void cleanup_sysfs(struct platform_device *device)
 
 static int __init hp_wmi_rfkill_setup(struct platform_device *device)
 {
-	int err;
-	int wireless = 0;
+	int err, wireless = 0;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0, &wireless,
 				   sizeof(wireless), sizeof(wireless));
@@ -804,8 +800,9 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
 
 static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 {
-	int err, i;
 	struct bios_rfkill2_state state;
+	int err, i;
+
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 0, &state,
 				   0, sizeof(state));
 	if (err)
@@ -1002,9 +999,9 @@ static struct platform_driver hp_wmi_driver = {
 
 static int __init hp_wmi_init(void)
 {
-	int err;
 	int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
 	int bios_capable = wmi_has_guid(HPWMI_BIOS_GUID);
+	int err;
 
 	if (!bios_capable && !event_capable)
 		return -ENODEV;
-- 
2.9.3
