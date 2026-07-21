Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D32343F08A
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 22:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674077; cv=none; b=OMg381ZtDDu1JcfrNq62Cfp4bo8TputWKFmDSBquiYoB4aiWfDyTsZbCghYhoSof9qZNt/GZcc5UixziP01LcMJzgwSQLa7cehA24aiVlsjO31xc80bxuUaAH5ZC7hjLxz6kkV2uiD1skaXnVAphLseXIJVI4qSD4zLyGl7jfWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674077; c=relaxed/simple;
	bh=d3APWpoq1xanSRcJjuu3Za3uqgeLVLcqxCBTjCcJlVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNDkhXHRjK6Qf4gl5CGes0cc194LUYJekyWmv0GlG8M/+3OmRi8gzK4ky2vPTEZPnjdiK5U0c9cs1GA+z3WUm2wUEej1b6cvmIYuNcIVDFjIrFjelG7q5s8QeIUlmmNRnoD++ppbZgQ2WDjmX9ZiYgrxtRgvvlx6ViUrpbT0apk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oINVMs3t; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oINVMs3t"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f75f7172so91948635e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 15:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674068; x=1785278868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aos89OSlbGT2u9yj2OFme9cCRcAFCWHGPYWArUSiEpI=;
        b=oINVMs3t+czsNIyUmWXy2VYqil6mil3b1vrcSRDSfWwz3aq0Mz93bv9x1CEXjmDXuF
         BoPiLmBsOKC7/tA/fetMqY8D5LpKefUSeZRmRnRmLyDxDX4fkI0RDgXAlRnFUxndwUWH
         KPOMRP4CGOECxjqUUZJQUGKuLdCQZKVMELLY1+N3uaxkd2Csq84Ug6F8KABn9Sqadqcc
         fCDnK4HHs9bs+9SdTkdyD5o+YzibbB2sI4PWxK2LlNkU0CpgU3DKSac7VyLqOi/ov9FT
         QCKjOwfdHl5kVB5puCl8GsErNo60TFSKw0vfvGUK5YEKlcNoSXlOGTIGFkJeRcqtfbyZ
         15Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674068; x=1785278868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aos89OSlbGT2u9yj2OFme9cCRcAFCWHGPYWArUSiEpI=;
        b=oORm5NklQdmtUif0nilsNn/wct7luzqnt9nnSRDkKBvc7WvQycLRvLK7O2pV2pcSD+
         AgT2/KhLId2VC+DWuPcpCfwxiy59st/W4uAP9OlJSJ7MUHRCrz/JhUpD8UVG8IPphGj7
         PuddZX76y5vdbFqdpOz4Kb6vw7R5eUT1bM//4mks//iK0NwF+zQ2fBSabwXog9XFAbdT
         dsw9PeVozqyJJuR8yTQ18ebEMP0dRjLgCLDStQOKFqw/XjgUaGe8xx+BJg1nKWfDG5hw
         a36fSiPmmTWuzowLFPRRUU75e2RHj8740FYNwcI7CJ6gxpfBwnk9TDt281X2bW82C1I/
         fuvA==
X-Gm-Message-State: AOJu0YxbC0wQDjJnSJ2uDbksfxebbCqvYx4Rw79sXq4+BcwJ1s6N5ot8
	E9YuMzhBl987KVdM1/3jr+8W3aa690X1iUG3T72iCWBkIHkjRNRgx+Rg
X-Gm-Gg: AR+sD13ZfmmddYOCz/+E0VcDGHNtWoaLlVdfKeUUUHz7v0h3c0JMwUHjqDQeU57SZlj
	Pm+metDsCVm+FnEYsMHvttDLm3d2+KlQhAj5IeKN4mt6zp01v34nguuB8ElMsNj2CZHlvsNEBWp
	TFQsDaKC5FC+I4+FJrXxsgzFTiIWAVpTx+wpf7ybxFTSUYaL936scM0qglj0FRQgD+lTkGTn/2I
	TI+g3FwJV3c6MX95mjgglDzEJxqKaqs6LuHZOSsMLrFjqfyOPI7XpYLGQHSNBiw6e9T901Ed6tL
	pGB2xCP9o8K8uOtKr0937+ZwNRDHT/qLxMjoZ1Dz3ZgAhbPo5R9bBEGyw7Y0AlH/Q6Hn21bwSeZ
	ZHvoGBhlA94Cx7gzZNScx6LvtR7gEHpZW1iXgXpOflFQoy81nbBH4BBg/4lA819R24brzHCbJCU
	xZrw==
X-Received: by 2002:a05:600c:4e94:b0:495:571e:e5d3 with SMTP id 5b1f17b1804b1-495571ee75fmr157362935e9.36.1784674068254;
        Tue, 21 Jul 2026 15:47:48 -0700 (PDT)
Received: from user ([154.176.96.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm212850f8f.31.2026.07.21.15.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:47:48 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v2 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
Date: Wed, 22 Jul 2026 01:47:38 +0300
Message-ID: <20260721224741.33624-2-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721224741.33624-1-yahia.a.abdrabou@gmail.com>
References: <20260721224741.33624-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

hp_wmi_perform_query() currently uses the deprecated
wmi_evaluate_method(), Which is depracted and replaced with the modern
wmidev_evaluate_method().

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
v1->v2:
-Fix a potential null derefernce highlighted by sashiko
-Fix a typo in the unregisteration process
---
 drivers/platform/x86/hp/hp-wmi.c | 51 ++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..5ac29361dc17 100644
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
@@ -587,6 +596,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	size_t bios_args_size;
 	int ret;
 
+	if (!hp_wmi_wdev)
+		return -ENODEV;
 	mid = encode_outsize_for_pvsz(outsize);
 	if (WARN_ON(mid < 0))
 		return mid;
@@ -606,7 +617,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	args->datasize = insize;
 	memcpy(args->data, buffer, flex_array_size(args, data, insize));
 
-	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+	ret = wmidev_evaluate_method(hp_wmi_wdev, 0, mid, &input, &output);
 	if (ret)
 		goto out_free;
 
@@ -2717,14 +2728,40 @@ static void __init setup_active_thermal_profile_params(void)
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
@@ -2733,7 +2770,7 @@ static int __init hp_wmi_init(void)
 	if (event_capable) {
 		err = hp_wmi_input_setup();
 		if (err)
-			return err;
+			goto err_unregister_wmi;
 	}
 
 	if (bios_capable) {
@@ -2771,7 +2808,8 @@ static int __init hp_wmi_init(void)
 err_destroy_input:
 	if (event_capable)
 		hp_wmi_input_destroy();
-
+err_unregister_wmi:
+	wmi_driver_unregister(&hp_wmi_wdev_driver);
 	return err;
 }
 module_init(hp_wmi_init);
@@ -2794,5 +2832,8 @@ static void __exit hp_wmi_exit(void)
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

