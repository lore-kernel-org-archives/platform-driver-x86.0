Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DDA1632DF
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344971; cv=none; b=Xc+DiXoWeBcfFLhOK4TzNPdMABKAgIAXABzqvfYmvsSWu7LSmEk2/DM8nD2PhQraO5X8Ns4ph6/aPpctR62X/ETppGYwl6oTHist2SPGefxww03V1WiJGwJGizzUYb7DrhTKd/8RjIR6ktANY2iMGRvw018wa/SAcKmJ8kB8qf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344971; c=relaxed/simple;
	bh=fO/umHVYVIPMxOz2R2r9ewJiDsxRbSEbYEOnX7vzjmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXu/8GMIfTrP/oWb1S3KyI+pTZPU1D/FsndndE7tgODvn4uqf1sUWE9oRDZDlYrWx376+sMabpYguVOFd5kgSCP0gyQj308hOm3CXbIzYdvg8L3YVRS2zDwHp8zur5NnHyNXHpROI6uXVdvgRQbNPFx68o+6fB2qHwJjVJ6UK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YivVs09U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YivVs09U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBX9onTm6p0xSRWD/1T8RFX5BkiODIlCEmh3nsyxOt4=;
	b=YivVs09Uk2Xhr8gpkIQBNOyoNv/s6tKNhpjUD4Kp24YUfohgCV18Pdou5/XI7rYosRY5dH
	sGojSPzI3G5421DMpLnv9LyA3pZV53zq7kPsg1iXUWL2Q9n0mfJelxeMOcrB8ir12RIGZo
	cbQ4QGlMvRrgIYIUuugIj2aDWd0Z5LA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-538-rp9ModPPM6G0L9rehO7OxQ-1; Wed,
 04 Dec 2024 15:42:47 -0500
X-MC-Unique: rp9ModPPM6G0L9rehO7OxQ-1
X-Mimecast-MFC-AGG-ID: rp9ModPPM6G0L9rehO7OxQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 366971955F3E;
	Wed,  4 Dec 2024 20:42:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD1931956094;
	Wed,  4 Dec 2024 20:42:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 4/8] platform/x86: serdev_helpers: Add get_serdev_controller_from_parent() helper
Date: Wed,  4 Dec 2024 21:42:15 +0100
Message-ID: <20241204204227.95757-5-hdegoede@redhat.com>
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

The x86-android-tablets code needs to be able to get a serdev_controller
device from a PCI parent, rather then by the ACPI HID+UID of the parent,
because on some tablets the UARTs are enumerated as PCI devices instead
of ACPI devices.

Split the code to walk the device hierarchy to find the serdev_controller
from its parents out into a get_serdev_controller_from_parent() helper
so that the x86-android-tablets code can re-use it.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/serdev_helpers.h | 60 +++++++++++++++------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/serdev_helpers.h b/drivers/platform/x86/serdev_helpers.h
index 3bc7fd8e1e19..57eac75805e2 100644
--- a/drivers/platform/x86/serdev_helpers.h
+++ b/drivers/platform/x86/serdev_helpers.h
@@ -22,32 +22,14 @@
 #include <linux/string.h>
 
 static inline struct device *
-get_serdev_controller(const char *serial_ctrl_hid,
-		      const char *serial_ctrl_uid,
-		      int serial_ctrl_port,
-		      const char *serdev_ctrl_name)
+get_serdev_controller_from_parent(struct device *ctrl_dev,
+				  int serial_ctrl_port,
+				  const char *serdev_ctrl_name)
 {
-	struct device *ctrl_dev, *child;
-	struct acpi_device *ctrl_adev;
+	struct device *child;
 	char name[32];
 	int i;
 
-	ctrl_adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
-	if (!ctrl_adev) {
-		pr_err("error could not get %s/%s serial-ctrl adev\n",
-		       serial_ctrl_hid, serial_ctrl_uid ?: "*");
-		return ERR_PTR(-ENODEV);
-	}
-
-	/* get_first_physical_node() returns a weak ref */
-	ctrl_dev = get_device(acpi_get_first_physical_node(ctrl_adev));
-	if (!ctrl_dev) {
-		pr_err("error could not get %s/%s serial-ctrl physical node\n",
-		       serial_ctrl_hid, serial_ctrl_uid ?: "*");
-		ctrl_dev = ERR_PTR(-ENODEV);
-		goto put_ctrl_adev;
-	}
-
 	/* Walk host -> uart-ctrl -> port -> serdev-ctrl */
 	for (i = 0; i < 3; i++) {
 		switch (i) {
@@ -67,14 +49,40 @@ get_serdev_controller(const char *serial_ctrl_hid,
 		put_device(ctrl_dev);
 		if (!child) {
 			pr_err("error could not find '%s' device\n", name);
-			ctrl_dev = ERR_PTR(-ENODEV);
-			goto put_ctrl_adev;
+			return ERR_PTR(-ENODEV);
 		}
 
 		ctrl_dev = child;
 	}
 
-put_ctrl_adev:
-	acpi_dev_put(ctrl_adev);
 	return ctrl_dev;
 }
+
+static inline struct device *
+get_serdev_controller(const char *serial_ctrl_hid,
+		      const char *serial_ctrl_uid,
+		      int serial_ctrl_port,
+		      const char *serdev_ctrl_name)
+{
+	struct acpi_device *adev;
+	struct device *parent;
+
+	adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
+	if (!adev) {
+		pr_err("error could not get %s/%s serial-ctrl adev\n",
+		       serial_ctrl_hid, serial_ctrl_uid ?: "*");
+		return ERR_PTR(-ENODEV);
+	}
+
+	/* get_first_physical_node() returns a weak ref */
+	parent = get_device(acpi_get_first_physical_node(adev));
+	acpi_dev_put(adev);
+	if (!parent) {
+		pr_err("error could not get %s/%s serial-ctrl physical node\n",
+		       serial_ctrl_hid, serial_ctrl_uid ?: "*");
+		return ERR_PTR(-ENODEV);
+	}
+
+	/* This puts our reference on parent and returns a ref on the ctrl */
+	return get_serdev_controller_from_parent(parent, serial_ctrl_port, serdev_ctrl_name);
+}
-- 
2.47.0

