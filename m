Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC69199B0
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716396495; cv=none; b=Yxzk449p9kpWgeGoo3oahG/x1zAlSUZjQ07OYp57/ZrxZOd8rIuiTx39J9qhPvhIzBqWdP+3wPoUCgrpwwCRWSXUHrmSrZ2C0OuUpeRFZte9PrMJf5rRAUTH4GpaUmSRaZ+4IuALi8bU/hwdnEHqVMHADjmeEr8npSFdogEgmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716396495; c=relaxed/simple;
	bh=IWdIfvZVk2Pp4D5ofkJIPBjLcmwGneV4UyhDdvKBZa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NRG7N1zvVKmowP/xNa6hAqDryjfrRiLtRD1P6Cay8+sPSB3cZId6AyxWJC2vlbZDK09xxbOm6v1NoTT5CnSBfte1ehfBC83SBIO/TDzltWjjwKUZ5O6bSgYckpXMVtbkUaoeQ8trVWJbLjKGh87+ZxN4rWVkazKt/mu12++9Af8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C7FKFzzY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C7FKFzzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716396492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gvIdfA5bbP//PUTnXP+RUtPyC7hZidX6HaBGUQozClQ=;
	b=C7FKFzzYSEGDXp3A9qmPFS5DQibPiOFsSL18RaqpvZZ0+JK6ogqw0SgqD3Kx0kSaTOlvvO
	4whbsIlWzHxNZBStb93gz7sLwMkB1BL2j/SfvI8ioVOSlXIpC3OCFpaSuXk3SaVxekCVgo
	EI/ZUFkvMFM2W1DsA/RsjukAHvvvIFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-_XAs6pL1MrCw5TE0EVSvVg-1; Wed, 22 May 2024 12:48:08 -0400
X-MC-Unique: _XAs6pL1MrCw5TE0EVSvVg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F47E812296;
	Wed, 22 May 2024 16:48:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCF0940005C;
	Wed, 22 May 2024 16:48:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Gregor Riepl <onitake@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add support for setting touchscreen properties from cmdline
Date: Wed, 22 May 2024 18:48:07 +0200
Message-ID: <20240522164807.28936-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On x86/ACPI platforms touchscreens mostly just work without needing any
device/model specific configuration. But in some cases (mostly with Silead
and Goodix touchscreens) it is still necessary to manually specify various
touchscreen-properties on a per model basis.

touchscreen_dmi is a special place for DMI quirks for this, but it can be
challeging for users to figure out the right property values, especially
for Silead touchscreens where non of these can be read back from the ctrl.

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
Note assuming this gets favourable review(s) in a reasonable timeframe
I'm thinking about maybe even adding this to 6.10 as a fix since users
not being able to easily test Silead touchscreen settings has been an
issue for quite a while now. Without the cmdline option being used this
is a no-op so the chance of this causing regressions is close to 0.
---
 .../admin-guide/kernel-parameters.txt         | 22 ++++++
 drivers/platform/x86/touchscreen_dmi.c        | 76 ++++++++++++++++++-
 2 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 396137ee018d..9d04fc8d191f 100644
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
+			<ACPI_HW_ID>,<prop_name>=<val>[,prop_name=val][,...]
+			Where <val> is one of:
+			Omit "=<val>" entirely	Set a boolean device-property
+			Unsigned number		Set a u32 device-property
+			Anything else		Set a string device-property
+
+			Examples (split over multiple lines):
+			i2c_touchscreen_props=GDIX1001,touchscreen-inverted-x,
+			touchscreen-inverted-y
+
+			i2c_touchscreen_props=MSSL1680,touchscreen-size-x=1920,
+			touchscreen-size-y=1080,touchscreen-inverted-y,
+			firmware-name=gsl1680-vendor-model.fw
+
 	i8042.debug	[HW] Toggle i8042 debug mode
 	i8042.unmask_kbd_data
 			[HW] Enable printing of interrupt data from the KBD port
diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index c6a10ec2c83f..63400ef6d90d 100644
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
@@ -1852,20 +1855,87 @@ static int ts_dmi_notifier_call(struct notifier_block *nb,
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
+	char *name, *value;
+	u32 u32val;
+	int i, ret;
+
+	/*
+	 * str is part of the static_command_line from init/main.c and poking
+	 * holes in that by writing 0 to it is allowed, as is taking long
+	 * lasting references to it.
+	 */
+	ts_cmdline_data.acpi_name = strsep(&str, ",");
+
+	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
+		name = strsep(&str, ",");
+		if (!name)
+			break;
+
+		/* Replace '=' with 0 and make value point past '=' or NULL */
+		value = name;
+		strsep(&value, "=");
+		if (!value) {
+			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
+		} else if (isdigit(value[0])) {
+			ret = kstrtou32(value, 10, &u32val);
+			if (ret)
+				return ret;
+
+			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
+		} else {
+			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
+		}
+	}
+
+	if (!i)
+		return -EINVAL; /* No properties specified */
+
+	if (str)
+		return -ENOSPC; /* More then MAX_CMDLINE_PROPS properties specified */
+
+	ts_data = &ts_cmdline_data;
+	return 0;
+}
+__setup("i2c_touchscreen_props=", ts_parse_props);
+
 static struct notifier_block ts_dmi_notifier = {
 	.notifier_call = ts_dmi_notifier_call,
 };
 
 static int __init ts_dmi_init(void)
 {
+	struct ts_dmi_data *ts_data_dmi = NULL;
 	const struct dmi_system_id *dmi_id;
 	int error;
 
 	dmi_id = dmi_first_match(touchscreen_dmi_table);
-	if (!dmi_id)
+	if (dmi_id)
+		ts_data_dmi = dmi_id->driver_data;
+
+	if (!ts_data && !ts_data_dmi)
 		return 0; /* Not an error */
 
-	ts_data = dmi_id->driver_data;
+	if (ts_data) {
+		/*
+		 * Kernel cmdline provided data takes precedence, copy over
+		 * DMI efi_embedded_fw info if available.
+		 */
+		if (ts_data_dmi)
+			ts_data->embedded_fw = ts_data_dmi->embedded_fw;
+	} else {
+		ts_data = ts_data_dmi;
+	}
+
 	/* Some dmi table entries only provide an efi_embedded_fw_desc */
 	if (!ts_data->properties)
 		return 0;
-- 
2.45.1

