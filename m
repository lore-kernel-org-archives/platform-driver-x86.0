Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B118EFCC
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344978; cv=none; b=uQjnyVQy/T2M2/k/k7AOmv7eaz0YgNElk4TX5+/zM0rgsiglCCcTZVm9W8S75Dw/JLh/AcGTSMpJJlEM9VsXo3PuZmpsteWY+So0qf4UkirOtXa7Lz3BdqZy2pFrL0IAfrj/QaBqIEC+csA3Pnio8qyGoGzv8VbQUO9uTgwX5kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344978; c=relaxed/simple;
	bh=BkkPvtN18HsKTnMbMT6/JMBcTSYf/fy9k79efKrHKKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0rL01vF5NHtWMdjZy2ju9yaVuDUPqOi0XHoNiAOix+hIY4Z0TxWh09rpObXng/PKrmxDsHrdzTZvHVCn5i6TZdtHZyYRiJhaudhzErTDm/pNpasjjRMqlnOJej/hUr6kj2BopPrhj8RGy24uSjpugeVQuJ5gz10KDi2slZhpew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gVbhTAwy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gVbhTAwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyHWZmMSQa+lOrIHSkG93yPvSvv8gO48zYB2ah9/ijM=;
	b=gVbhTAwy1Mt5g3usonsFyN4E0+LUD9uWzrVmpyiP6wGNI+SY8spBEiEKU+fbYTOZDfNPPO
	GzgG+/w/ZTMA3QUIUkMiBIdgS2aHHzzncLseYhWSgz22rJw6W43Nw0aV381lUKOS6g2cJ1
	n3n8/FEeQGZTNzPxARaByS7urclslFE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-I4ZudqDbOeaINNs8fciSLQ-1; Wed,
 04 Dec 2024 15:42:52 -0500
X-MC-Unique: I4ZudqDbOeaINNs8fciSLQ-1
X-Mimecast-MFC-AGG-ID: I4ZudqDbOeaINNs8fciSLQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6531C1956046;
	Wed,  4 Dec 2024 20:42:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 186111956094;
	Wed,  4 Dec 2024 20:42:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 7/8] platform/x86: x86-android-tablets: Add support for getting serdev-controller by PCI parent
Date: Wed,  4 Dec 2024 21:42:18 +0100
Message-ID: <20241204204227.95757-8-hdegoede@redhat.com>
In-Reply-To: <20241204204227.95757-1-hdegoede@redhat.com>
References: <20241204204227.95757-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

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
index de5b3f1ce9a7..3032b6337804 100644
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

