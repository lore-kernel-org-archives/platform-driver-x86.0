Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50C3B0AF5
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088529; cv=none; b=C+KSYRuwf/qeMBSNSfNy+IeZfjYzmdg4Dm0KXwYepxJ5UrrHncSdBcjUhVm0O0yUpFQDckfsApo544JBA6lfLU5vfgXomXiLznRfO+K56OBMx4hW///AbML1qzTz0IsVopujwK50iVz17VHUTfHi2WiYNIElthCZNkfg/bSi1ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088529; c=relaxed/simple;
	bh=MQO8x/9MOX6++A5fjwf+xxdpq4I4ffEdPwkbG9Hw8N4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZCBddgLmJp4GZsKLvbbLPL9dnT1UvbdL2FLBK12H81QlVm3DwbztdJngHg5rs5TO85v7bgrWH1TORWccNdGEUYZsWaoOKSmotue9kxACIu3O6XE22xFmgxYTquuTvOqhLHAYSJ0+ZIQrmeZqisinZeXagpfLLdGbhDL1uyvPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fpu4M3hh; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fpu4M3hh"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8525efa7274so1981900b3a.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088523; x=1788693323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90ZV7hUH6itSWPk0ikuRv8290LbYPRrFs/jmu615PQA=;
        b=Fpu4M3hhSzbjp1U4SYB/r49HuQoPnt4DVWRx7gE2H4VysADRUqDyNXw3sCXZ+qt+nV
         5CSWa5XB3wg720Vp9wPq+K1yxMsbQ250Z/rVDuviExEBipBrQGFI5aLxT/prvstZrX04
         sOeERK4xCxNIzqyB6nQlf19fKL05bQAeR/BmMFVPSSJjlnmN2jBOZaH2BlTUntCQLHnU
         EiVGZ3AsJMZrdIl8xgRwsr6fEX/mo3fZ1QZa6qg5aYB8acA2LVzOglSY5DBULd2L4vQs
         EH3AO1HnNJQ1L5tclawIn30jGCBWf8Yhbu4VJgM+edo/UDe5dvAiek50ICoeYC+C0Vk1
         3UXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088523; x=1788693323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90ZV7hUH6itSWPk0ikuRv8290LbYPRrFs/jmu615PQA=;
        b=fIfq4Nwy6rryIboURtG0q/h387L4otYZr8TaQVm7vq5p+JpNf/Zrl6Il58/cMrmjhS
         CREpnBR7ntwW30EEPuU/xXfzqJBQBN4dIVEPMG6xLIwZh3orOob7mNuvjfI7gVWMC5Du
         04tUSmUF81cSvUtlu4uvwCZ7gsF1DkAuHEH8ILRr0NO/04PMNzbuIqNDhlRFhVh7vCgG
         Mm0P/WghxWjwTtPBKMiOVTs/r1b/Q17CQRroP4SzI/FifsA5PmQNKKR37SWHpk6OBNKN
         O47+3m30cjuQPfpLG6kBKL3K47x2bIa2nDMN15COBSizLN6Knz+9gbsCcJNhYcd7mBnM
         mNgw==
X-Gm-Message-State: AFuF++lekAhgqFBL8rC5Xz7lDScYo3pKK+NBI2MHgYblU+NEuVQEXw4S
	Wfx6kMW+SGmUhgxYcYVmQ20592GwIplIlTp0brLe6zNLgQhOB5b9lkZE
X-Gm-Gg: AR+sD129IJRPQzuzNBN7OtKx617FPAb4NzqiRP7d/oIrTdPRnr+Md1kgT5BJqGNCf6L
	v1BhNNMtV8mSOcFzXJ0slyc5HTbZmye7h7Mbsx9Ddcp3H0/UJGQBAI5Kk2Ypo2F1tiWfrKiRU3q
	SNZVzOGfxF1Urw80qYBX/gZndGcmvmesth/vZoiNU/tz0snoIsQFHTHZq6udf/NitSF/nyu1C/R
	xwW8noThcC8xslxhGLCvlYoDOwyHII810wgrWk94FLfEzXdJAf9GX2ZjJqcUjitG1JvMS8CS+3k
	1HRU02JZ3KTonQpRqxC3yDknU3DxFUZc5mi/6WqDldX592blQlvyJ4EBYpedWvpHZknkOmF2y4Q
	j/JLPEdVK8TsMy2tB+EGl0635JGZ8AATTzrqKdYk6RMM3bq+1fU4A2AAcjvpTrk+hC5+0faN74M
	ItrAgnarfzmJrn4IBOnqS9IUfS2NwqsX0zICgw2TtbnBmCuHAE95VzOCbnPGyhY8LtVRJpgX6gx
	ly7Df+utM55y1/biDKp5EKV3oMlS3y+SKQVYKBLUAkPE90yg28=
X-Received: by 2002:a05:6a21:2d4b:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3d266ebc17amr33097108637.1.1788088523602;
        Sun, 30 Aug 2026 04:15:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:22 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:08 -0700
Subject: [PATCH 4/6] platform/x86: x86-android-tablets: add Crystal Cove
 GPIO swnode support
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-4-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The crystalcove_gpiochip_node was created when gpiolib supported
matching a software node name against the GPIO chip label. Later,
gpiolib replaced name matching with firmware node identity mapping, and
support for dynamically attaching software nodes to ACPI GPIO chips as
secondary firmware nodes was added for Baytrail and Cherryview, but
Crystal Cove ("INT33FD:00") was omitted. Consequently, lookups on the
unattached Crystal Cove software node fail.

Add support for attaching crystalcove_gpiochip_node to the INT33FD:00
ACPI device as a secondary firmware node, and enable it on Lenovo Yoga
Tab 2 models.

Fixes: 611fd6cfe139 ("gpio: swnode: remove deprecated lookup mechanism")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/core.c         | 17 +++++++++++++++++
 drivers/platform/x86/x86-android-tablets/lenovo.c       |  6 ++----
 .../x86/x86-android-tablets/x86-android-tablets.h       |  2 ++
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 45673bfc0b7b..b028af1c9942 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -361,6 +361,15 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 	NULL
 };
 
+const struct software_node crystalcove_gpiochip_node = {
+	.name = "INT33FD:00",
+};
+
+static const struct software_node *crystalcove_gpiochip_node_group[] = {
+	&crystalcove_gpiochip_node,
+	NULL
+};
+
 static void gpio_secondary_unset(void *data)
 {
 	struct device *dev = data;
@@ -491,6 +500,14 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (dev_info->has_crystalcove) {
+		ret = gpio_secondary_fwnode_init(&pdev->dev, crystalcove_gpiochip_node_group);
+		if (ret) {
+			x86_android_tablet_remove(pdev);
+			return ret;
+		}
+	}
+
 	ret = software_node_register_node_group(dev_info->swnode_group);
 	if (ret) {
 		x86_android_tablet_remove(pdev);
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index c34f62bdf8f9..54068a0f4633 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -61,9 +61,6 @@ static struct lp855x_platform_data lenovo_lp8557_reg_only_pdata = {
 	.initial_brightness = 128,
 };
 
-static const struct software_node crystalcove_gpiochip_node = {
-	.name = "gpio_crystalcove",
-};
 
 /* Lenovo Yoga Book X90F / X90L's Android factory image has everything hardcoded */
 
@@ -431,7 +428,6 @@ static const struct software_node lenovo_yoga_tab2_830_1050_wm5102 = {
 };
 
 static const struct software_node *lenovo_yoga_tab2_830_1050_swnodes[] = {
-	&crystalcove_gpiochip_node,
 	&lenovo_yoga_tab2_830_1050_wm5102,
 	&generic_lipo_hv_4v35_battery_node,
 	NULL
@@ -454,6 +450,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
 	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
 	.modules = lenovo_yoga_tab2_modules,
+	.has_crystalcove = true,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_830_1050_init,
 	.exit = lenovo_yoga_tab2_830_1050_exit,
@@ -799,6 +796,7 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
 	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
 	.modules = lenovo_yoga_tab2_modules,
+	.has_crystalcove = true,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_1380_init,
 	.exit = lenovo_yoga_tab2_830_1050_exit,
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index c756961ae5fd..6e6534f8fa6c 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -96,6 +96,7 @@ struct x86_dev_info {
 	int (*init)(struct device *dev);
 	void (*exit)(void);
 	bool use_pci;
+	bool has_crystalcove;
 	enum x86_gpiochip_type gpiochip_type;
 };
 
@@ -107,6 +108,7 @@ int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data);
 /* Software nodes representing GPIO chips used by various tablets */
 extern const struct software_node baytrail_gpiochip_nodes[];
 extern const struct software_node cherryview_gpiochip_nodes[];
+extern const struct software_node crystalcove_gpiochip_node;
 
 /*
  * Extern declarations of x86_dev_info structs so there can be a single

-- 
2.55.0.897.gb25b4bd76c-goog

