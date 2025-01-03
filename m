Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AAC1BEF99;
	Fri,  3 Jan 2025 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945520; cv=none; b=BfJRcBQ8FlGhXdtJo9qz79N6p5P09uOJoB9HwDvtkgD+sQrIbTj49vt+q7jV8/EQx+Dar1jU9KFBLHoiPZeDNKF2W8x7mpvrnC4QYIE1y8W9dkzeO9aSpiGKn/yOvAohPd/YnaaZvcmX4xcKmRwmGf41bNMNtahxMysIH9mC7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945520; c=relaxed/simple;
	bh=GuO0NT1ncu1pG9y3++xbJrVIn8xZ+9gpWgAO8XU1H5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZq+bo8LQmPRylWGMe+TeV7i0KgXXSrIzXgEg8cAIvpWBBr6s+9NcmuejEgq2WOIupKZH2qDY6Py8ynxFTqdAWDnk9LZAzLOjriPJJdJgG/A3UzqSp41zZhx6M5wVrYelQpJIi2CHsTb810sf9gly3VxY2W91qjCgktvNItJNc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=dGZHS1uy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="dGZHS1uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735945513;
	bh=GuO0NT1ncu1pG9y3++xbJrVIn8xZ+9gpWgAO8XU1H5g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dGZHS1uy2/SkVeXiAgHzNhc5u6tYWIdw8tT/4aZAuPBsLuKbhtKCjQiEvSxO4X2k8
	 Xmd7DFs0ZF5iXcEQG8/49fVQ8ja4SHmZ4mrbYQErfA8CFJ8qmsMX0Qg66UIZ81/RJp
	 ePpHuWDMajr5NK82Kg9Y/AvqUYWJ2XpQZEuVRumU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Jan 2025 00:05:12 +0100
Subject: [PATCH 4/6] platform/x86: hp-bioscfg: Directly use
 firmware_attributes_class
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250104-firmware-attributes-simplify-v1-4-949f9709e405@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735945513; l=1947;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GuO0NT1ncu1pG9y3++xbJrVIn8xZ+9gpWgAO8XU1H5g=;
 b=XW5xd5Jjy8GU3IJVZBlrzRfA0vP5auYjrcB0KajssKlXjVx5y1qNf73XzvX//ZVCaNWSHYmte
 3TcWQbhFraFCiV4hTJ2YxdSim5/5AACPjaUrBrpF50L8tp6wC6RmPUu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The usage of the lifecycle functions is not necessary anymore.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 2dc50152158a3dd0401d9d9e1de288c0d76ef937..0b277b7e37dd6b598e4fe5de6dc0ac47300a8e3b 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -24,8 +24,6 @@ struct bioscfg_priv bioscfg_drv = {
 	.mutex = __MUTEX_INITIALIZER(bioscfg_drv.mutex),
 };
 
-static const struct class *fw_attr_class;
-
 ssize_t display_name_language_code_show(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					char *buf)
@@ -972,11 +970,7 @@ static int __init hp_init(void)
 	if (ret)
 		return ret;
 
-	ret = fw_attributes_class_get(&fw_attr_class);
-	if (ret)
-		goto err_unregister_class;
-
-	bioscfg_drv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
+	bioscfg_drv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
 					      NULL, "%s", DRIVER_NAME);
 	if (IS_ERR(bioscfg_drv.class_dev)) {
 		ret = PTR_ERR(bioscfg_drv.class_dev);
@@ -1043,10 +1037,9 @@ static int __init hp_init(void)
 	release_attributes_data();
 
 err_destroy_classdev:
-	device_destroy(fw_attr_class, MKDEV(0, 0));
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
 
 err_unregister_class:
-	fw_attributes_class_put();
 	hp_exit_attr_set_interface();
 
 	return ret;
@@ -1055,9 +1048,8 @@ static int __init hp_init(void)
 static void __exit hp_exit(void)
 {
 	release_attributes_data();
-	device_destroy(fw_attr_class, MKDEV(0, 0));
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
 
-	fw_attributes_class_put();
 	hp_exit_attr_set_interface();
 }
 

-- 
2.47.1

