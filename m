From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 3/7] hp-wmi: allow setting input and output buffer sizes separately
Date: Sun, 20 Feb 2011 20:07:22 +0200
Message-ID: <1298225246-21991-4-git-send-email-anssi.hannula@iki.fi>
References: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from tulikuusama.dnainternet.net ([83.102.40.132]:38957 "EHLO
	tulikuusama.dnainternet.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754432Ab1BTSHe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 13:07:34 -0500
In-Reply-To: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Split buffersize parameter of hp_wmi_perform_query to insize and
outsize. Existing callers are changed to use the same value for insize
and outsize to avoid any regressions, with the exception of
hp_wmi_set_block where the output buffer is unused and therefore outsize
is set to 0 (this change is not seen by BIOS code).

The maximum input buffer size is kept at 4 bytes as per struct
bios_args. Some commands exist that take longer buffers, but they
haven't been implemented. The data portion of bios_args can be trivially
made dynamically allocated later when such larger buffers become needed.

Signed-off-by: Anssi Hannula <anssi.hannula@iki.fi>
---
 drivers/platform/x86/hp-wmi.c |   63 +++++++++++++++++++++++++---------------
 1 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 8e27c27..5c8ae65 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -86,7 +86,6 @@ struct bios_args {
 struct bios_return {
 	u32 sigpass;
 	u32 return_code;
-	u32 value;
 };
 
 enum hp_return_value {
@@ -136,7 +135,8 @@ static struct platform_driver hp_wmi_driver = {
  * query:	The commandtype -> What should be queried
  * write:	The command -> 0 read, 1 write, 3 ODM specific
  * buffer:	Buffer used as input and/or output
- * buffersize:	Size of buffer
+ * insize:	Size of input buffer
+ * outsize:	Size of output buffer
  *
  * returns zero on success
  *         an HP WMI query specific error code (which is positive)
@@ -147,23 +147,28 @@ static struct platform_driver hp_wmi_driver = {
  *       size. E.g. Battery info query (0x7) is defined to have 1 byte input
  *       and 128 byte output. The caller would do:
  *       buffer = kzalloc(128, GFP_KERNEL);
- *       ret = hp_wmi_perform_query(0x7, 0, buffer, 128)
+ *       ret = hp_wmi_perform_query(0x7, 0, buffer, 1, 128)
  */
-static int hp_wmi_perform_query(int query, int write, u32 *buffer,
-				int buffersize)
+static int hp_wmi_perform_query(int query, int write, void *buffer,
+				int insize, int outsize)
 {
-	struct bios_return bios_return;
+	struct bios_return *bios_return;
+	int actual_outsize;
 	union acpi_object *obj;
 	struct bios_args args = {
 		.signature = 0x55434553,
 		.command = write ? 0x2 : 0x1,
 		.commandtype = query,
-		.datasize = buffersize,
-		.data = *buffer,
+		.datasize = insize,
+		.data = 0,
 	};
 	struct acpi_buffer input = { sizeof(struct bios_args), &args };
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 
+	if (WARN_ON(insize > sizeof(args.data)))
+		return -EINVAL;
+	memcpy(&args.data, buffer, insize);
+
 	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, 0x3, &input, &output);
 
 	obj = output.pointer;
@@ -175,19 +180,26 @@ static int hp_wmi_perform_query(int query, int write, u32 *buffer,
 		return -EINVAL;
 	}
 
-	bios_return = *((struct bios_return *)obj->buffer.pointer);
+	bios_return = (struct bios_return *)obj->buffer.pointer;
 
-	if (bios_return.return_code) {
-		if (bios_return.return_code != HPWMI_RET_UNKNOWN_CMDTYPE)
+	if (bios_return->return_code) {
+		if (bios_return->return_code != HPWMI_RET_UNKNOWN_CMDTYPE)
 			printk(KERN_WARNING PREFIX "query 0x%x returned "
 						   "error 0x%x\n",
-			       query, bios_return.return_code);
+			       query, bios_return->return_code);
 		kfree(obj);
-		return bios_return.return_code;
+		return bios_return->return_code;
 	}
 
-	memcpy(buffer, &bios_return.value, sizeof(bios_return.value));
+	if (!outsize) {
+		/* ignore output data */
+		kfree(obj);
+		return 0;
+	}
 
+	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
+	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
+	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
 	kfree(obj);
 	return 0;
 }
@@ -196,7 +208,7 @@ static int hp_wmi_display_state(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, 0, &state,
-				       sizeof(state));
+				       sizeof(state), sizeof(state));
 	if (ret)
 		return -EINVAL;
 	return state;
@@ -206,7 +218,7 @@ static int hp_wmi_hddtemp_state(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, 0, &state,
-				       sizeof(state));
+				       sizeof(state), sizeof(state));
 	if (ret)
 		return -EINVAL;
 	return state;
@@ -216,7 +228,7 @@ static int hp_wmi_als_state(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, 0, &state,
-				       sizeof(state));
+				       sizeof(state), sizeof(state));
 	if (ret)
 		return -EINVAL;
 	return state;
@@ -226,7 +238,7 @@ static int hp_wmi_dock_state(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
-				       sizeof(state));
+				       sizeof(state), sizeof(state));
 
 	if (ret)
 		return -EINVAL;
@@ -238,7 +250,7 @@ static int hp_wmi_tablet_state(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
-				       sizeof(state));
+				       sizeof(state), sizeof(state));
 	if (ret)
 		return ret;
 
@@ -252,7 +264,7 @@ static int hp_wmi_set_block(void *data, bool blocked)
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 1,
-				   &query, sizeof(query));
+				   &query, sizeof(query), 0);
 	if (ret)
 		return -EINVAL;
 	return 0;
@@ -267,7 +279,8 @@ static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 	int wireless = 0;
 	int mask;
 	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0,
-			     &wireless, sizeof(wireless));
+			     &wireless, sizeof(wireless),
+			     sizeof(wireless));
 	/* TBD: Pass error */
 
 	mask = 0x200 << (r * 8);
@@ -283,7 +296,8 @@ static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 	int wireless = 0;
 	int mask;
 	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0,
-			     &wireless, sizeof(wireless));
+			     &wireless, sizeof(wireless),
+			     sizeof(wireless));
 	/* TBD: Pass error */
 
 	mask = 0x800 << (r * 8);
@@ -344,7 +358,7 @@ static ssize_t set_als(struct device *dev, struct device_attribute *attr,
 {
 	u32 tmp = simple_strtoul(buf, NULL, 10);
 	int ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, 1, &tmp,
-				       sizeof(tmp));
+				       sizeof(tmp), sizeof(tmp));
 	if (ret)
 		return -EINVAL;
 
@@ -417,6 +431,7 @@ static void hp_wmi_notify(u32 value, void *context)
 	case HPWMI_BEZEL_BUTTON:
 		ret = hp_wmi_perform_query(HPWMI_HOTKEY_QUERY, 0,
 					   &key_code,
+					   sizeof(key_code),
 					   sizeof(key_code));
 		if (ret)
 			break;
@@ -523,7 +538,7 @@ static int __devinit hp_wmi_bios_setup(struct platform_device *device)
 	int wireless = 0;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 0, &wireless,
-				   sizeof(wireless));
+				   sizeof(wireless), sizeof(wireless));
 	if (err)
 		return err;
 
-- 
1.7.3
