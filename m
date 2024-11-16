Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93FB18027
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771354; cv=none; b=p711Ny6ryCf8kBDe4kaJn/KUxVyty/11FRHmpgnTwumZ63MCAW6BGMwOLRpgdX3EF9HaB3Pf7yTOjws7pkJtwdaJDQeyIsJ140uVObFtbkUrvO8tzS6mn1Ytd/3roWZgWx36BzpZ2ZtSeDomQJryZznbAvyYq+5PMftSprpicAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771354; c=relaxed/simple;
	bh=8Qj4qi0mCaw3+6Nx1ukechnn01QToirMroOamV2PO94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLD+SABqyvQag4S43DhIHcBGqZ/3h1iNKnHcFgLFgd0NNLDVc36C31T+5sCVTkGV6hH0EFAWBEXgRuJGRuE94QMWZIEhlFBSx7Y5Z5L7BaxNTWRn8SdSkHyArcUO49Dst7cLyVXOdkOohMX3dh4WHCi/yApHOvxOkFVmy387onk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdutbQW5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdutbQW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731771351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQ58Ce57yV0vw+ff5Zr9IcVQLs3D21S9WdV1DuqSQMU=;
	b=CdutbQW5CEloLs+ar6YkwFUEfcDjUp235SdCgmklImJ0m19gV0UKNE04ouSkrVwu5Jlted
	Xba9LXSpFCMhVALhYdM8b3nl+Lo1MR6ztPj1HqKgHkKwXpTVlJlTluPeZ6J6AFeirwf7uQ
	H+fW1aecaQqdln07iJiWYTMNlTWPhrQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-sFucS3C3MW-CvEa8MdMacA-1; Sat,
 16 Nov 2024 10:35:47 -0500
X-MC-Unique: sFucS3C3MW-CvEa8MdMacA-1
X-Mimecast-MFC-AGG-ID: sFucS3C3MW-CvEa8MdMacA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADA09195609E;
	Sat, 16 Nov 2024 15:35:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5516D1956054;
	Sat, 16 Nov 2024 15:35:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 6/6] platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
Date: Sat, 16 Nov 2024 16:35:33 +0100
Message-ID: <20241116153533.84722-7-hdegoede@redhat.com>
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
index f5140d5ce61a..2157dd8c9aad 100644
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

