Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CEE433C3
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 May 2024 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716474970; cv=none; b=f2QWQbgzeIGOoArsbS+LF+E40kXKtIVJF3ozEgEeTC7gKPI4+Bz+pOVkS9Vab2Z4ArcXqyDFSJF1NRtkC31JQFAYGelOHdRUJYlEsZenvn9HmFocleJc0BWjxv8PCIw+GgHRtdueWvDd5qZ2Qf042ZuhJT1xGtmI3CLEk05O790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716474970; c=relaxed/simple;
	bh=cwEd0Q9VNeahEKxD1NskwHkSpaKAjvjj/jiqNNIy898=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwxJLQvcGnk7GBYZJO7yk3dkwyCZl1ZHgs2EteinLzx/+i2it6pJnAO1kpwBRljMsvc4DvcHUaDT5S4ojgs3PLhnlU2d0X+xO1tG2rasJsE6wLnWuQl/Egb9Lk7BkjGLEEAAMKur/1KdnLtBSp6jYNKnHQ8I4ugADc99Zuoih4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jA1JUCJW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jA1JUCJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716474967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DoofuTXMPzFEsKae6QdKDOsWxGFAbY37+ULINKDxFKc=;
	b=jA1JUCJWq/uoEWYoV++QYfodGWeGizcGXIH7tpvmW9aPbfqt8aaus/y/xNBCE8VHxlLJVv
	tKK3yRTw2lDlhRpQNgcitZiMoxsjS3aGJ5xtXkYqrYzdvh0lPf/JW/jTD0xNmQ5G0E+RXH
	y8ruX+SVzqB+EnGdAmAzy9n7c4hh+hE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-BNxylpKYNfqoQxBraZQ3TQ-1; Thu, 23 May 2024 10:36:03 -0400
X-MC-Unique: BNxylpKYNfqoQxBraZQ3TQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12FB38029E1;
	Thu, 23 May 2024 14:36:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5023F2027019;
	Thu, 23 May 2024 14:36:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Gregor Riepl <onitake@gmail.com>
Subject: [PATCH v2] platform/x86: touchscreen_dmi: Add support for setting touchscreen properties from cmdline
Date: Thu, 23 May 2024 16:36:01 +0200
Message-ID: <20240523143601.47555-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On x86/ACPI platforms touchscreens mostly just work without needing any
device/model specific configuration. But in some cases (mostly with Silead
and Goodix touchscreens) it is still necessary to manually specify various
touchscreen-properties on a per model basis.

touchscreen_dmi is a special place for DMI quirks for this, but it can be
challenging for users to figure out the right property values, especially
for Silead touchscreens where non of these can be read back from
the touchscreen-controller.

ATM users can only test touchscreen properties by editing touchscreen_dmi.c
and then building a completely new kernel which makes it unnecessary
difficult for users to test and submit properties when necessary for their
laptop / tablet model.

Add support for specifying properties on the kernel commandline to allow
users to easily figure out the right settings. See the added documentation
in kernel-parameters.txt for the commandline syntax.

Cc: Gregor Riepl <onitake@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Refactor ts_data / ts_data_dmi handling a bit (addressing Andy's review)
- Accept hex/octal numbers (addressing Andy's review)
- Fix ts_parse_props return value (addressing Randy's review)
- Use ':' as separator instead of ',', ',' is used in "vendor,option" style
  property names, e.g. "silead,home-button"
- pr_warn() on invalid syntax since init/main.c does not do this
---
Note assuming this gets favourable review(s) in a reasonable timeframe
I'm thinking about maybe even adding this to 6.10 as a fix since users
not being able to easily test Silead touchscreen settings has been an
issue for quite a while now. Without the cmdline option being used this
is a no-op so the chance of this causing regressions is close to 0.
---
 .../admin-guide/kernel-parameters.txt         | 22 +++++
 drivers/platform/x86/touchscreen_dmi.c        | 81 ++++++++++++++++++-
 2 files changed, 99 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 396137ee018d..7ac315a7c0c7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1899,6 +1899,28 @@
 				Format:
 				<bus_id>,<clkrate>
 
+	i2c_touchscreen_props= [HW,ACPI,X86]
+			Set device-properties for ACPI enumerated I2C attached
+			touchscreen, to e.g. fix coordinates of upside-down
+			mounted touchscreens. If you need this option please
+			submit a drivers/platform/x86/touchscreen_dmi.c patch
+			adding a DMI quirk for this.
+
+			Format:
+			<ACPI_HW_ID>:<prop_name>=<val>[:prop_name=val][:...]
+			Where <val> is one of:
+			Omit "=<val>" entirely	Set a boolean device-property
+			Unsigned number		Set a u32 device-property
+			Anything else		Set a string device-property
+
+			Examples (split over multiple lines):
+			i2c_touchscreen_props=GDIX1001:touchscreen-inverted-x:
+			touchscreen-inverted-y
+
+			i2c_touchscreen_props=MSSL1680:touchscreen-size-x=1920:
+			touchscreen-size-y=1080:touchscreen-inverted-y:
+			firmware-name=gsl1680-vendor-model.fw:silead,home-button
+
 	i8042.debug	[HW] Toggle i8042 debug mode
 	i8042.unmask_kbd_data
 			[HW] Enable printing of interrupt data from the KBD port
diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index c6a10ec2c83f..b021fb9e579e 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -9,10 +9,13 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/ctype.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/efi_embedded_fw.h>
 #include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kstrtox.h>
 #include <linux/notifier.h>
 #include <linux/property.h>
 #include <linux/string.h>
@@ -1817,7 +1820,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	{ }
 };
 
-static const struct ts_dmi_data *ts_data;
+static struct ts_dmi_data *ts_data;
 
 static void ts_dmi_add_props(struct i2c_client *client)
 {
@@ -1852,6 +1855,64 @@ static int ts_dmi_notifier_call(struct notifier_block *nb,
 	return 0;
 }
 
+#define MAX_CMDLINE_PROPS 16
+
+static struct property_entry ts_cmdline_props[MAX_CMDLINE_PROPS + 1];
+
+static struct ts_dmi_data ts_cmdline_data = {
+	.properties = ts_cmdline_props,
+};
+
+static int __init ts_parse_props(char *str)
+{
+	/* Save the original str to show it on syntax errors */
+	char orig_str[256];
+	char *name, *value;
+	u32 u32val;
+	int i, ret;
+
+	strscpy(orig_str, str, sizeof(orig_str));
+
+	/*
+	 * str is part of the static_command_line from init/main.c and poking
+	 * holes in that by writing 0 to it is allowed, as is taking long
+	 * lasting references to it.
+	 */
+	ts_cmdline_data.acpi_name = strsep(&str, ":");
+
+	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
+		name = strsep(&str, ":");
+		if (!name || !name[0])
+			break;
+
+		/* Replace '=' with 0 and make value point past '=' or NULL */
+		value = name;
+		strsep(&value, "=");
+		if (!value) {
+			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
+		} else if (isdigit(value[0])) {
+			ret = kstrtou32(value, 0, &u32val);
+			if (ret)
+				goto syntax_error;
+
+			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
+		} else {
+			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
+		}
+	}
+
+	if (!i || str)
+		goto syntax_error;
+
+	ts_data = &ts_cmdline_data;
+	return 1;
+
+syntax_error:
+	pr_err("Invalid '%s' value for 'i2c_touchscreen_props='\n", orig_str);
+	return 1; /* "i2c_touchscreen_props=" is still a known parameter */
+}
+__setup("i2c_touchscreen_props=", ts_parse_props);
+
 static struct notifier_block ts_dmi_notifier = {
 	.notifier_call = ts_dmi_notifier_call,
 };
@@ -1859,13 +1920,25 @@ static struct notifier_block ts_dmi_notifier = {
 static int __init ts_dmi_init(void)
 {
 	const struct dmi_system_id *dmi_id;
+	struct ts_dmi_data *ts_data_dmi;
 	int error;
 
 	dmi_id = dmi_first_match(touchscreen_dmi_table);
-	if (!dmi_id)
-		return 0; /* Not an error */
+	ts_data_dmi = dmi_id ? dmi_id->driver_data : NULL;
+
+	if (ts_data) {
+		/*
+		 * Kernel cmdline provided data takes precedence, copy over
+		 * DMI efi_embedded_fw info if available.
+		 */
+		if (ts_data_dmi)
+			ts_data->embedded_fw = ts_data_dmi->embedded_fw;
+	} else if (ts_data_dmi) {
+		ts_data = ts_data_dmi;
+	} else {
+		return 0; /* Not an error */
+	}
 
-	ts_data = dmi_id->driver_data;
 	/* Some dmi table entries only provide an efi_embedded_fw_desc */
 	if (!ts_data->properties)
 		return 0;
-- 
2.45.1

