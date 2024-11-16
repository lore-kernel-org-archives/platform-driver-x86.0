Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F7A18027
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771351; cv=none; b=HAmwu4ZjUv5QtByZJF5SFgh0gs4QgFOV9wywuYBfbQ6hxQOKuRW6DzZvfOQIh5qwuN84eI792tRAsuKa2n+jZ/H9jzJtoVB0zmKcCQvJZsRyVIgcAJtwXry9Nw+iJ7BeCm3JxhOPcYuDfZVoGQsL0yWyJZElb52etSuKIoYitkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771351; c=relaxed/simple;
	bh=vd+OD8Fk8zZ/BXFX9u2/lJQ/nJZn9ZPVdT98PFnf8dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZo//SkWkwQK9ikuRiy3nD9W4wD+pyCfca/SzHBzszIQFfTqV1toA6fKmHwVALbipqGykW4OKzcmVvjWCv6XEFaaUqJkHyMTKnM9ScVonaV++jIpV//IqrcE7KXOugfeR0YsGn86ocZwghd4+lB2kuUQKp1k/hC419WXRC3F3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzOa21Eu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzOa21Eu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731771349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WQxveyiDuDCkPIF0ItqNfsO5+pQEUWfzbc8/0Jn82M=;
	b=hzOa21EueQDexHCyz7tLS62I22zSHDORiG4lYl4jeSHHGS9l7ZqM84YxX56uWMh8DJfEIM
	y6FtseReZkwfcyIwEx4BvlEE08PgeklR23MrAlZDurNu0uVHBnA522iNl0AQ/cOSDcZYg6
	K2Q6Q1DqkfaC2ERFd3DAzKGw0W7prKI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-ukHTJjo9OYe50y2f-hH3sg-1; Sat,
 16 Nov 2024 10:35:45 -0500
X-MC-Unique: ukHTJjo9OYe50y2f-hH3sg-1
X-Mimecast-MFC-AGG-ID: ukHTJjo9OYe50y2f-hH3sg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E55F61956083;
	Sat, 16 Nov 2024 15:35:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9912A1956054;
	Sat, 16 Nov 2024 15:35:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 5/6] platform/x86: x86-android-tablets: Add support for getting serdev-controller by PCI parent
Date: Sat, 16 Nov 2024 16:35:32 +0100
Message-ID: <20241116153533.84722-6-hdegoede@redhat.com>
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

On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linux
(guadalinex) using the custom Android kernel the UART controllers are not
enumerated as ACPI devices as they typically are.

Instead they are enumerated through PCI and getting the serdev-controller
by ACPI HID + UID does not work.

Add support for getting the serdev-controller by the PCI devfn of its
parent instead.

This also renames the use_pci_devname flag to use_pci since the former
name now no longer is accurate.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Store PCI devfn in a union inside struct x86_dev_info
---
 .../platform/x86/x86-android-tablets/core.c   | 22 ++++++++++++++++---
 .../platform/x86/x86-android-tablets/other.c  |  2 +-
 .../x86-android-tablets/x86-android-tablets.h |  5 ++++-
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 59909c53fca4..379ba0916ad8 100644
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
+	pdev = pci_get_domain_bus_and_slot(0, 0, info->ctrl.pci.devfn);
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
 
-	ctrl_dev = get_serdev_controller(info->ctrl.acpi.hid, info->ctrl.acpi.uid, 0,
-					 info->ctrl_devname);
+	if (dev_info->use_pci)
+		ctrl_dev = get_serdev_controller_by_pci_parent(info);
+	else
+		ctrl_dev = get_serdev_controller(info->ctrl.acpi.hid, info->ctrl.acpi.uid,
+						 0, info->ctrl_devname);
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
index 5ddec4beb552..63a38a0069ba 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -62,6 +62,9 @@ struct x86_serdev_info {
 			const char *hid;
 			const char *uid;
 		} acpi;
+		struct {
+			unsigned int devfn;
+		} pci;
 	} ctrl;
 	const char *ctrl_devname;
 	/*
@@ -95,7 +98,7 @@ struct x86_dev_info {
 	int gpio_button_count;
 	int (*init)(struct device *dev);
 	void (*exit)(void);
-	bool use_pci_devname;
+	bool use_pci;
 };
 
 int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *con_id,
-- 
2.47.0

