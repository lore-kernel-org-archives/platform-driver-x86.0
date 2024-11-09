Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EACF1A0B12
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Nov 2024 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189957; cv=none; b=EzhW1jTBL1nskZtr5CDUvmB39kL8YMyers+RUVHvi7RoxhlLLGPYOXvtQGM3k2kKkOLxUGjJWF5tJpGc97lJLJdM8t+9WlCpLI+C3T2zRuv2T9Hxekrm/E821PT68ea3u1Svx0/RJg5I1PjgOMZMLJ5N6iJothL5CJ+IZAeTbKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189957; c=relaxed/simple;
	bh=wGjay0XXEHMMg1cHLWXT5TvMZj/O02jEoYIhxtlw5GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+fE/QngqoigpZvlU4OnkB41K/CnpLb8nkdMYC9AV+6jsqV+31qodvVrHd5A6oRvxLtYod8qh3OypsorSbfcABETS/QCvfpInhN9Ub9Z00QIMaFs9/S8/BxOYsFY7/Lp9EYaAcbCtIP7jOKcrmyB5Xm1ZIVfdmdAfxnmEiV4jd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ol/nAw+x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ol/nAw+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731189954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eLsIBzB1nVrQ3HFXQrE9g9jpr/O8NrZg9Omehom/Mqo=;
	b=Ol/nAw+xAfyJOW7EarwAvUV7us7dWidhr2RWdTgmXQ3zhp1ZYYnmTtZi2Hm1s2QF+qGvgJ
	m0lE/gIOAaWN2+SyLCV2E53dNZf050mqogQ4qnlI97TrGuvShe+79sxUZoykWw3lakrQLE
	He+tPqU4/ozr9dDc+hjuNVpKzGrQCRE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-ja_hyaE4PeecTY9yfMXw1w-1; Sat,
 09 Nov 2024 17:05:51 -0500
X-MC-Unique: ja_hyaE4PeecTY9yfMXw1w-1
X-Mimecast-MFC-AGG-ID: ja_hyaE4PeecTY9yfMXw1w
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4DE8E1955EE9;
	Sat,  9 Nov 2024 22:05:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.21])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2C801956056;
	Sat,  9 Nov 2024 22:05:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
Date: Sat,  9 Nov 2024 23:05:30 +0100
Message-ID: <20241109220530.83394-6-hdegoede@redhat.com>
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

The UART used for the Bluetooth HCI on the Vexia EDU ATLA 10 is enumerated
as a PCI device, but the ODBA7823 ACPI fwnode for the HCI expects it to
use the more standard ACPI enumeration mode.

So Bluetooth does not work out of the box. Add x86_serdev_info to make
the x86-android-tablets manually associate the fwnode with the UART.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/other.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index f5140d5ce61a..9b8353dec7b6 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -715,6 +715,14 @@ static const struct x86_i2c_client_info vexia_edu_atla10_i2c_clients[] __initcon
 	}
 };
 
+static const struct x86_serdev_info vexia_edu_atla10_serdevs[] __initconst = {
+	{
+		.ctrl_devfn = PCI_DEVFN(0x1e, 3),
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

