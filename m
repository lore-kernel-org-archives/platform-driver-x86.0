Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1521369A9
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114658; cv=none; b=sYPMWvuUWyQEV4Fp4cv9OgoXhsHNRzNYMLU9dbgKYPjb3jABfXxxhYrBgVwcTh6OdVJBIQ1AZqUhJu5HPFHdEZgLA2LjupC3sgmvpjYS7sCbZG0213xtuM4SEo4AVVTsUz8RGPRPJQKkgaGtPKFkzPYCjggoa1RqeDJezokU1OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114658; c=relaxed/simple;
	bh=zSctRpaf5rPkrTLLh2jjOAhZxv3zdqatTktOdz55wqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIN7qF5+jdKj8Sd2Z0vEozo/nB0N0KbLBOyWdVBNMSasXrteLQrJgxYWXEVkQQ3atQvYVyiLyUtPJ4jjPYuovKLzeu4tZmff4/LPJEQCqWSTQKmroN/PuwMjIqGEIMuXj3FL2c1CDovDQEDfUl1oj6cwDt0roE9pDRnonOtygmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pljt3WCP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pljt3WCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708114655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/88Y3YyhVhk1UI6akLWBE+RYsK88mprWl/gUnmNt0I=;
	b=Pljt3WCPTpwdpgvIw+jPDzyN2UczTUxyScNxHxvxyYCB+FVRpNH2stXX+wttYZtQSZcfQD
	f00pewBt4QkPxEB9XwzhT9mKcToP5fA3EfupriceNPGRjnM5/Ir0V2PPxYbTaY/dBAlqEq
	LF2NSRJfy5w9IuMf19KKCHxczvV476k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-SgLNWaPoMwu-Pdwth2kK3A-1; Fri, 16 Feb 2024 15:17:33 -0500
X-MC-Unique: SgLNWaPoMwu-Pdwth2kK3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CFB585A1B9;
	Fri, 16 Feb 2024 20:17:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 796722166AE8;
	Fri, 16 Feb 2024 20:17:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH 3/4] platform/x86: x86-android-tablets: Fix serdev instantiation no longer working
Date: Fri, 16 Feb 2024 21:17:20 +0100
Message-ID: <20240216201721.239791-4-hdegoede@redhat.com>
In-Reply-To: <20240216201721.239791-1-hdegoede@redhat.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

After commit b286f4e87e32 ("serial: core: Move tty and serdev to be
children of serial core port device") x86_instantiate_serdev() no longer
works due to the serdev-controller-device moving in the device hierarchy
from (e.g.) /sys/devices/pci0000:00/8086228A:00/serial0 to
/sys/devices/pci0000:00/8086228A:00/8086228A:00:0/8086228A:00:0.0/serial0

Use the new get_serdev_controller() helper function to fix this.

Fixes: b286f4e87e32 ("serial: core: Move tty and serdev to be children of serial core port device")
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/core.c   | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index f6547c9d7584..a3415f1c0b5f 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -21,6 +21,7 @@
 #include <linux/string.h>
 
 #include "x86-android-tablets.h"
+#include "../serdev_helpers.h"
 
 static struct platform_device *x86_android_tablet_device;
 
@@ -232,38 +233,20 @@ static __init int x86_instantiate_spi_dev(const struct x86_dev_info *dev_info, i
 
 static __init int x86_instantiate_serdev(const struct x86_serdev_info *info, int idx)
 {
-	struct acpi_device *ctrl_adev, *serdev_adev;
+	struct acpi_device *serdev_adev;
 	struct serdev_device *serdev;
 	struct device *ctrl_dev;
 	int ret = -ENODEV;
 
-	ctrl_adev = acpi_dev_get_first_match_dev(info->ctrl_hid, info->ctrl_uid, -1);
-	if (!ctrl_adev) {
-		pr_err("error could not get %s/%s ctrl adev\n",
-		       info->ctrl_hid, info->ctrl_uid);
-		return -ENODEV;
-	}
+	ctrl_dev = get_serdev_controller(info->ctrl_hid, info->ctrl_uid, 0,
+					 info->ctrl_devname);
+	if (IS_ERR(ctrl_dev))
+		return PTR_ERR(ctrl_dev);
 
 	serdev_adev = acpi_dev_get_first_match_dev(info->serdev_hid, NULL, -1);
 	if (!serdev_adev) {
 		pr_err("error could not get %s serdev adev\n", info->serdev_hid);
-		goto put_ctrl_adev;
-	}
-
-	/* get_first_physical_node() returns a weak ref, no need to put() it */
-	ctrl_dev = acpi_get_first_physical_node(ctrl_adev);
-	if (!ctrl_dev)	{
-		pr_err("error could not get %s/%s ctrl physical dev\n",
-		       info->ctrl_hid, info->ctrl_uid);
-		goto put_serdev_adev;
-	}
-
-	/* ctrl_dev now points to the controller's parent, get the controller */
-	ctrl_dev = device_find_child_by_name(ctrl_dev, info->ctrl_devname);
-	if (!ctrl_dev) {
-		pr_err("error could not get %s/%s %s ctrl dev\n",
-		       info->ctrl_hid, info->ctrl_uid, info->ctrl_devname);
-		goto put_serdev_adev;
+		goto put_ctrl_dev;
 	}
 
 	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
@@ -286,8 +269,8 @@ static __init int x86_instantiate_serdev(const struct x86_serdev_info *info, int
 
 put_serdev_adev:
 	acpi_dev_put(serdev_adev);
-put_ctrl_adev:
-	acpi_dev_put(ctrl_adev);
+put_ctrl_dev:
+	put_device(ctrl_dev);
 	return ret;
 }
 
-- 
2.43.0

