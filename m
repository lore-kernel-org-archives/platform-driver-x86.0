Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179DC13C816
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771350; cv=none; b=qkfgYbVn4CfBkBSMkzuUdeELIVc62sU6+DQ53QiB0JIw+V3CqdAIzLHmHRtVcidHeVrnhnNETkNCl7WXn/dkaJFSBf3nnS5roqCxQgi+x7KWnqW/D9/6MXEgRzRURlYRNDp5SLz5uxw8yPJkWyT4x5/Rccv0vp1Ck2KoK56DjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771350; c=relaxed/simple;
	bh=BuTYySDIwhIBex7reSzfKzj3k+piyHG1iJrh0k+ZUes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZjQJLrra5sFPFL0ejpyduXvKnQtwP7CrqbDrlQuAmKXFWj34adg0pEoZ5uWJikPPlM3CiaZ4Y9asmkRFbyUq8ZNepOTAdzIA5XAQsLF4wvxTW5l5YBJdW+q9BKbx8V99QP9nmdnVmj5qDqEKCj6OXEYw5ACH5NJN6sSNubxy3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVOGJ/pv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVOGJ/pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731771348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trhaP5Tci1/1tt6C5mySGrW6AMa4ErRwb9xcv4bCOe4=;
	b=iVOGJ/pvIFjWzEK6US4n/B54iH2z5fSdPBIOS80VELMUDEypKjOsZxJpV4UBowWKJA+iC7
	ASNdos3pqGUtyiHYyQaeq7UsxRvHu+31vSeCW9n5zuqdmD8N84sHUHpHT/J96MaO7b3eKe
	TGPPk6moyklu0sH2cRcyhn5/q0M0Jko=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-4a4zgR1lMnmXwVjoON2GfA-1; Sat,
 16 Nov 2024 10:35:44 -0500
X-MC-Unique: 4a4zgR1lMnmXwVjoON2GfA-1
X-Mimecast-MFC-AGG-ID: 4a4zgR1lMnmXwVjoON2GfA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5625F1956077;
	Sat, 16 Nov 2024 15:35:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC6EE1956054;
	Sat, 16 Nov 2024 15:35:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 4/6] platform/x86: x86-android-tablets: Store serdev-controller ACPI HID + UID in a union
Date: Sat, 16 Nov 2024 16:35:31 +0100
Message-ID: <20241116153533.84722-5-hdegoede@redhat.com>
In-Reply-To: <20241116153533.84722-1-hdegoede@redhat.com>
References: <20241116153533.84722-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Store the serdev-controller ACPI HID + UID in a union inside struct
x86_serdev_info.

This is a preparation patch for adding support for PCI enumerated serdev-
controllers which will be done by the devfn value of the PCI device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- This is a new patch in v2 of this patch-series
---
 drivers/platform/x86/x86-android-tablets/asus.c           | 4 ++--
 drivers/platform/x86/x86-android-tablets/core.c           | 2 +-
 drivers/platform/x86/x86-android-tablets/lenovo.c         | 4 ++--
 .../x86/x86-android-tablets/x86-android-tablets.h         | 8 ++++++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 07fbeab2319a..7dde63b9943f 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -145,8 +145,8 @@ static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst =
 
 static const struct x86_serdev_info asus_me176c_serdevs[] __initconst = {
 	{
-		.ctrl_hid = "80860F0A",
-		.ctrl_uid = "2",
+		.ctrl.acpi.hid = "80860F0A",
+		.ctrl.acpi.uid = "2",
 		.ctrl_devname = "serial0",
 		.serdev_hid = "BCM2E3A",
 	},
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 800d6c84dced..59909c53fca4 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -279,7 +279,7 @@ static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, in
 	struct device *ctrl_dev;
 	int ret = -ENODEV;
 
-	ctrl_dev = get_serdev_controller(info->ctrl_hid, info->ctrl_uid, 0,
+	ctrl_dev = get_serdev_controller(info->ctrl.acpi.hid, info->ctrl.acpi.uid, 0,
 					 info->ctrl_devname);
 	if (IS_ERR(ctrl_dev))
 		return PTR_ERR(ctrl_dev);
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index ae087f1471c1..98085cb49c74 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -178,8 +178,8 @@ static const struct platform_device_info lenovo_yb1_x90_pdevs[] __initconst = {
  */
 static const struct x86_serdev_info lenovo_yb1_x90_serdevs[] __initconst = {
 	{
-		.ctrl_hid = "8086228A",
-		.ctrl_uid = "1",
+		.ctrl.acpi.hid = "8086228A",
+		.ctrl.acpi.uid = "1",
 		.ctrl_devname = "serial0",
 		.serdev_hid = "BCM2E1A",
 	},
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 0fc7e8cff672..5ddec4beb552 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -57,8 +57,12 @@ struct x86_spi_dev_info {
 };
 
 struct x86_serdev_info {
-	const char *ctrl_hid;
-	const char *ctrl_uid;
+	union {
+		struct {
+			const char *hid;
+			const char *uid;
+		} acpi;
+	} ctrl;
 	const char *ctrl_devname;
 	/*
 	 * ATM the serdev core only supports of or ACPI matching; and so far all
-- 
2.47.0

