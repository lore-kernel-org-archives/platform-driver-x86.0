Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D61BCA0E
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808550; cv=none; b=AGcpAP2tVyJD4l5rJu4EkVae7boFunQrA9Vi7pCRyD7pHDJ4ZDpZV+ylpeMNmsHyKZFILOzr/FvHEjFOeudSVk7m4Kpv3w5QyM5qOREUtBk3N6ehNGnvwbo1YjunG5UrcKP7gYkzDVA+gcyuqRgdnuztRi6Fqx7HwhBtDbTF8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808550; c=relaxed/simple;
	bh=+B6Ca2370MIMWIgyY31aZ53DrtlGS3rHMkur1C3YVEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcftfXYoJ/fOBerk2TN2MTD/5XF9kaXAFijB9n1YBj2f4asTb8Sn9S+8UCchODTDUoktUKKReGl+zQbXEYLbjhN+VosyKMf0oLNg7atoqB9BTR3ZQ+jheGn/OXRbSH+SshcfzGOjky98653P9xbCNgxbLpvdSLX2XJN0FeJnYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VmHc4wWs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VmHc4wWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732808548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bLZv1/k6sDu5Vb/hLvpl/z2rTUjG3nOGcr1Qb+GvGbY=;
	b=VmHc4wWsXht2OxkNLcRdDHZ6BEUckfh6A6NxNstmZdWHo5nN9t2N1x66YUGOzmM4ThiqcE
	ZymuuDySTkDGa3DFLImp0t+qjKNtOaGLnYpc1NyEjSzugXOIiqsh+6qXM3HlsTvbC+WGCI
	29is6VvGHORHGqWMq4GEI4TXLFbuK5M=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-5X3zSXXbN-upLBsWkfvt5w-1; Thu,
 28 Nov 2024 10:42:24 -0500
X-MC-Unique: 5X3zSXXbN-upLBsWkfvt5w-1
X-Mimecast-MFC-AGG-ID: 5X3zSXXbN-upLBsWkfvt5w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA28A195608A;
	Thu, 28 Nov 2024 15:42:23 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA392195605A;
	Thu, 28 Nov 2024 15:42:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/4] platform/x86: int3472: Debug log the sensor name
Date: Thu, 28 Nov 2024 16:42:12 +0100
Message-ID: <20241128154212.6216-4-hdegoede@redhat.com>
In-Reply-To: <20241128154212.6216-1-hdegoede@redhat.com>
References: <20241128154212.6216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

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
2.47.0

