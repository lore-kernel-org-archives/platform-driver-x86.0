Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3939FE5
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Oct 2024 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729150699; cv=none; b=O1Qu5J9WnE5s65K6BLimwZ6U94SnfHq3Vmi+TODYitKk+56b8NtyJzeAJ8i3ka5Hlwzo9hvZnpLCuBQytat29s3CiYLIhWZPvZmyqoybvGe5hvEUFSzOhdfZOIWrmFpPt5Z/PvQW3ddXDzj46dQzeBQgQu6XlZpin8qHEKrGzi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729150699; c=relaxed/simple;
	bh=uC7PnZGu5D9LKGT6ynmBK292f6UCPB3Ii6w0PXaiBoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d/qj608X8FC2VGBBXtfScxCUCbenBCOwkJt3l+g49m06mGfAgvo6d4F0tQjrgdUFy0HoIuDJTHXoOaCfTE461lSdY1UqRYbr7Fe4u3a3YGMF08kdZvPuVuGeqo9z59b/VI89OzG5+Z9p9PR6qs8YcrxYhx9GuSZE3mMS52mLyY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xhvFik7W; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xhvFik7W"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43117ed8adbso8762315e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Oct 2024 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729150693; x=1729755493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UD044ITu0TAofB4l1CB2/BmDd3ryWDjUZkagv0oOf0c=;
        b=xhvFik7WdRpfcilM5LTFB/TkdPcXvVzUuqYidj29sWH1AYBVRSrPEd+QyMe30VkLi8
         Gz62YDKxOVKgAAoyKUCBR72rK5nXq/46lPTUIjeKCUN9XvWTrhKfHT5Ug6frgZuvCMpA
         jAeNbStlkp1fsH1z0HL9FDKhyABTIP6Y2y0IQj6WMPrOBNzpq5NHlSmxD3HL99YbY62u
         dZYLQNr1W9j6M3WhcKlgFnFjrFqw2nm17rmuR/eCxeg+zZCeNk9PwII1vl68jSvnhyXW
         g3khtI+RvJbWxr+8IATME4A/90t7r84dOhzhqCsem7v8LsUIy49aJLwWjcS9pZ6SwhLN
         lZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729150693; x=1729755493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD044ITu0TAofB4l1CB2/BmDd3ryWDjUZkagv0oOf0c=;
        b=FUzL7XorIPcNGSC8gved4p4mcHsn1Yxq9mHzM2kPgsIHWSKRYy7KxnMv1orGxQHx0c
         XHqcfjlvRNvaBSD3iHZM1Spo35RtJnpl5b47Hm1RwYc3LNO+tbq/i571jrNbqS0YrKac
         gZ9TvCLRh7YnECQELzZ4PC18s5vjbSJTwRCCJxvo6+vh+NdwFSgVifqHlkTjmYZ13DcL
         oOaNAdmbeGMMDimRJtLg6w+ArQyuOItIewRUvMsNrEVYyn/xVkVvNJEXXSlyNP2lMThv
         QuVR1bkr9US7/bRkw15o//YmZkz4aBcM3dlMUF4edTq9h1gtFH5uE9Aoj8fpgVoom46F
         ySkw==
X-Gm-Message-State: AOJu0Yz6FBpue3pjeUUB0rYmwF+nugAe50iDO8UmrKXQodKt3UgJrYM5
	BBJJkE0Yyd07o3ugNkPdKFbF5Dqp/s4RbTWO64qJU5UWAq1Y/VszM7cpscohV4IitKky8fHIdfT
	vXxo=
X-Google-Smtp-Source: AGHT+IEHiv0afBQaI8ZgQ+SE4i91UW6Ls2aYICpeOCgB7dlN5dLx34nWc4GQZpJ42MI+gX9d4gXhqg==
X-Received: by 2002:a05:600c:1d20:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-43125607be3mr196714675e9.26.1729150693369;
        Thu, 17 Oct 2024 00:38:13 -0700 (PDT)
Received: from localhost (p509151f9.dip0.t-ipconnect.de. [80.145.81.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43150455e30sm33141345e9.1.2024.10.17.00.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:38:12 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: Switch back to struct platform_driver::remove()
Date: Thu, 17 Oct 2024 09:38:03 +0200
Message-ID: <20241017073802.53235-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=26573; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=uC7PnZGu5D9LKGT6ynmBK292f6UCPB3Ii6w0PXaiBoY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnEL7aD+FP4E4jeynKiKHzy7aonQQmvZmye/asT ikqTYFGD+SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZxC+2gAKCRCPgPtYfRL+ Tv+CB/4i49Bkq/7pGtzEwFyuEoyICDVpjTPXWc7QG/855hC/nla46KWjlbuuI2dmbF5IyHTqCiK 0moLcjSokJEXYqnKlJ9PSLmv4wCCJLA9zortSuHKKabheD1Zo8lCEuUZKvP426wJnCXpcMky3Sz gLx/1c4uOdc420Gv4Vbbepjsee/v/HVEvEOMU0B5H2QyOo4xZPe/ZPcfJsdL0Vd7hZd2RwcsjWc Dx05Z0OwhaTbzmQHbLSjiQVEkInqI+tGP2/JOSUMOysqQfYCsXxQ+4LzD3ezEfLEqVb0EiZ94Oe 44UN54nRfu7PMomS1PWjmoTEhIwLIVq0J3ustLsS9LisRUVC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/platform/x86/ to use
.remove(), with the eventual goal to drop struct
platform_driver::remove_new(). As .remove() and .remove_new() have the
same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

While touching these files, make indention of the struct initializer
consistent in several files.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on yesterday's next. Feel free to drop changes that result in
a conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/platform/x86/acer-wmi.c                             | 2 +-
 drivers/platform/x86/adv_swbutton.c                         | 2 +-
 drivers/platform/x86/amd/hsmp.c                             | 2 +-
 drivers/platform/x86/amd/pmc/pmc.c                          | 2 +-
 drivers/platform/x86/amd/pmf/core.c                         | 2 +-
 drivers/platform/x86/amilo-rfkill.c                         | 6 +++---
 drivers/platform/x86/asus-wmi.c                             | 2 +-
 drivers/platform/x86/barco-p50-gpio.c                       | 2 +-
 drivers/platform/x86/compal-laptop.c                        | 4 ++--
 drivers/platform/x86/dell/dcdbas.c                          | 2 +-
 drivers/platform/x86/dell/dell-smo8800.c                    | 2 +-
 drivers/platform/x86/dell/dell-uart-backlight.c             | 2 +-
 drivers/platform/x86/hp/hp-wmi.c                            | 2 +-
 drivers/platform/x86/hp/hp_accel.c                          | 2 +-
 drivers/platform/x86/hp/tc1100-wmi.c                        | 2 +-
 drivers/platform/x86/huawei-wmi.c                           | 2 +-
 drivers/platform/x86/ideapad-laptop.c                       | 2 +-
 drivers/platform/x86/intel/bxtwc_tmu.c                      | 2 +-
 drivers/platform/x86/intel/bytcrc_pwrsrc.c                  | 2 +-
 drivers/platform/x86/intel/chtdc_ti_pwrbtn.c                | 2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c                  | 2 +-
 drivers/platform/x86/intel/hid.c                            | 2 +-
 drivers/platform/x86/intel/int0002_vgpio.c                  | 4 ++--
 drivers/platform/x86/intel/int1092/intel_sar.c              | 2 +-
 drivers/platform/x86/intel/int3472/discrete.c               | 2 +-
 drivers/platform/x86/intel/mrfld_pwrbtn.c                   | 2 +-
 drivers/platform/x86/intel/pmc/core.c                       | 2 +-
 drivers/platform/x86/intel/telemetry/pltdrv.c               | 2 +-
 drivers/platform/x86/intel/vbtn.c                           | 2 +-
 .../platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c    | 2 +-
 drivers/platform/x86/lenovo-yogabook.c                      | 2 +-
 drivers/platform/x86/mlx-platform.c                         | 2 +-
 drivers/platform/x86/samsung-q10.c                          | 2 +-
 drivers/platform/x86/sel3350-platform.c                     | 2 +-
 drivers/platform/x86/serial-multi-instantiate.c             | 2 +-
 drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c  | 2 +-
 drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c | 2 +-
 drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c      | 2 +-
 drivers/platform/x86/siemens/simatic-ipc-batt.c             | 2 +-
 drivers/platform/x86/wmi.c                                  | 2 +-
 drivers/platform/x86/x86-android-tablets/core.c             | 2 +-
 drivers/platform/x86/xo1-rfkill.c                           | 2 +-
 42 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 7169b84ccdb6..ba8accb2e47e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2641,7 +2641,7 @@ static struct platform_driver acer_platform_driver = {
 		.pm = &acer_pm,
 	},
 	.probe = acer_platform_probe,
-	.remove_new = acer_platform_remove,
+	.remove = acer_platform_remove,
 	.shutdown = acer_platform_shutdown,
 };
 
diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
index 6b23ba78e028..6fa60f3fc53c 100644
--- a/drivers/platform/x86/adv_swbutton.c
+++ b/drivers/platform/x86/adv_swbutton.c
@@ -110,7 +110,7 @@ static struct platform_driver adv_swbutton_driver = {
 		.acpi_match_table = button_device_ids,
 	},
 	.probe = adv_swbutton_probe,
-	.remove_new = adv_swbutton_remove,
+	.remove = adv_swbutton_remove,
 };
 module_platform_driver(adv_swbutton_driver);
 
diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 8fcf38eed7f0..fe8948729bba 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -883,7 +883,7 @@ static void hsmp_pltdrv_remove(struct platform_device *pdev)
 
 static struct platform_driver amd_hsmp_driver = {
 	.probe		= hsmp_pltdrv_probe,
-	.remove_new	= hsmp_pltdrv_remove,
+	.remove		= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.acpi_match_table = amd_hsmp_acpi_ids,
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index bbb8edb62e00..71abc6276e89 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -1156,7 +1156,7 @@ static struct platform_driver amd_pmc_driver = {
 		.pm = pm_sleep_ptr(&amd_pmc_pm),
 	},
 	.probe = amd_pmc_probe,
-	.remove_new = amd_pmc_remove,
+	.remove = amd_pmc_remove,
 };
 module_platform_driver(amd_pmc_driver);
 
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index d6af0ca036f1..47126abd13ca 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -496,7 +496,7 @@ static struct platform_driver amd_pmf_driver = {
 		.pm = pm_sleep_ptr(&amd_pmf_pm),
 	},
 	.probe = amd_pmf_probe,
-	.remove_new = amd_pmf_remove,
+	.remove = amd_pmf_remove,
 };
 module_platform_driver(amd_pmf_driver);
 
diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/amilo-rfkill.c
index 2423dc91debb..18397c527eab 100644
--- a/drivers/platform/x86/amilo-rfkill.c
+++ b/drivers/platform/x86/amilo-rfkill.c
@@ -132,10 +132,10 @@ static void amilo_rfkill_remove(struct platform_device *device)
 
 static struct platform_driver amilo_rfkill_driver = {
 	.driver = {
-		.name	= KBUILD_MODNAME,
+		.name = KBUILD_MODNAME,
 	},
-	.probe	= amilo_rfkill_probe,
-	.remove_new = amilo_rfkill_remove,
+	.probe = amilo_rfkill_probe,
+	.remove = amilo_rfkill_remove,
 };
 
 static int __init amilo_rfkill_init(void)
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7a48220b4f5a..2ccc23b259d3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5066,7 +5066,7 @@ int __init_or_module asus_wmi_register_driver(struct asus_wmi_driver *driver)
 		return -EBUSY;
 
 	platform_driver = &driver->platform_driver;
-	platform_driver->remove_new = asus_wmi_remove;
+	platform_driver->remove = asus_wmi_remove;
 	platform_driver->driver.owner = driver->owner;
 	platform_driver->driver.name = driver->name;
 	platform_driver->driver.pm = &asus_pm_ops;
diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index af566f712057..143d14548565 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -385,7 +385,7 @@ static struct platform_driver p50_gpio_driver = {
 		.name = DRIVER_NAME,
 	},
 	.probe = p50_gpio_probe,
-	.remove_new = p50_gpio_remove,
+	.remove = p50_gpio_remove,
 };
 
 /* Board setup */
diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 5546fb189491..4e1d44670bd1 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1023,8 +1023,8 @@ static struct platform_driver compal_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 	},
-	.probe	= compal_probe,
-	.remove_new = compal_remove,
+	.probe = compal_probe,
+	.remove = compal_remove,
 };
 
 static int __init compal_init(void)
diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index a60e35056387..c7dcb5d2dc77 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -709,7 +709,7 @@ static struct platform_driver dcdbas_driver = {
 		.name	= DRIVER_NAME,
 	},
 	.probe		= dcdbas_probe,
-	.remove_new	= dcdbas_remove,
+	.remove		= dcdbas_remove,
 };
 
 static const struct platform_device_info dcdbas_dev_info __initconst = {
diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index f7ec17c56833..87fe03f23f24 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -179,7 +179,7 @@ MODULE_DEVICE_TABLE(acpi, smo8800_ids);
 
 static struct platform_driver smo8800_driver = {
 	.probe = smo8800_probe,
-	.remove_new = smo8800_remove,
+	.remove = smo8800_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.acpi_match_table = smo8800_ids,
diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index 3995f90add45..6e5dc7e3674f 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -393,7 +393,7 @@ static void dell_uart_bl_pdev_remove(struct platform_device *pdev)
 
 static struct platform_driver dell_uart_bl_pdev_driver = {
 	.probe = dell_uart_bl_pdev_probe,
-	.remove_new = dell_uart_bl_pdev_remove,
+	.remove = dell_uart_bl_pdev_remove,
 	.driver = {
 		.name = "dell-uart-backlight",
 	},
diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8c05e0dd2a21..81ccc96ffe40 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1748,7 +1748,7 @@ static struct platform_driver hp_wmi_driver __refdata = {
 		.pm = &hp_wmi_pm_ops,
 		.dev_groups = hp_wmi_groups,
 	},
-	.remove_new = __exit_p(hp_wmi_bios_remove),
+	.remove = __exit_p(hp_wmi_bios_remove),
 };
 
 static umode_t hp_wmi_hwmon_is_visible(const void *data,
diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
index 52535576772a..39a6530f5072 100644
--- a/drivers/platform/x86/hp/hp_accel.c
+++ b/drivers/platform/x86/hp/hp_accel.c
@@ -372,7 +372,7 @@ static SIMPLE_DEV_PM_OPS(hp_accel_pm, lis3lv02d_suspend, lis3lv02d_resume);
 /* For the HP MDPS aka 3D Driveguard */
 static struct platform_driver lis3lv02d_driver = {
 	.probe	= lis3lv02d_probe,
-	.remove_new = lis3lv02d_remove,
+	.remove	= lis3lv02d_remove,
 	.driver	= {
 		.name	= "hp_accel",
 		.pm	= &hp_accel_pm,
diff --git a/drivers/platform/x86/hp/tc1100-wmi.c b/drivers/platform/x86/hp/tc1100-wmi.c
index 5298b0f6804f..146716d81442 100644
--- a/drivers/platform/x86/hp/tc1100-wmi.c
+++ b/drivers/platform/x86/hp/tc1100-wmi.c
@@ -221,7 +221,7 @@ static struct platform_driver tc1100_driver = {
 		.pm = &tc1100_pm_ops,
 #endif
 	},
-	.remove_new = tc1100_remove,
+	.remove = tc1100_remove,
 };
 
 static int __init tc1100_init(void)
diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index d81fd5df4a00..c3772df34679 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -842,7 +842,7 @@ static struct platform_driver huawei_wmi_driver = {
 		.name = "huawei-wmi",
 	},
 	.probe = huawei_wmi_probe,
-	.remove_new = huawei_wmi_remove,
+	.remove = huawei_wmi_remove,
 };
 
 static __init int huawei_wmi_init(void)
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index c64dfc56651d..9d8c3f064050 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -2306,7 +2306,7 @@ MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
 
 static struct platform_driver ideapad_acpi_driver = {
 	.probe = ideapad_acpi_add,
-	.remove_new = ideapad_acpi_remove,
+	.remove = ideapad_acpi_remove,
 	.driver = {
 		.name   = "ideapad_acpi",
 		.pm     = &ideapad_pm,
diff --git a/drivers/platform/x86/intel/bxtwc_tmu.c b/drivers/platform/x86/intel/bxtwc_tmu.c
index 9ac801b929b9..99437b2ccc25 100644
--- a/drivers/platform/x86/intel/bxtwc_tmu.c
+++ b/drivers/platform/x86/intel/bxtwc_tmu.c
@@ -121,7 +121,7 @@ MODULE_DEVICE_TABLE(platform, bxt_wcove_tmu_id_table);
 
 static struct platform_driver bxt_wcove_tmu_driver = {
 	.probe = bxt_wcove_tmu_probe,
-	.remove_new = bxt_wcove_tmu_remove,
+	.remove = bxt_wcove_tmu_remove,
 	.driver = {
 		.name = "bxt_wcove_tmu",
 		.pm     = &bxtwc_tmu_pm_ops,
diff --git a/drivers/platform/x86/intel/bytcrc_pwrsrc.c b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
index 418b71af27ff..3edc2a9dab38 100644
--- a/drivers/platform/x86/intel/bytcrc_pwrsrc.c
+++ b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
@@ -167,7 +167,7 @@ static void crc_pwrsrc_remove(struct platform_device *pdev)
 
 static struct platform_driver crc_pwrsrc_driver = {
 	.probe = crc_pwrsrc_probe,
-	.remove_new = crc_pwrsrc_remove,
+	.remove = crc_pwrsrc_remove,
 	.driver = {
 		.name = "crystal_cove_pwrsrc",
 	},
diff --git a/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c b/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
index 615f8d1a0c68..53f01e198047 100644
--- a/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
+++ b/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
@@ -84,7 +84,7 @@ static struct platform_driver chtdc_ti_pwrbtn_driver = {
 		.name	= KBUILD_MODNAME,
 	},
 	.probe		= chtdc_ti_pwrbtn_probe,
-	.remove_new	= chtdc_ti_pwrbtn_remove,
+	.remove		= chtdc_ti_pwrbtn_remove,
 	.id_table	= chtdc_ti_pwrbtn_id_table,
 };
 module_platform_driver(chtdc_ti_pwrbtn_driver);
diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platform/x86/intel/chtwc_int33fe.c
index 11503b1c85f3..29e8b5432f4c 100644
--- a/drivers/platform/x86/intel/chtwc_int33fe.c
+++ b/drivers/platform/x86/intel/chtwc_int33fe.c
@@ -427,7 +427,7 @@ static struct platform_driver cht_int33fe_typec_driver = {
 		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
 	},
 	.probe = cht_int33fe_typec_probe,
-	.remove_new = cht_int33fe_typec_remove,
+	.remove = cht_int33fe_typec_remove,
 };
 
 module_platform_driver(cht_int33fe_typec_driver);
diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 445e7a59beb4..97174834dc31 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -747,7 +747,7 @@ static struct platform_driver intel_hid_pl_driver = {
 		.pm = &intel_hid_pl_pm_ops,
 	},
 	.probe = intel_hid_probe,
-	.remove_new = intel_hid_remove,
+	.remove = intel_hid_remove,
 };
 
 /*
diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 527d8fbc7cc1..0cc80603a8a9 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -266,13 +266,13 @@ static const struct acpi_device_id int0002_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, int0002_acpi_ids);
 
 static struct platform_driver int0002_driver = {
-	.driver = {
+	.driver	= {
 		.name			= DRV_NAME,
 		.acpi_match_table	= int0002_acpi_ids,
 		.pm			= &int0002_pm_ops,
 	},
 	.probe	= int0002_probe,
-	.remove_new = int0002_remove,
+	.remove	= int0002_remove,
 };
 
 module_platform_driver(int0002_driver);
diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
index 6246c066ade2..e526841aff60 100644
--- a/drivers/platform/x86/intel/int1092/intel_sar.c
+++ b/drivers/platform/x86/intel/int1092/intel_sar.c
@@ -308,7 +308,7 @@ static void sar_remove(struct platform_device *device)
 
 static struct platform_driver sar_driver = {
 	.probe = sar_probe,
-	.remove_new = sar_remove,
+	.remove = sar_remove,
 	.driver = {
 		.name = DRVNAME,
 		.acpi_match_table = ACPI_PTR(sar_device_ids)
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 3de463c3d13b..d881b2cfcdfc 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -392,7 +392,7 @@ static struct platform_driver int3472_discrete = {
 		.acpi_match_table = int3472_device_id,
 	},
 	.probe = skl_int3472_discrete_probe,
-	.remove_new = skl_int3472_discrete_remove,
+	.remove = skl_int3472_discrete_remove,
 };
 module_platform_driver(int3472_discrete);
 
diff --git a/drivers/platform/x86/intel/mrfld_pwrbtn.c b/drivers/platform/x86/intel/mrfld_pwrbtn.c
index 549a3f586f3b..6c43f801c467 100644
--- a/drivers/platform/x86/intel/mrfld_pwrbtn.c
+++ b/drivers/platform/x86/intel/mrfld_pwrbtn.c
@@ -97,7 +97,7 @@ static struct platform_driver mrfld_pwrbtn_driver = {
 		.name	= "mrfld_bcove_pwrbtn",
 	},
 	.probe		= mrfld_pwrbtn_probe,
-	.remove_new	= mrfld_pwrbtn_remove,
+	.remove		= mrfld_pwrbtn_remove,
 	.id_table	= mrfld_pwrbtn_id_table,
 };
 module_platform_driver(mrfld_pwrbtn_driver);
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 0431a599ba26..4e20fd37226e 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1724,7 +1724,7 @@ static struct platform_driver pmc_core_driver = {
 		.dev_groups = pmc_dev_groups,
 	},
 	.probe = pmc_core_probe,
-	.remove_new = pmc_core_remove,
+	.remove = pmc_core_remove,
 };
 
 module_platform_driver(pmc_core_driver);
diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/platform/x86/intel/telemetry/pltdrv.c
index 767a0bc6c7ad..9a499efa1e4d 100644
--- a/drivers/platform/x86/intel/telemetry/pltdrv.c
+++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
@@ -1163,7 +1163,7 @@ static void telemetry_pltdrv_remove(struct platform_device *pdev)
 
 static struct platform_driver telemetry_soc_driver = {
 	.probe		= telemetry_pltdrv_probe,
-	.remove_new	= telemetry_pltdrv_remove,
+	.remove		= telemetry_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 	},
diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index a353e830b65f..232cd12e3c9f 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -387,7 +387,7 @@ static struct platform_driver intel_vbtn_pl_driver = {
 		.pm = &intel_vbtn_pm_ops,
 	},
 	.probe = intel_vbtn_probe,
-	.remove_new = intel_vbtn_remove,
+	.remove = intel_vbtn_remove,
 };
 
 static acpi_status __init
diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
index d525bdc8ca9b..d2699ca24f34 100644
--- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
@@ -298,7 +298,7 @@ static void yt2_1380_fc_pdev_remove(struct platform_device *pdev)
 
 static struct platform_driver yt2_1380_fc_pdev_driver = {
 	.probe = yt2_1380_fc_pdev_probe,
-	.remove_new = yt2_1380_fc_pdev_remove,
+	.remove = yt2_1380_fc_pdev_remove,
 	.driver = {
 		.name = YT2_1380_FC_PDEV_NAME,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/platform/x86/lenovo-yogabook.c b/drivers/platform/x86/lenovo-yogabook.c
index fd62bf746ebd..31b298dc5046 100644
--- a/drivers/platform/x86/lenovo-yogabook.c
+++ b/drivers/platform/x86/lenovo-yogabook.c
@@ -536,7 +536,7 @@ static void yogabook_pdev_remove(struct platform_device *pdev)
 
 static struct platform_driver yogabook_pdev_driver = {
 	.probe = yogabook_pdev_probe,
-	.remove_new = yogabook_pdev_remove,
+	.remove = yogabook_pdev_remove,
 	.driver = {
 		.name = YB_PDEV_NAME,
 		.pm = pm_sleep_ptr(&yogabook_pm_ops),
diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 9d70146fd742..671021cd1f59 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6633,7 +6633,7 @@ static struct platform_driver mlxplat_driver = {
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe		= mlxplat_probe,
-	.remove_new	= mlxplat_remove,
+	.remove		= mlxplat_remove,
 };
 
 static int __init mlxplat_init(void)
diff --git a/drivers/platform/x86/samsung-q10.c b/drivers/platform/x86/samsung-q10.c
index 134e2c3d91ca..8160d45f8a23 100644
--- a/drivers/platform/x86/samsung-q10.c
+++ b/drivers/platform/x86/samsung-q10.c
@@ -78,7 +78,7 @@ static struct platform_driver samsungq10_driver = {
 		.name	= KBUILD_MODNAME,
 	},
 	.probe		= samsungq10_probe,
-	.remove_new	= samsungq10_remove,
+	.remove		= samsungq10_remove,
 };
 
 static struct platform_device *samsungq10_device;
diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
index d09e976e7148..02e2081e2333 100644
--- a/drivers/platform/x86/sel3350-platform.c
+++ b/drivers/platform/x86/sel3350-platform.c
@@ -235,7 +235,7 @@ MODULE_DEVICE_TABLE(acpi, sel3350_device_ids);
 
 static struct platform_driver sel3350_platform_driver = {
 	.probe = sel3350_probe,
-	.remove_new = sel3350_remove,
+	.remove = sel3350_remove,
 	.driver = {
 		.name = "sel3350-platform",
 		.acpi_match_table = sel3350_device_ids,
diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 7c04cc9e5891..ed6b28505cd6 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -409,7 +409,7 @@ static struct platform_driver smi_driver = {
 		.acpi_match_table = smi_acpi_ids,
 	},
 	.probe = smi_probe,
-	.remove_new = smi_remove,
+	.remove = smi_remove,
 };
 module_platform_driver(smi_driver);
 
diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
index 5edc294de6e4..6ff6f3de492b 100644
--- a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
+++ b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
@@ -37,7 +37,7 @@ static int simatic_ipc_batt_apollolake_probe(struct platform_device *pdev)
 
 static struct platform_driver simatic_ipc_batt_driver = {
 	.probe = simatic_ipc_batt_apollolake_probe,
-	.remove_new = simatic_ipc_batt_apollolake_remove,
+	.remove = simatic_ipc_batt_apollolake_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
index e6a56d14b505..83f532498c8c 100644
--- a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
+++ b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
@@ -37,7 +37,7 @@ static int simatic_ipc_batt_elkhartlake_probe(struct platform_device *pdev)
 
 static struct platform_driver simatic_ipc_batt_driver = {
 	.probe = simatic_ipc_batt_elkhartlake_probe,
-	.remove_new = simatic_ipc_batt_elkhartlake_remove,
+	.remove = simatic_ipc_batt_elkhartlake_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
index f8849d0e48a8..c6a79338f1d0 100644
--- a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
+++ b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
@@ -73,7 +73,7 @@ static int simatic_ipc_batt_f7188x_probe(struct platform_device *pdev)
 
 static struct platform_driver simatic_ipc_batt_driver = {
 	.probe = simatic_ipc_batt_f7188x_probe,
-	.remove_new = simatic_ipc_batt_f7188x_remove,
+	.remove = simatic_ipc_batt_f7188x_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
index d9aff10608cf..7cfe991cba00 100644
--- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
+++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
@@ -239,7 +239,7 @@ static int simatic_ipc_batt_io_probe(struct platform_device *pdev)
 
 static struct platform_driver simatic_ipc_batt_driver = {
 	.probe = simatic_ipc_batt_io_probe,
-	.remove_new = simatic_ipc_batt_io_remove,
+	.remove = simatic_ipc_batt_io_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index a01223c23d10..2d6885c67ac0 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1328,7 +1328,7 @@ static struct platform_driver acpi_wmi_driver = {
 		.acpi_match_table = wmi_device_ids,
 	},
 	.probe = acpi_wmi_probe,
-	.remove_new = acpi_wmi_remove,
+	.remove = acpi_wmi_remove,
 };
 
 static int __init acpi_wmi_init(void)
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index ef572b90e06b..1e93112972da 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -458,7 +458,7 @@ static struct platform_driver x86_android_tablet_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
-	.remove_new = x86_android_tablet_remove,
+	.remove = x86_android_tablet_remove,
 };
 
 static int __init x86_android_tablet_init(void)
diff --git a/drivers/platform/x86/xo1-rfkill.c b/drivers/platform/x86/xo1-rfkill.c
index 5fe68296501c..5fedb99b9d94 100644
--- a/drivers/platform/x86/xo1-rfkill.c
+++ b/drivers/platform/x86/xo1-rfkill.c
@@ -68,7 +68,7 @@ static struct platform_driver xo1_rfkill_driver = {
 		.name = "xo1-rfkill",
 	},
 	.probe		= xo1_rfkill_probe,
-	.remove_new	= xo1_rfkill_remove,
+	.remove		= xo1_rfkill_remove,
 };
 
 module_platform_driver(xo1_rfkill_driver);

base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
-- 
2.45.2

