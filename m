Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A31C2323;
	Fri,  3 Jan 2025 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945520; cv=none; b=LA+BINOZHYsCanTrvQKIkXAJA7GGAbs3OjPjDvJBx2mSmTqAayfCGoSc1/phmsFp2hg3CfL6CZynDvahiZ58uz+iGDAsNyuA7gnm0sJulznfXRtSRcZJ/+P+qZSmMPPcEmMJzHiKZx82S96WvW7XBIMpi4QsEfYocwTetRota30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945520; c=relaxed/simple;
	bh=JQ7kRMXzxNmfVpw6i5f3Vnk2H901HuT/uZam75RPzGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UU2BTHafDrGYCxUDWoP7qH5yxc/q6GbBzwh7IzCQdsri7p7ATU5koCa79dVBKoHeBIWgPh2E5Dp0ko/Dij0cmHmzA+CDW6na3myfK6GpMKDcPoEy1K17Z5/l2ZQ2+4xm6Xd4tEyEDHtHpCmWYDqjo3P+PMXF5C4oPtGmqT5G/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nG9h5CO3; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nG9h5CO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735945514;
	bh=JQ7kRMXzxNmfVpw6i5f3Vnk2H901HuT/uZam75RPzGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nG9h5CO39Hm1438DnUtDRJirZQxiuJaTzrvEqXoTsavspO2E9Z6WPdhImFnbRzR4P
	 mP5hJcVj5tDAu4Vm5rkPXis0PqB/lqC1EQ1QS83luQKF6PVybmzDLGSq8n5OVhYs7O
	 3pOMc0bDrCU0dUO5s6+ek01bUtYKWHBfJkskPydk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Jan 2025 00:05:13 +0100
Subject: [PATCH 5/6] platform/x86: dell-sysman: Directly use
 firmware_attributes_class
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250104-firmware-attributes-simplify-v1-5-949f9709e405@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735945513; l=2211;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=JQ7kRMXzxNmfVpw6i5f3Vnk2H901HuT/uZam75RPzGw=;
 b=Z84qWVCveD2c/3XaX8A7d+/XmPPsnbrjJLL3Eb4MiP51p+quVTSq54ft9PT0ngivW8AY9Q937
 yWO9Kz5pcpHB1nbEcxHspkk1MMVN9bbYMl0VyaIT5KPP90Wr/Ojdg++
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The usage of the lifecycle functions is not necessary anymore.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 40ddc6eb75624e713dc4d2f7e92bc5f63fa4fde8..d00389b860e4ea0655c740c78bc3751f323b6370 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -25,7 +25,6 @@ struct wmi_sysman_priv wmi_priv = {
 /* reset bios to defaults */
 static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
 static int reset_option = -1;
-static const struct class *fw_attr_class;
 
 
 /**
@@ -541,15 +540,11 @@ static int __init sysman_init(void)
 		goto err_exit_bios_attr_pass_interface;
 	}
 
-	ret = fw_attributes_class_get(&fw_attr_class);
-	if (ret)
-		goto err_exit_bios_attr_pass_interface;
-
-	wmi_priv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
+	wmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
 				  NULL, "%s", DRIVER_NAME);
 	if (IS_ERR(wmi_priv.class_dev)) {
 		ret = PTR_ERR(wmi_priv.class_dev);
-		goto err_unregister_class;
+		goto err_exit_bios_attr_pass_interface;
 	}
 
 	wmi_priv.main_dir_kset = kset_create_and_add("attributes", NULL,
@@ -602,10 +597,7 @@ static int __init sysman_init(void)
 	release_attributes_data();
 
 err_destroy_classdev:
-	device_destroy(fw_attr_class, MKDEV(0, 0));
-
-err_unregister_class:
-	fw_attributes_class_put();
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
 
 err_exit_bios_attr_pass_interface:
 	exit_bios_attr_pass_interface();
@@ -619,8 +611,7 @@ static int __init sysman_init(void)
 static void __exit sysman_exit(void)
 {
 	release_attributes_data();
-	device_destroy(fw_attr_class, MKDEV(0, 0));
-	fw_attributes_class_put();
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
 	exit_bios_attr_set_interface();
 	exit_bios_attr_pass_interface();
 }

-- 
2.47.1

