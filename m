Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509D81F0E32
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734779473; cv=none; b=NC0daF8jR3N/qmMTeoIKVOYWML6FKJLpcmt95+4Msj1oLtMCTjcckOIhYeES9UCjx0gxxTSyzs8aqKha6lxuGnQgqU428BpYbiKgItzE5QETd9pfZuKfpnsPvgf6pKu2LbAkchq3oAqtfPfCKrSig5h6HL9Pq3VoQW8t/KVM5dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734779473; c=relaxed/simple;
	bh=ZC74ZnBQ+8YL0Db7itJbvFBHREicz1ecje8q1TDgNm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvDlCB+kFx7bnobOu2XTiU/XKv+vJhgA8WUWzxYd2EFT0sfC1YMiHLJdX6+tZ1B9sIRQoWKKAWAw7mgbB2gUe3s511LBpTq+XWcZyWn7ureh89gjzgdSd7SeiJTWWflrD6GaHuK0yVJf/kRHM4XjJk9/cN9JhSTtd4Jc/XRHynU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TiF5REKM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TiF5REKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734779470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j/uLtPDjlZubpqZurY3laZ7xSik7KGSb3daMN12njuY=;
	b=TiF5REKMpMWzZmxSf0ptpt/VVRomTyOeymAq7tdj0yPAWG+Jx5mtw7+XGDuodVaafwyekD
	sWBzk/l7sCllv3fzxKuuxqDvJqh5kMxdq2rRrvElUQnQxkh1XxhSbBl8Slfpt+OjNzEvGG
	c8qi9JU5CMKE8AJ5ypWk8b5uay3ZGPw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-AvmJQVr3OPuxegzQe0wLmg-1; Sat,
 21 Dec 2024 06:11:08 -0500
X-MC-Unique: AvmJQVr3OPuxegzQe0wLmg-1
X-Mimecast-MFC-AGG-ID: AvmJQVr3OPuxegzQe0wLmg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23B68195609F;
	Sat, 21 Dec 2024 11:11:07 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.23])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6AC8030044C1;
	Sat, 21 Dec 2024 11:11:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dell.Client.Kernel@dell.com
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v10] platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
Date: Sat, 21 Dec 2024 12:11:03 +0100
Message-ID: <20241221111103.26124-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
of the accelerometer. So a DMI product-name to address mapping table
is used.

At support to have the kernel probe for the i2c-address for modesl
which are not on the list.

The new probing code sits behind a new probe_i2c_addr module parameter,
which is disabled by default because probing might be dangerous.

Link: https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
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
index d2b34e10c5eb..37bee890bc20 100644
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
+		pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
 		return 0;
 	}
 
-	i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
+	if (lis3lv02d_dmi_id)
+		i2c_addr = (long)lis3lv02d_dmi_id->driver_data;
 
 	/*
 	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
-- 
2.47.1

