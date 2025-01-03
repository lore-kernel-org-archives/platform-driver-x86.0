Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5A1C1F25;
	Fri,  3 Jan 2025 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945520; cv=none; b=h7oahFUhFwCQX6LPd0krhmHRd0HF+38+bPrdi6fbvNyo/RMwdeeE0u9rDM1SDkYWgohcrX4zGD1RPo0v9XDSOdW7LnIvnBD+9olf7z5nJ3mEd/oF5HC3wliETm52OzNs6i5xl/uXq07Dy1wXtHLTAqwq5mjQmASSFob0cxQzpx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945520; c=relaxed/simple;
	bh=h/7xxDMHCuHgQRO1fVetToEREOiCIlqUj4Ypa1zfWFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFQZeVdWVcB33pMoFmORYjdSldBzMR95ffA7c3Q8BX5bsEvxG4aaGShQ2sB9mgneZFpVXcqgnjD/hyJqibGBrwd2Db+IJJC+3fLWMjEprw5R9uclQMQ24oKbYbEbIe0a/raEHCrqm4stZCwzSW9RxXKg5Sg6MjBgIn9muDXTAAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=p2UlfER/; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="p2UlfER/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735945513;
	bh=h/7xxDMHCuHgQRO1fVetToEREOiCIlqUj4Ypa1zfWFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p2UlfER/g9QxyczO9XH5crGFBhuM31PodSossURTo7mcAAnCwpd9d76NzSbs3xfHc
	 ZOzk7ncuRG2d387m4LYzyA0aTXGorHmTmUFbixSsX3Ke30voadjpC9C/XTuwCAnDM7
	 +HvtLyNaawD/hPg2uDTSIeqJUgWHPxXFflLYPWpo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Jan 2025 00:05:10 +0100
Subject: [PATCH 2/6] platform/x86: firmware_attributes_class: Simplify API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250104-firmware-attributes-simplify-v1-2-949f9709e405@weissschuh.net>
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
In-Reply-To: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735945513; l=3277;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=h/7xxDMHCuHgQRO1fVetToEREOiCIlqUj4Ypa1zfWFc=;
 b=qvZ9Cf05LaRkooqj+2iTwvqEowZaXfrVuv690CFopE/BSQ4kJYhyOVdyN8vbLtdrYv5Tdnx5E
 Peb6eqT1s1BCRMxrtRYPJafRMKPHFixBwIh8XI3XpvACRGOujRINtn8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The module core already guarantees that a module can only be unloaded
after all other modules using its symbols have been unloaded.
As it's already the responsibility of the drivers using
firmware_attributes_class to clean up their devices before unloading,
the lifetime of the firmware_attributes_class can be bound to the
lifetime of the module.
This enables the direct usage of firmware_attributes_class from the
drivers, without having to go through the lifecycle functions,
leading to simplifications for both the subsystem and its users.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/firmware_attributes_class.c | 40 +++++++++---------------
 drivers/platform/x86/firmware_attributes_class.h |  1 +
 2 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index cbc56e5db59283ba99ac0b915ac5fb2432afbdc9..87672c49e86ae3ef5b99aa99be532c1d84805adc 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -2,47 +2,35 @@
 
 /* Firmware attributes class helper module */
 
-#include <linux/mutex.h>
 #include <linux/module.h>
 #include "firmware_attributes_class.h"
 
-static DEFINE_MUTEX(fw_attr_lock);
-static int fw_attr_inuse;
-
-static const struct class firmware_attributes_class = {
+const struct class firmware_attributes_class = {
 	.name = "firmware-attributes",
 };
+EXPORT_SYMBOL_GPL(firmware_attributes_class);
+
+static __init int fw_attributes_class_init(void)
+{
+	return class_register(&firmware_attributes_class);
+}
+module_init(fw_attributes_class_init);
+
+static __exit void fw_attributes_class_exit(void)
+{
+	class_unregister(&firmware_attributes_class);
+}
+module_exit(fw_attributes_class_exit);
 
 int fw_attributes_class_get(const struct class **fw_attr_class)
 {
-	int err;
-
-	mutex_lock(&fw_attr_lock);
-	if (!fw_attr_inuse) { /*first time class is being used*/
-		err = class_register(&firmware_attributes_class);
-		if (err) {
-			mutex_unlock(&fw_attr_lock);
-			return err;
-		}
-	}
-	fw_attr_inuse++;
 	*fw_attr_class = &firmware_attributes_class;
-	mutex_unlock(&fw_attr_lock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fw_attributes_class_get);
 
 int fw_attributes_class_put(void)
 {
-	mutex_lock(&fw_attr_lock);
-	if (!fw_attr_inuse) {
-		mutex_unlock(&fw_attr_lock);
-		return -EINVAL;
-	}
-	fw_attr_inuse--;
-	if (!fw_attr_inuse) /* No more consumers */
-		class_unregister(&firmware_attributes_class);
-	mutex_unlock(&fw_attr_lock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fw_attributes_class_put);
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index 8e0f47cfdf92eb4dc8722b7d8371916af0d84efa..ef6c3764a83497ad7e75b0102154c92ce476e5ae 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -7,6 +7,7 @@
 
 #include <linux/device/class.h>
 
+extern const struct class firmware_attributes_class;
 int fw_attributes_class_get(const struct class **fw_attr_class);
 int fw_attributes_class_put(void);
 

-- 
2.47.1

