Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C818E743
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344977; cv=none; b=FDhTTONlv+pXM2BSkB432ELYt2O8tlXb0qnjPHM2N2uW/HZLLFn7wdb5hbr0VRcLr7h7voNB2eETmFOEvlGv9PlgDp28JtWtMaBeKuLV6UzbOAU8iviVnTq9/BpZE7rcVJEziDvIVCW7BeWQwDAao5SogKc7zLx5UTbjghvM1jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344977; c=relaxed/simple;
	bh=FEJliLvxIwVfoI9NS7707JM7tKYDRf0Sf4DwUYmCojI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBf+pnz9uyIP4KGzkQ8Dk3kBtAYGDvc25b11oA1RiSyM5QyqLE+OSrJ/gS9YZZ+sjaJAlimpPjN6cDT7RgrHkT8gPTJ70gKEkhikX2M27DsdWoh8cs/bvJjjb6e+Ujk12yBp6ztF0JJkLLQH5yM5w+QZwDjkRe4sVvQDWJalXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jj9U3f7Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jj9U3f7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIbEHUWt+eUkluYOJbUoCwTO7fB47d3KoGRzP7J3tPo=;
	b=Jj9U3f7QNT2SAWecudGZthGaGoUYfSGNyKyL4TGErjieBNVlUoR0aYhTkf6/xAd9OxyljT
	yFpism5qYVt6T92L8TelZTqCV0JAHvcJcFICWp6gn71LBd8hQ03Y1rfML7fBMcke/V9WYs
	wzzfSVCU2K+ojS9FmMlHPspj5GClpD4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-EXK5b9CSMnmfUJlApJ6hlA-1; Wed,
 04 Dec 2024 15:42:54 -0500
X-MC-Unique: EXK5b9CSMnmfUJlApJ6hlA-1
X-Mimecast-MFC-AGG-ID: EXK5b9CSMnmfUJlApJ6hlA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29575195608E;
	Wed,  4 Dec 2024 20:42:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C971D1956094;
	Wed,  4 Dec 2024 20:42:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 8/8] platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
Date: Wed,  4 Dec 2024 21:42:19 +0100
Message-ID: <20241204204227.95757-9-hdegoede@redhat.com>
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

The UART used for the Bluetooth HCI on the Vexia EDU ATLA 10 is enumerated
as a PCI device, but the ODBA7823 ACPI fwnode for the HCI expects it to
use the more standard ACPI enumeration mode.

So Bluetooth does not work out of the box. Add x86_serdev_info to make
the x86-android-tablets manually associate the fwnode with the UART.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/other.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 3032b6337804..172c9c5d3468 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -715,6 +715,14 @@ static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initcon
 	}
 };
 
+static const struct x86_serdev_info vexia_edu_atla10_serdevs[] __initconst = {
+	{
+		.ctrl.pci.devfn = PCI_DEVFN(0x1e, 3),
+		.ctrl_devname = "serial0",
+		.serdev_hid = "OBDA8723",
+	},
+};
+
 static struct gpiod_lookup_table vexia_edu_atla10_ft5416_gpios = {
 	.dev_id = "i2c-FTSC1000",
 	.table = {
@@ -755,6 +763,8 @@ static int __init vexia_edu_atla10_init(struct device *dev)
 const struct x86_dev_info vexia_edu_atla10_info __initconst = {
 	.i2c_client_info = vexia_edu_atla10_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_i2c_clients),
+	.serdev_info = vexia_edu_atla10_serdevs,
+	.serdev_count = ARRAY_SIZE(vexia_edu_atla10_serdevs),
 	.gpiod_lookup_tables = vexia_edu_atla10_gpios,
 	.init = vexia_edu_atla10_init,
 	.use_pci = true,
-- 
2.47.0

