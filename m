Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B28194089
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723495223; cv=none; b=C/7eNRYANaz/tBObBpYeYnoiyv8joFetNe2he7hymgyotmYohc2p+jj16Xv2INWdCiYvs4t8w205TekKLSJHEK7q34/g+/8vo5OU+JnUtK0DPhNej509cV6utpy6aX3KXz9hVom0kP4y/59dwi8Dne7bPDtOWHINKVmxRHeCntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723495223; c=relaxed/simple;
	bh=gMfm9EGJBYETj9ZrSgquZc2XRJciodS3o7/O1KmD6Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iag1AoywNTQ3TBDuO84VUcMJRhd3lctEgp2zlkn8drMpSIZtALXggX4XVdmUozyDEKVXAv9Yofq0Jcco55Hoq7GCaoGwgFt7BuECOMdqAmhppoFPTpBaX8xqH1fpZoTYgi8t85tbKqzCZO12++4BjkNqrgIW6yhua0koK10XKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H1bnb/fD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H1bnb/fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723495221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxKg8emRufx4ixcByje1XsbE0BM9cSOJfPxHbCdxwJw=;
	b=H1bnb/fD5IWy3YKEPUTPdMJUN8iwJz41scN0rBr0iv3ocnYn7XuwKbY/kQVTsPnnAnGqtG
	+lKxIBFVtS63tmGLxdmFSbQOVU2IcCyaOcdgaLQ0LnEmcJO2iqpMxnbf8y1/Q1HNsOO0k9
	jYwAAFxAyEa93mK8/Pv17Epd3ZA9r94=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-3JFmeSjENa2glvDXNo2KJg-1; Mon,
 12 Aug 2024 16:40:17 -0400
X-MC-Unique: 3JFmeSjENa2glvDXNo2KJg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA2C619332AC;
	Mon, 12 Aug 2024 20:40:15 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.50])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E821C19560AD;
	Mon, 12 Aug 2024 20:40:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v8 3/6] platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to dell-smo8800-ids.h
Date: Mon, 12 Aug 2024 22:39:49 +0200
Message-ID: <20240812203952.42804-4-hdegoede@redhat.com>
In-Reply-To: <20240812203952.42804-1-hdegoede@redhat.com>
References: <20240812203952.42804-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Move the SMO88xx acpi_device_ids to a new dell-smo8800-ids.h header,
so that these can be shared with the new dell-lis3lv02d code.

Reviewed-by: Pali Rohár <pali@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
- Add #include <linux/module.h> for MODULE_DEVICE_TABLE()

Changes in v4:
- This is a new patch in v3 of this patch-set
---
 drivers/platform/x86/dell/dell-smo8800-ids.h | 27 ++++++++++++++++++++
 drivers/platform/x86/dell/dell-smo8800.c     | 16 +-----------
 2 files changed, 28 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h

diff --git a/drivers/platform/x86/dell/dell-smo8800-ids.h b/drivers/platform/x86/dell/dell-smo8800-ids.h
new file mode 100644
index 000000000000..ec58e229ba7a
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-smo8800-ids.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  ACPI SMO88XX lis3lv02d freefall / accelerometer device-ids.
+ *
+ *  Copyright (C) 2012 Sonal Santan <sonal.santan@gmail.com>
+ *  Copyright (C) 2014 Pali Rohár <pali@kernel.org>
+ */
+#ifndef _DELL_SMO8800_IDS_H_
+#define _DELL_SMO8800_IDS_H_
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+static const struct acpi_device_id smo8800_ids[] = {
+	{ "SMO8800" },
+	{ "SMO8801" },
+	{ "SMO8810" },
+	{ "SMO8811" },
+	{ "SMO8820" },
+	{ "SMO8821" },
+	{ "SMO8830" },
+	{ "SMO8831" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, smo8800_ids);
+
+#endif
diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index f7ec17c56833..f9119ed2bd92 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -14,10 +14,10 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/miscdevice.h>
-#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
+#include "dell-smo8800-ids.h"
 
 struct smo8800_device {
 	u32 irq;                     /* acpi device irq */
@@ -163,20 +163,6 @@ static void smo8800_remove(struct platform_device *device)
 	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
 }
 
-/* NOTE: Keep this list in sync with drivers/i2c/busses/i2c-i801.c */
-static const struct acpi_device_id smo8800_ids[] = {
-	{ "SMO8800", 0 },
-	{ "SMO8801", 0 },
-	{ "SMO8810", 0 },
-	{ "SMO8811", 0 },
-	{ "SMO8820", 0 },
-	{ "SMO8821", 0 },
-	{ "SMO8830", 0 },
-	{ "SMO8831", 0 },
-	{ "", 0 },
-};
-MODULE_DEVICE_TABLE(acpi, smo8800_ids);
-
 static struct platform_driver smo8800_driver = {
 	.probe = smo8800_probe,
 	.remove_new = smo8800_remove,
-- 
2.46.0

