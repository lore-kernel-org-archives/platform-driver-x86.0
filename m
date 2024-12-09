Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B424919D8A4
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 22:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733781937; cv=none; b=M543RpKtcI3d1NhVnSq0yrKUeNwukF+JpyBru8PcO/7N75K1ZLHbWZXZP5ND46RxtB83WEj5aVkQ2Xs2XYwLVCvr/mLbVfJLK/Oa1//oTwF/OzmHZ4913iVqqjJeruy7TcWhDxuBAMu2EARIC5x7l95DpDl89pMhw1Nu+2VapX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733781937; c=relaxed/simple;
	bh=76AOEka2W2co8esIXGOMv7O2DlXnHn8kCxhT66TTCls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqPfkTvpaQJ9o7Rgw+oFJsTN7g0jUX5NM0xGQfD9f4WM14sXK341eO8yijK5U9g42/RmDHvPtpLLCD1hjD4JBxA5hMCxa3HG8v9Ql3p1UHHVKQbP1V5mnWzeenDa3lQWWCs8ls6cDsqUAc4l0Fwjk4KNWAM20mxB06BE8yIbXyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFo6iTTH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFo6iTTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733781933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zpvK2U0MJ4Iq+VR//nM2mfOPpz5MARTjIJNCfXkuDcg=;
	b=IFo6iTTHXs+4VsfG11EqEOTU8xrUX5b45mNahTEb7VK1uYm0RpU2ap5wK2qu/y1C/7HiNJ
	CNyOaIEGFclaSm+uKb78mfaWbaFidGA0/Ql/BtC65BK+V+q3EotRbfS2ylmf+u4bhAEzPQ
	3O2TvsYa4OirBZNlmw2dqKa92WtABzo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-346-EDYm4BpgPSqGktZfW8ClmA-1; Mon,
 09 Dec 2024 17:05:31 -0500
X-MC-Unique: EDYm4BpgPSqGktZfW8ClmA-1
X-Mimecast-MFC-AGG-ID: EDYm4BpgPSqGktZfW8ClmA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0E6B1956089;
	Mon,  9 Dec 2024 22:05:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.3])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 48DE019560A2;
	Mon,  9 Dec 2024 22:05:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 4/4] platform/x86: int3472: Debug log the sensor name
Date: Mon,  9 Dec 2024 23:05:22 +0100
Message-ID: <20241209220522.25288-4-hdegoede@redhat.com>
In-Reply-To: <20241209220522.25288-1-hdegoede@redhat.com>
References: <20241209220522.25288-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Debug log the sensor name to make it easier to figure out which INT3472
device is associated with which sensor.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/common.c b/drivers/platform/x86/intel/int3472/common.c
index b3a2578e06c1..1638be8fa71e 100644
--- a/drivers/platform/x86/intel/int3472/common.c
+++ b/drivers/platform/x86/intel/int3472/common.c
@@ -70,6 +70,8 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 		return -ENODEV;
 	}
 
+	dev_dbg(dev, "Sensor name %s\n", acpi_dev_name(sensor));
+
 	*name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
 				   acpi_dev_name(sensor));
 	if (!*name_ret)
-- 
2.47.1

