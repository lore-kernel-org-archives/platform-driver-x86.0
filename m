Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099214F6C
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Apr 2024 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712407999; cv=none; b=AAgqvmfjACyTMx4QIpAQiVKmvWQtw3O3Y+bW4CUYEo55nQ/xh6PAxEkByDNKSFVslf6LeeMiu3qq0sYvfhC4tidYJ03RITRIDmSupTexMSPikv+NOxcklRDHZ9rMNEZ1Sh4XNw/mkeO37qa1k3JwqU1e91wu+Fv2QuQDH6mQ+E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712407999; c=relaxed/simple;
	bh=H/qQG7SrPktsjIm49thxcLv953ucQRgbnnVUbmibHYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3Y4vHMk8jhymFXU6N7xtOQHqqJDpbPEWZPBWzZdyrb2mbdCpIxiy4jeaguakoeJewHIFQHXj+8H8cP3HoZ41P8Fbk8ifMbXbyE8H/sa3KGpGrehe11cPHGjb4gaoj+flZ8Y6Swok+OmbksMGHztvM5gcOCXWveLKHtiHZlTvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EVHpX0Cn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EVHpX0Cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712407996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xin2Owiv6z+7HUFf/cXptJfqGApHsrNGEQnJzoK0l9Y=;
	b=EVHpX0CnR2y42R9h1IoYzqs6z8JKrhirJBZitIje16wcyKHyRSzYndjM20pmNRyqmvM+LX
	9VBBDXFIl7yync/2H9Eii3yy8NsrhbkaTAswW986KGZXrs5Pzes2mgvHbRDtxz8aamtah4
	Zg9T+qGqLCsKSaSUPj1VycMfEXASaIU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-g3uM9fDaNxiWH78pVqpt4w-1; Sat,
 06 Apr 2024 08:53:11 -0400
X-MC-Unique: g3uM9fDaNxiWH78pVqpt4w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57AC729AC01B;
	Sat,  6 Apr 2024 12:53:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9A5C492BCD;
	Sat,  6 Apr 2024 12:53:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: x86-android-tablets: Unregister devices in reverse order
Date: Sat,  6 Apr 2024 14:50:56 +0200
Message-ID: <20240406125058.13624-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Not all subsystems support a device getting removed while there are
still consumers of the device with a reference to the device.

One example of this is the regulator subsystem. If a regulator gets
unregistered while there are still drivers holding a reference
a WARN() at drivers/regulator/core.c:5829 triggers, e.g.:

 WARNING: CPU: 1 PID: 1587 at drivers/regulator/core.c:5829 regulator_unregister
 Hardware name: Intel Corp. VALLEYVIEW C0 PLATFORM/BYT-T FFD8, BIOS BLADE_21.X64.0005.R00.1504101516 FFD8_X64_R_2015_04_10_1516 04/10/2015
 RIP: 0010:regulator_unregister
 Call Trace:
  <TASK>
  regulator_unregister
  devres_release_group
  i2c_device_remove
  device_release_driver_internal
  bus_remove_device
  device_del
  device_unregister
  x86_android_tablet_remove

On the Lenovo Yoga Tablet 2 series the bq24190 charger chip also provides
a 5V boost converter output for powering USB devices connected to the micro
USB port, the bq24190-charger driver exports this as a Vbus regulator.

On the 830 (8") and 1050 ("10") models this regulator is controlled by
a platform_device and x86_android_tablet_remove() removes platform_device-s
before i2c_clients so the consumer gets removed first.

But on the 1380 (13") model there is a lc824206xa micro-USB switch
connected over I2C and the extcon driver for that controls the regulator.
The bq24190 i2c-client *must* be registered first, because that creates
the regulator with the lc824206xa listed as its consumer. If the regulator
has not been registered yet the lc824206xa driver will end up getting
a dummy regulator.

Since in this case both the regulator provider and consumer are I2C
devices, the only way to ensure that the consumer is unregistered first
is to unregister the I2C devices in reverse order of in which they were
created.

For consistency and to avoid similar problems in the future change
x86_android_tablet_remove() to unregister all device types in reverse
order.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index a3415f1c0b5f..6559bb4ea730 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -278,25 +278,25 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 {
 	int i;
 
-	for (i = 0; i < serdev_count; i++) {
+	for (i = serdev_count - 1; i >= 0; i--) {
 		if (serdevs[i])
 			serdev_device_remove(serdevs[i]);
 	}
 
 	kfree(serdevs);
 
-	for (i = 0; i < pdev_count; i++)
+	for (i = pdev_count - 1; i >= 0; i--)
 		platform_device_unregister(pdevs[i]);
 
 	kfree(pdevs);
 	kfree(buttons);
 
-	for (i = 0; i < spi_dev_count; i++)
+	for (i = spi_dev_count - 1; i >= 0; i--)
 		spi_unregister_device(spi_devs[i]);
 
 	kfree(spi_devs);
 
-	for (i = 0; i < i2c_client_count; i++)
+	for (i = i2c_client_count - 1; i >= 0; i--)
 		i2c_unregister_device(i2c_clients[i]);
 
 	kfree(i2c_clients);
-- 
2.44.0

