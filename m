Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF410195B18
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529482; cv=none; b=ZsjPEnv2G9JvXOMBFfk5NIFMb8l9zcESoPQxqg3FBjEgYy1YWIIXgMt9Ue4gFGjQQqaXRCH3Vearvvrlw8ld0eVA6IgEEUPVtDGjxy9mG+K068DlitHAbzu4c5EK4pi2HRzDV97wWuyCZLNO2kxe8pmdGEFbBnCZHwkfiMixWBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529482; c=relaxed/simple;
	bh=m8ztMxv1Y5dp8hBaAgKpbaqoQ57GEe1lJLMmhH58fkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XOAdKFuF5rMzFCq1bpjoxfwB8PpuEsNkAhr031kTnZApntstFLFSNxnWcSRcfm0aGUh0HqU6LAlCFnkf1SDTTD14Rd9fxTD+azPR2aEOHNdMrTHAuYi5Ifgr+j7L5z5kxbjEccoNVNSYW3TQzW7mU065seO9Y7x5243fs6TVkT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tq3tZcP0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tq3tZcP0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3823f1ed492so2859550f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 02:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732529477; x=1733134277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=McR1GAXTozKsbyI8huiaN/MANI6sbWPvlD786hLQmKA=;
        b=tq3tZcP0DOM3s2ZFndXHPi0AFYCixeA+/loQhxKWPVL9u4PvuhgfAARlcF3oDPSnlY
         5V0Hi8HFh3iFyVbLg8e6K0RTztwugdc5QO9TtFudjErPMiDxWrYXk6I0ASSeCu2g+kzB
         Xc3+rRuH8XhzEK/fhTN6LdpjYQ9dMB541X5bIK05pqTqZUicTBwqMS51gQxaNWg4D15P
         qvbncZ0GPlNpWlMbVYOuW+iyuMk8tS36z3SoYKIS6J17LnxKr05fGQNpmnDBMwSdadan
         EEx6GrHWdfpCovZzCoJEL8SkylgRNcoFS5IG39NVh0LDd0EyqrWiuHGdX57txfpust9B
         rg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732529477; x=1733134277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McR1GAXTozKsbyI8huiaN/MANI6sbWPvlD786hLQmKA=;
        b=C6U6GeKTURI2mTixQNK+pfLkreMet0tgZeoBQOmhJzTFJ5v5930+eoSFCSIS0AAp+p
         Mo4OIY488esUZLH9dLg8orqm9xYLiOu8UkfJyjoGAbQptAUiUZ283qrqD+snluGtv8eS
         9D59Vb40/VOt+p7Te3feyLOGgu2jsDpUx6eDkZllug46SYR+c4jMHPxsE7g5ZZd/vsDs
         4bKlFnziuLMx4cV07VwLNG9S6o0/lpwMIysvwwMm1V6dnjMsI33a/749VseJHkqEBhyX
         k3N9ntO1YYWTDR3IN0HOj9nuoML3hOwysD1o2xIXwQbZ6H1QgXPMZvp+LmZUFL3dMBmr
         G8ug==
X-Gm-Message-State: AOJu0Yz+0eqtfFpsvoh1X+nccmxWeQHQemQfyamBxnZyY5ISktjU45Pa
	/nHpwRmIr+kby8nVtKiEyyn34fC9crjmugiN6w5pBLYjdGNjQ6+zCJk3cpZMfZhatj4KlaYOchz
	s
X-Gm-Gg: ASbGncumFMiF+Af/Pp/6tLIPX881N0pzoFUsd7BmhnjEIuIF9uJ3RAnHABOuZGaOULj
	Qak53ex5F+yMyzglcFruRj2qxWJANMdiNBcx1/0X69RjOzBM5PGmHk5/Y/nTxLmRKln5sskQ6uZ
	PSslbeDv5dfSL7/cevRIzpz8nXJjUztbzzQY+r+Ek7bIlElZ22yYdMm5ohbvBowG0SbH3zeMmUL
	mdR58s2znfNs0KJ5HCxy3IVQKqIuyWhwGq4tqAoTT+GqZJrGV4Gv5rUJ/BCtLsVkcvtvsNeMHrW
	SFDX8kPhyKd/hoiIreX8R4R6KxmXcHetGrl0yQ==
X-Google-Smtp-Source: AGHT+IFNaBoBipHcAKNRV9cEp7cydC/2YiIqPmq0r4TXisujrQAB5ptz8Zbl3oIamw/3a9U35yt9nQ==
X-Received: by 2002:a5d:5f4a:0:b0:381:edc5:b8a7 with SMTP id ffacd0b85a97d-38259c51ab8mr13672937f8f.0.1732529476904;
        Mon, 25 Nov 2024 02:11:16 -0800 (PST)
Received: from localhost (p200300f65f242d005bbc9b581c6b9666.dip0.t-ipconnect.de. [2003:f6:5f24:2d00:5bbc:9b58:1c6b:9666])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4348e272094sm77633175e9.7.2024.11.25.02.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 02:11:16 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/surface: Switch back to struct platform_driver::remove()
Date: Mon, 25 Nov 2024 11:11:06 +0100
Message-ID: <20241125101107.5677-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5577; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=m8ztMxv1Y5dp8hBaAgKpbaqoQ57GEe1lJLMmhH58fkI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnRE07YBHrjevxA0ANZUkOOCCxNpiDnOfyVEhqn RnaCN0zmuKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0RNOwAKCRCPgPtYfRL+ TmduB/4gasS76JFJv4ZqyOs99V1stugUz5Ne33t0teiMA/lTt8eRaWstop++64m1jre7pgSB5Gh YtK0KabcXsFQkcQsqxV19m1BbyZbUf6bwBd6aUzkYlM8pMgH8CHiE6usCoqm//hQvfoweFwrN8/ qXotziqfYYC4DCuFnvxtp4UddEePGm3hk4R0SjBMPSKKyUemv1IIo0LkAQc8YI+mFgtwFZ2UaF+ Ri/K98kr6qtA0dS9Ez8g46U+kNKSo4UdT1Qejn7br3BhFB/hv/3+kmAvpKxtxjly1KTgUzgGAM5 NmcPJfK5k1E08E0+VAqjj9qyG1G3o2pafZEJP4rL+jBak7u1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/platform/surface to use
.remove(), with the eventual goal to drop struct
platform_driver::remove_new(). As .remove() and .remove_new() have the
same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is based on todays next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

The change isn't urgent (as there are still quite a few users of
.remove_new()) and merge window material. Still it would be nice if you
scheduled it for v6.14-rc1.

Best regards
Uwe

 drivers/platform/surface/surface3-wmi.c                | 2 +-
 drivers/platform/surface/surface_acpi_notify.c         | 2 +-
 drivers/platform/surface/surface_aggregator_cdev.c     | 2 +-
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 drivers/platform/surface/surface_dtx.c                 | 2 +-
 drivers/platform/surface/surface_gpe.c                 | 2 +-
 drivers/platform/surface/surface_hotplug.c             | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/surface/surface3-wmi.c
index c15ed7a12784..6c8fb7a4dde4 100644
--- a/drivers/platform/surface/surface3-wmi.c
+++ b/drivers/platform/surface/surface3-wmi.c
@@ -247,7 +247,7 @@ static struct platform_driver s3_wmi_driver = {
 		.name = "surface3-wmi",
 		.pm = &s3_wmi_pm,
 	},
-	.remove_new = s3_wmi_remove,
+	.remove = s3_wmi_remove,
 };
 
 static int __init s3_wmi_init(void)
diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 14a9d8a267cb..3b30cfe3466b 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -850,7 +850,7 @@ MODULE_DEVICE_TABLE(acpi, san_match);
 
 static struct platform_driver surface_acpi_notify = {
 	.probe = san_probe,
-	.remove_new = san_remove,
+	.remove = san_remove,
 	.driver = {
 		.name = "surface_acpi_notify",
 		.acpi_match_table = san_match,
diff --git a/drivers/platform/surface/surface_aggregator_cdev.c b/drivers/platform/surface/surface_aggregator_cdev.c
index 165b1416230d..bfaa09d1648b 100644
--- a/drivers/platform/surface/surface_aggregator_cdev.c
+++ b/drivers/platform/surface/surface_aggregator_cdev.c
@@ -762,7 +762,7 @@ static struct platform_device *ssam_cdev_device;
 
 static struct platform_driver ssam_cdev_driver = {
 	.probe = ssam_dbg_device_probe,
-	.remove_new = ssam_dbg_device_remove,
+	.remove = ssam_dbg_device_remove,
 	.driver = {
 		.name = SSAM_CDEV_DEVICE_NAME,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 06e45f0b9817..d4f32ad66530 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -554,7 +554,7 @@ static void ssam_platform_hub_remove(struct platform_device *pdev)
 
 static struct platform_driver ssam_platform_hub_driver = {
 	.probe = ssam_platform_hub_probe,
-	.remove_new = ssam_platform_hub_remove,
+	.remove = ssam_platform_hub_remove,
 	.driver = {
 		.name = "surface_aggregator_platform_hub",
 		.acpi_match_table = ssam_platform_hub_acpi_match,
diff --git a/drivers/platform/surface/surface_dtx.c b/drivers/platform/surface/surface_dtx.c
index 89ca6b50e812..97ae010069e4 100644
--- a/drivers/platform/surface/surface_dtx.c
+++ b/drivers/platform/surface/surface_dtx.c
@@ -1180,7 +1180,7 @@ MODULE_DEVICE_TABLE(acpi, surface_dtx_acpi_match);
 
 static struct platform_driver surface_dtx_platform_driver = {
 	.probe = surface_dtx_platform_probe,
-	.remove_new = surface_dtx_platform_remove,
+	.remove = surface_dtx_platform_remove,
 	.driver = {
 		.name = "surface_dtx_pltf",
 		.acpi_match_table = surface_dtx_acpi_match,
diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index 62fd4004db31..b359413903b1 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -278,7 +278,7 @@ static void surface_gpe_remove(struct platform_device *pdev)
 
 static struct platform_driver surface_gpe_driver = {
 	.probe = surface_gpe_probe,
-	.remove_new = surface_gpe_remove,
+	.remove = surface_gpe_remove,
 	.driver = {
 		.name = "surface_gpe",
 		.pm = &surface_gpe_pm,
diff --git a/drivers/platform/surface/surface_hotplug.c b/drivers/platform/surface/surface_hotplug.c
index a404f26cfae8..c0d83ed5a208 100644
--- a/drivers/platform/surface/surface_hotplug.c
+++ b/drivers/platform/surface/surface_hotplug.c
@@ -259,7 +259,7 @@ MODULE_DEVICE_TABLE(acpi, surface_hotplug_acpi_match);
 
 static struct platform_driver surface_hotplug_driver = {
 	.probe = surface_hotplug_probe,
-	.remove_new = surface_hotplug_remove,
+	.remove = surface_hotplug_remove,
 	.driver = {
 		.name = "surface_hotplug",
 		.acpi_match_table = surface_hotplug_acpi_match,

base-commit: 85a2dd7d7c8152cb125712a1ecae1d0a6ccac250
-- 
2.45.2

