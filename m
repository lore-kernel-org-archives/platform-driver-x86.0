Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26F818F2E2
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344976; cv=none; b=CS9SNnSgO7dcnxi/8lIcIFUk55a/GTAD9Ei/9+RmK9exJ1Zwd+HJcfA0K87TLS4VgyL+p07lxPs5HW0z6ffDtWgQuWn7nTPWV33sJAtPvkFzxA4zbD78g0RT3n2yMsyOyTHk2pZZ+d27o20XTnL8AWk/LsGJoJsP0PFWIlu5/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344976; c=relaxed/simple;
	bh=7r9aXZk1hc+0PNIrZYP2GJHJzXXIir5l/gbHQD6WaRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNRpI483OfEebMrJGBg/1h6xVZJGYFOnjs4yQ7qbS3hsU/AKz0FS91qKzktwqo50kNZELmcs3AH+9LqIBhHFbcPas067jyvsfG7A9edI8qGiz06Fe8ugXUU07j4SARueEsGG+bSzs5WMXwtH/4780QDt8SmpzepkXgTXc+O9pwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G808sC8j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G808sC8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zm59BE3MeApOjwWVR9/2m6BXSQnRERKDIRpFK2LFZ94=;
	b=G808sC8jcjoOmpk3BmuA4Fv/T/zJcfD+c1a/zGBRl8RwOW2g3AHcWApKE1BmSI+2dE1ho3
	+M3ELYIw9laExZ/rOW4f1J7e0Qk5MlizGoE1+llB34ynu8CDwDiZH/9hjHrOCwy3sTfZE3
	YAjch4PbDdhNO0NtnIH3u1Xmetc/xD0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-IvXOi7v-PD6fKRvGqaujnQ-1; Wed,
 04 Dec 2024 15:42:50 -0500
X-MC-Unique: IvXOi7v-PD6fKRvGqaujnQ-1
X-Mimecast-MFC-AGG-ID: IvXOi7v-PD6fKRvGqaujnQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7AFD1955F2F;
	Wed,  4 Dec 2024 20:42:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B5331956094;
	Wed,  4 Dec 2024 20:42:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 6/8] platform/x86: x86-android-tablets: Store serdev-controller ACPI HID + UID in a union
Date: Wed,  4 Dec 2024 21:42:17 +0100
Message-ID: <20241204204227.95757-7-hdegoede@redhat.com>
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

Store the serdev-controller ACPI HID + UID in a union inside struct
x86_serdev_info.

This is a preparation patch for adding support for PCI enumerated serdev-
controllers which will be done by the devfn value of the PCI device.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
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

