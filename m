Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949E19E97C
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Nov 2024 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189956; cv=none; b=nhkuaZukXNxoNBqvHyAzorzDKUxHOrcp7qcTD2tFiQ02WE/JvDw1AXlwiitgz9yLpedYz+I0uciu+m1WM0fDfJezFF6RYhWcyOcsDZqYEsjvygqbNtX3mktZYHwsA1Wy9cHB96S4Elg/r+vXDWf5cQuw+XvMIVG73QuJHWavCY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189956; c=relaxed/simple;
	bh=FsezVi9lwWQ0kHJ/ANClkX0JdBCXcIzCmCWtks8nHLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlCY6asE7VqPri4/bV1c8dZDrXcmjA7hIGWwXnROi8Vp93OxWzFq42jppkrBJI9rz9gMNtXRKMSQnkceQ/FYaEHGFGtW0L0X9cQz3gJyZHYPElWHyQtVHZTuFYMNrIKjmeeBcCQD6M+fGViax+KvCYPRrs0xEzNIz00axAzb3gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LUpbcRVe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LUpbcRVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731189953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/Rys6gUkBVn8yEccKL39GiIokpWyRkhEE85j5Zwodo=;
	b=LUpbcRVexvQEUUFwk6BCjPG2BiJryGY/ta1t9+O9O/EWUUYGqlvLcD5a3h/BTngY8GENGK
	UfhnOKONgqyMdaCglc8O6dvLqIGHw1Q0gjaoV+0/9URcGR5H2hpc4BzpaK3+lXp8CDva+G
	r3FVwp+O3E2DWMB+WdSM6ivlQUCiPCY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-201-r7CtkWhdMbmGeY9bNL49cA-1; Sat,
 09 Nov 2024 17:05:49 -0500
X-MC-Unique: r7CtkWhdMbmGeY9bNL49cA-1
X-Mimecast-MFC-AGG-ID: r7CtkWhdMbmGeY9bNL49cA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8FB9019560AE;
	Sat,  9 Nov 2024 22:05:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.21])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 401DA1956056;
	Sat,  9 Nov 2024 22:05:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: x86-android-tablets: Add support for getting serdev-controller by PCI parent
Date: Sat,  9 Nov 2024 23:05:29 +0100
Message-ID: <20241109220530.83394-5-hdegoede@redhat.com>
In-Reply-To: <20241109220530.83394-1-hdegoede@redhat.com>
References: <20241109220530.83394-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linux
(guadalinex) using the custom Android kernel the UART controllers are not
enumerated as ACPI devices as they typically are.

Instead they are enumerated through PCI and getting the serdev-controller
by ACPI HID + UID does not work.

Add support for getting the serdev-controller by the PCI devfn of its
parent instead.

This also renames the use_pci_devname flag to use_pci since the former
name now no longer is accurate.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/core.c   | 22 ++++++++++++++++---
 .../platform/x86/x86-android-tablets/other.c  |  2 +-
 .../x86-android-tablets/x86-android-tablets.h |  6 ++++-
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 800d6c84dced..4633a9560bd2 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -212,7 +212,7 @@ static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info
 	if (board_info.irq < 0)
 		return board_info.irq;
 
-	if (dev_info->use_pci_devname)
+	if (dev_info->use_pci)
 		adap = get_i2c_adap_by_pci_parent(client_info);
 	else
 		adap = get_i2c_adap_by_handle(client_info);
@@ -271,6 +271,19 @@ static __init int x86_instantiate_spi_dev(const struct x86_dev_info *dev_info, i
 	return 0;
 }
 
+static __init struct device *
+get_serdev_controller_by_pci_parent(const struct x86_serdev_info *info)
+{
+	struct pci_dev *pdev;
+
+	pdev = pci_get_domain_bus_and_slot(0, 0, info->ctrl_devfn);
+	if (!pdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	/* This puts our reference on pdev and returns a ref on the ctrl */
+	return get_serdev_controller_from_parent(&pdev->dev, 0, info->ctrl_devname);
+}
+
 static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, int idx)
 {
 	const struct x86_serdev_info *info = &dev_info->serdev_info[idx];
@@ -279,8 +292,11 @@ static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, in
 	struct device *ctrl_dev;
 	int ret = -ENODEV;
 
-	ctrl_dev = get_serdev_controller(info->ctrl_hid, info->ctrl_uid, 0,
-					 info->ctrl_devname);
+	if (dev_info->use_pci)
+		ctrl_dev = get_serdev_controller_by_pci_parent(info);
+	else
+		ctrl_dev = get_serdev_controller(info->ctrl_hid, info->ctrl_uid, 0,
+						 info->ctrl_devname);
 	if (IS_ERR(ctrl_dev))
 		return PTR_ERR(ctrl_dev);
 
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 725948044da4..f5140d5ce61a 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -757,7 +757,7 @@ const struct x86_dev_info vexia_edu_atla10_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_i2c_clients),
 	.gpiod_lookup_tables = vexia_edu_atla10_gpios,
 	.init = vexia_edu_atla10_init,
-	.use_pci_devname = true,
+	.use_pci = true,
 };
 
 /*
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 0fc7e8cff672..bab27fdcd873 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -57,8 +57,12 @@ struct x86_spi_dev_info {
 };
 
 struct x86_serdev_info {
+	/* For ACPI enumerated controllers */
 	const char *ctrl_hid;
 	const char *ctrl_uid;
+	/* For PCI enumerated controllers */
+	unsigned int ctrl_devfn;
+	/* Typically "serial0" */
 	const char *ctrl_devname;
 	/*
 	 * ATM the serdev core only supports of or ACPI matching; and so far all
@@ -91,7 +95,7 @@ struct x86_dev_info {
 	int gpio_button_count;
 	int (*init)(struct device *dev);
 	void (*exit)(void);
-	bool use_pci_devname;
+	bool use_pci;
 };
 
 int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *con_id,
-- 
2.47.0

