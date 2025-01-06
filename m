Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3B6FB9
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166790; cv=none; b=fNyzT6jUfnI8xib2YrOUvMQjtfH6fGW0uM2vIT68pvsFyp8ehXn/aI4ph9wuLsFvdyJ1ye7ARbh8bZvpQ07pXXGeK1/QWu/3szXpNxAjAHWw/Lo0tR3bGwsNf2KfrB0YLVIh3NqLXgKeQqW6fBBajKDSc6xtX9Td1RbUpPsNadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166790; c=relaxed/simple;
	bh=1d0xYhQASJTpA0FOve8PkydoKfcc7r1Xx406s08Nwh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9CacFKE9t9fXmpDcR3l8UrwcOGOz9xJ8NtYwy6zPGysBZj9RAGCzM5eZMeqEUcn+SCO+08Mkc1NBBqEDknRqeYBUCI4c7irjTTJzHaO2WadYu3fSvFA/sAT6LnQIJDW/9liwJoIUP/vMNVmospedKL0a23KBPOKe6zKyIVlVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Og7grPIz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Og7grPIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736166786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=13zICaoH6HWKbaF5On5sHd2bs/GXQHSE10Trdh0xem8=;
	b=Og7grPIzC/at7NfVlDuNTKlHqVw7RGA/kY2r1tv8uR+o1ToN1JyrmltnRw4brgA0v+35T4
	21KgP6wtotD2J6zG/oIDx9B4IG/847YH86VjWe9xuITSRGkkoE6k1dpi/uqWNS+0F28bd3
	zDRjts1RZfz5DaocGSd1WQiL1rkNpZ0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-dqjGZFRROgG4fTVs5rL1Hw-1; Mon,
 06 Jan 2025 07:33:05 -0500
X-MC-Unique: dqjGZFRROgG4fTVs5rL1Hw-1
X-Mimecast-MFC-AGG-ID: dqjGZFRROgG4fTVs5rL1Hw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B69A81954B03;
	Mon,  6 Jan 2025 12:33:03 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.170])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C90981956053;
	Mon,  6 Jan 2025 12:33:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dell.Client.Kernel@dell.com
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v11] platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
Date: Mon,  6 Jan 2025 13:32:59 +0100
Message-ID: <20250106123259.45970-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
of the accelerometer. So a DMI product-name to address mapping table
is used.

Add support to have the kernel probe for the i2c-address for models
which are not on the list.

The new probing code sits behind a new probe_i2c_addr module parameter,
which is disabled by default because probing might be dangerous.

Link: https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v11:
- Change "At support" to "Add support" in commit message
- Change "commandline" to "command line" in pr_info() message

Changes in v10:
- Log "please report this upstream to platform-driver-x86@vger.kernel.org
  so that a quirk can be added" on successful probe
- Now a standalone patch since the rest of the series has been merged

Changes in v8:
- Use dev_err() / dev_dbg() where possible using &adap->dev as the device
  for logging

Changes in v6:
- Use i2c_new_scanned_device() instead of re-inventing it

Changes in v5:
- Add "this may be dangerous warning" to MODULE_PARM_DESC(probe_i2c_addr)
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 56 ++++++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index d2b34e10c5eb..c1596858dda6 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -15,6 +15,8 @@
 #include <linux/workqueue.h>
 #include "dell-smo8800-ids.h"
 
+#define LIS3_WHO_AM_I 0x0f
+
 #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr)                 \
 	{                                                                \
 		.matches = {                                             \
@@ -57,6 +59,42 @@ static u8 i2c_addr;
 static struct i2c_client *i2c_dev;
 static bool notifier_registered;
 
+static bool probe_i2c_addr;
+module_param(probe_i2c_addr, bool, 0444);
+MODULE_PARM_DESC(probe_i2c_addr, "Probe the i801 I2C bus for the accelerometer on models where the address is unknown, this may be dangerous.");
+
+static int detect_lis3lv02d(struct i2c_adapter *adap, unsigned short addr)
+{
+	union i2c_smbus_data smbus_data;
+	int err;
+
+	dev_info(&adap->dev, "Probing for lis3lv02d on address 0x%02x\n", addr);
+
+	err = i2c_smbus_xfer(adap, addr, 0, I2C_SMBUS_READ, LIS3_WHO_AM_I,
+			     I2C_SMBUS_BYTE_DATA, &smbus_data);
+	if (err < 0)
+		return 0; /* Not found */
+
+	/* valid who-am-i values are from drivers/misc/lis3lv02d/lis3lv02d.c */
+	switch (smbus_data.byte) {
+	case 0x32:
+	case 0x33:
+	case 0x3a:
+	case 0x3b:
+		break;
+	default:
+		dev_warn(&adap->dev, "Unknown who-am-i register value 0x%02x\n",
+			 smbus_data.byte);
+		return 0; /* Not found */
+	}
+
+	dev_info(&adap->dev,
+		 "Detected lis3lv02d on address 0x%02x, please report this upstream to platform-driver-x86@vger.kernel.org so that a quirk can be added\n",
+		 addr);
+
+	return 1; /* Found */
+}
+
 static bool i2c_adapter_is_main_i801(struct i2c_adapter *adap)
 {
 	/*
@@ -97,10 +135,18 @@ static void instantiate_i2c_client(struct work_struct *work)
 	if (!adap)
 		return;
 
-	info.addr = i2c_addr;
 	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
 
-	i2c_dev = i2c_new_client_device(adap, &info);
+	if (i2c_addr) {
+		info.addr = i2c_addr;
+		i2c_dev = i2c_new_client_device(adap, &info);
+	} else {
+		/* First try address 0x29 (most used) and then try 0x1d */
+		static const unsigned short addr_list[] = { 0x29, 0x1d, I2C_CLIENT_END };
+
+		i2c_dev = i2c_new_scanned_device(adap, &info, addr_list, detect_lis3lv02d);
+	}
+
 	if (IS_ERR(i2c_dev)) {
 		dev_err(&adap->dev, "error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
 		i2c_dev = NULL;
@@ -169,12 +215,14 @@ static int __init dell_lis3lv02d_init(void)
 	put_device(dev);
 
 	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
-	if (!lis3lv02d_dmi_id) {
+	if (!lis3lv02d_dmi_id && !probe_i2c_addr) {
 		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
+		pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel command line to probe, this may be dangerous!\n");
 		return 0;
 	}
 
-	i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
+	if (lis3lv02d_dmi_id)
+		i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
 
 	/*
 	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
-- 
2.47.1

