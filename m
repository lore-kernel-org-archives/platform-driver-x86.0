Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E526343E071
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 22:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672437; cv=none; b=G/HQCwJHHm+u9Mlr2UMVQ5ZESgbf5YSm0xNxi3j0ffmPmcU9Vy09Or4qeYONxBOgJZaXegNF6oQ9c9FuZWSWCL0q+HlGgGsiR90S8nckcVoAC3V9V20GPO8JySBCKvWn1pW/3yBDgWgxIXVrzjaG2NoOpamS/UT5ScQMz6Zc1LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672437; c=relaxed/simple;
	bh=z+ymKth5Pyn1k36c+pKwA3h+W1QslZ+rmOSezXOzE3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKnRdfss1BEAaYzLq45XyAmIVQuuBLYlfM1DgNjLe0ELvfocxjCuAaPqoaXZKXCcOqjWfSx0+OnCTFgRRGrabA2ybhEfMvLJawkhJJWYOc1LxnkmT+5cFq53rkGkZEXVowPkB3JgkQzzzmswobZqtn1c2uRjRMehIVFMr5dFigE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXrCu2qe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXrCu2qe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so45077135e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672434; x=1785277234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fS5st+dcVncpJO6zTQ7/3nql7wHW9s/mEVwg95RCqA8=;
        b=QXrCu2qesfLIInlTRm1KFLVdXwM2brJVenyFS5WJ0JeftP62LfQ9I0FBgD5cGtyCka
         xybzrkK4gcZaCTsPOsmXQIfk0Qtkp9Jx10HCb82B4o5J84HkyUNHPvQ17y29fooqn2MI
         wWfmkjP1mWPk7Sr9SGmJ5169iP9fwbBFpl7IMO9MEc9RwgqhF8xK8Mz5EDlX+9ryfatq
         PQ936pA0F3DMe/xlsQmD01M3nj/8Mu9tH5FKRAPtOJChebVxmfsXfyPzqO+O0HSPryvr
         f6SDHXw70i19fp+2hzocBpI3yllx68DXWn81SoxIv1d6Oal5sELXFmGd+1hLOamVOrj2
         FMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672434; x=1785277234;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fS5st+dcVncpJO6zTQ7/3nql7wHW9s/mEVwg95RCqA8=;
        b=flGjKMawqfbvFWsGdFk2oueo8cPsD5vyJ9RiCLtmel3mXulbITYCAwnBSgD4Go+7or
         FjuuGgwjEGtDuqthiP8p+Ay/Os+Ir50UZx9uOMl541O/wvcQhd8k2i7PYhMV6eDVgU8A
         PmmgdbaDxIu4ziTslFSyJmcCni3qOJShWjDfSb1BTexIFOW04bHLP48Kuo/Jzii2lIaj
         745k8rjWGYcx+odaVBFBcDSEkdPo+4QQP5LweAv6pzm1HsHpsdM77XiATil/G81oizpZ
         wXy3s8Zd/FIl/EnQZZVsQR0ffkAYo8neFQQnz57alGSxojYqq6bDaSDINtqbOEXWHkkA
         Jl+A==
X-Gm-Message-State: AOJu0Yy8t/GU15FIrUdQfmnn51zgKIMtXgk4+DIntdJ4M9vFCKONf5s3
	x1QoUfrH1ZAuY2maRPr3kHvRNqanq3b3W2ERIBDtr4IXbbFwdkiixKCRlGRslw==
X-Gm-Gg: AR+sD11vuc3YKb9a222pTQIOnkz5d4reVOulYdALu5ob8/2pFT28Wq22QxMu+XRsIGf
	5mcLNVvXUoadl4KUVOvMEcyiHtRq05+3hifdoEM78I4aEmEGPoeVJAccwwo5S2cf4ichGltJXGy
	hTNmTnRJxX7XhLSwtHXu972Hs3bPaYy+XxWSO4qHTxW4P5sJii4j0aoeSB6GVQ39+e7zHaMTGOp
	ocMlSu51eq3JUhUmqBsTseT17KwTwWR4ETkYz2yqbRID8EsDwTv3zoLeJ044t8YjUG++wnQQmkv
	IuzqmE3f0ySBz+hzOH09VYr11UT2NvzryZCBLYI6eSfPG0IHNVjuT4Z4UHQ/KVOUbT7MKZPe1jk
	5TSEfwv3pUjr/HczRachPGWj+Qlrjdn1vsNmrHj6KxSqtKYDNyYdQRIvd4sXWZqTGQgwd4TVNIF
	cExA==
X-Received: by 2002:a05:600c:154c:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4956a4f6532mr18040575e9.8.1784672433991;
        Tue, 21 Jul 2026 15:20:33 -0700 (PDT)
Received: from user ([154.176.96.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bffefsm89553165e9.9.2026.07.21.15.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:20:33 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
Date: Wed, 22 Jul 2026 01:20:19 +0300
Message-ID: <20260721222025.29917-2-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721222025.29917-1-yahia.a.abdrabou@gmail.com>
References: <20260721222025.29917-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

hp_wmi_perform_query() currently uses the deprecated GUID-based WMI
interface wmi_evaluate_method(). 

Migrate hp-wmi to the modern bus-based WMI API by registering a
struct wmi_driver and replacing wmi_evaluate_method() calls with
wmidev_evaluate_method().

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 49 ++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..5845b169df39 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -14,6 +14,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/wmi.h>
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/dmi.h>
@@ -506,6 +507,14 @@ struct hp_wmi_hwmon_priv {
 	struct delayed_work keep_alive_dwork;
 };
 
+struct wmi_device *hp_wmi_wdev;
+
+static const struct wmi_device_id hp_wmi_guid_table[] = {
+	{ .guid_string = HPWMI_BIOS_GUID },
+	{}
+};
+MODULE_DEVICE_TABLE(wmi, hp_wmi_guid_table);
+
 struct victus_s_fan_table_header {
 	u8 num_fans;
 	u8 unknown;
@@ -606,7 +615,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	args->datasize = insize;
 	memcpy(args->data, buffer, flex_array_size(args, data, insize));
 
-	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+	ret = wmidev_evaluate_method(hp_wmi_wdev, 0, mid, &input, &output);
 	if (ret)
 		goto out_free;
 
@@ -2717,14 +2726,40 @@ static void __init setup_active_thermal_profile_params(void)
 	}
 }
 
+static int hp_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	hp_wmi_wdev = wdev;
+	return 0;
+}
+
+static void hp_wmi_remove(struct wmi_device *wdev)
+{
+	hp_wmi_wdev = NULL;
+}
+
+static struct wmi_driver hp_wmi_wdev_driver = {
+	.driver = {
+		.name = "hp-wmi-wdev",
+	},
+	.id_table = hp_wmi_guid_table,
+	.probe = hp_wmi_probe,
+	.remove = hp_wmi_remove,
+};
+
+
 static int __init hp_wmi_init(void)
 {
 	int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
 	int bios_capable = wmi_has_guid(HPWMI_BIOS_GUID);
 	int err, tmp = 0;
+	err = wmi_driver_register(&hp_wmi_wdev_driver);
+	if (err)
+		return err;
 
-	if (!bios_capable && !event_capable)
-		return -ENODEV;
+	if (!bios_capable && !event_capable) {
+		err = -ENODEV;
+		goto err_unregister_wmi;
+	}
 
 	if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
 				 sizeof(tmp), sizeof(tmp)) == HPWMI_RET_INVALID_PARAMETERS)
@@ -2733,7 +2768,7 @@ static int __init hp_wmi_init(void)
 	if (event_capable) {
 		err = hp_wmi_input_setup();
 		if (err)
-			return err;
+			goto err_unregister_wmi;
 	}
 
 	if (bios_capable) {
@@ -2771,7 +2806,8 @@ static int __init hp_wmi_init(void)
 err_destroy_input:
 	if (event_capable)
 		hp_wmi_input_destroy();
-
+err_unregister_wmi:
+	wmi_driver_unregister(&hp_wmi_wmi_driver);
 	return err;
 }
 module_init(hp_wmi_init);
@@ -2794,5 +2830,8 @@ static void __exit hp_wmi_exit(void)
 		platform_device_unregister(hp_wmi_platform_dev);
 		platform_driver_unregister(&hp_wmi_driver);
 	}
+
+	if (hp_wmi_wdev)
+		wmi_driver_unregister(&hp_wmi_wdev_driver);
 }
 module_exit(hp_wmi_exit);
-- 
2.55.0

