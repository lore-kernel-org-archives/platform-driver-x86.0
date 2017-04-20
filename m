From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 9/9] platform/x86: hp-wmi: Cleanup exit paths
Date: Wed, 19 Apr 2017 19:25:21 -0700
Message-ID: <dda34c89b29681e4bb3bf614746a561c5a820476.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52437 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763359AbdDTC0Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 22:26:25 -0400
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Several exit paths were more complex than they needed to be. Remove
superfluous conditionals, use labels common cleanup, do not shadow
negative error codes.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 63 ++++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 90b8652..effb5d5 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -217,7 +217,7 @@ static int hp_wmi_perform_query(int query, int write, void *buffer,
 	struct bios_return *bios_return;
 	union acpi_object *obj;
 	int actual_outsize;
-	u32 rc;
+	int ret = 0;
 
 	if (WARN_ON(insize > sizeof(args.data)))
 		return -EINVAL;
@@ -229,32 +229,32 @@ static int hp_wmi_perform_query(int query, int write, void *buffer,
 
 	if (!obj)
 		return -EINVAL;
-	else if (obj->type != ACPI_TYPE_BUFFER) {
-		kfree(obj);
-		return -EINVAL;
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		ret = -EINVAL;
+		goto out_free;
 	}
 
 	bios_return = (struct bios_return *)obj->buffer.pointer;
-	rc = bios_return->return_code;
+	ret = bios_return->return_code;
 
-	if (rc) {
-		if (rc != HPWMI_RET_UNKNOWN_CMDTYPE)
-			pr_warn("query 0x%x returned error 0x%x\n", query, rc);
-		kfree(obj);
-		return rc;
+	if (ret) {
+		if (ret != HPWMI_RET_UNKNOWN_CMDTYPE)
+			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
+		goto out_free;
 	}
 
-	if (!outsize) {
-		/* ignore output data */
-		kfree(obj);
-		return 0;
-	}
+	/* Ignore output data of zero size */
+	if (!outsize)
+		goto out_free;
 
 	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
 	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
 	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
+
+out_free:
 	kfree(obj);
-	return 0;
+	return ret;
 }
 
 static int hp_wmi_read_int(int query)
@@ -307,9 +307,8 @@ static int __init hp_wmi_enable_hotkeys(void)
 	int value = 0x6e;
 	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, HPWMI_WRITE, &value,
 				       sizeof(value), 0);
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
-	return 0;
+
+	return ret <= 0 ? ret : -EINVAL;
 }
 
 static int hp_wmi_set_block(void *data, bool blocked)
@@ -320,9 +319,8 @@ static int hp_wmi_set_block(void *data, bool blocked)
 
 	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE,
 				   &query, sizeof(query), 0);
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
-	return 0;
+
+	return ret <= 0 ? ret : -EINVAL;
 }
 
 static const struct rfkill_ops hp_wmi_rfkill_ops = {
@@ -357,11 +355,12 @@ static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
 {
 	int rfkill_id = (int)(long)data;
 	char buffer[4] = { 0x01, 0x00, rfkill_id, !blocked };
+	int ret;
 
-	if (hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_WRITE,
-				   buffer, sizeof(buffer), 0))
-		return -EINVAL;
-	return 0;
+	ret = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_WRITE,
+				   buffer, sizeof(buffer), 0);
+
+	return ret <= 0 ? ret : -EINVAL;
 }
 
 static const struct rfkill_ops hp_wmi_rfkill2_ops = {
@@ -472,13 +471,17 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	u32 tmp;
 
 	ret = kstrtoul(buf, 10, &tmp2);
-	if (ret || tmp2 != 1)
-		return -EINVAL;
+	if (!ret && tmp2 != 1)
+		ret = -EINVAL;
+	if (ret)
+		goto out;
 
 	/* Clear the POST error code. It is kept until until cleared. */
 	tmp = (u32) tmp2;
 	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
 				       sizeof(tmp), sizeof(tmp));
+
+out:
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
 
@@ -683,7 +686,7 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
 	int err, wireless;
 
 	wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
-	if (wireless)
+	if (wireless < 0)
 		return wireless;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE, &wireless,
@@ -769,7 +772,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
 				   0, sizeof(state));
 	if (err)
-		return err;
+		return err < 0 ? err : -EINVAL;
 
 	if (state.count > HPWMI_MAX_RFKILL2_DEVICES) {
 		pr_warn("unable to parse 0x1b query output\n");
-- 
2.9.3
