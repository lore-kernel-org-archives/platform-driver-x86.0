Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7D6267B61
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294922; cv=none; b=CzxNwcZzPcba7SbOrc2mC70rUGt3UtaS/l4u16FAtQIF5mZSjp3X6uUgGKtILRCOyzy+9cjskAJ8yU469pc/XG6NaH08IMrlPhfGkKZaB7iAUUiD7tJmzEgSih8kiVnRRnu2MBbxTWi3qKq0e6C4Co5K0XbEch1C/HrqDAd1nuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294922; c=relaxed/simple;
	bh=aFYZ6uitcWrrRO3QpVWn0nNaiQ1LXsJLRLMMtNT53bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmDKwRLm6AjeUK/3id9ZvxpIfFfUg0lBv2wM1uvX3CJgUaxbg00oogaOMRNbYkTQpNUMiJHrOIFtA5R43xX02Z9Z9BScrSbWroHQvDlSMDkn2hSIXCsyx5GfqNA5fpb0KUbN9j0DLudBmyxlF6evPVTkB7Yj3bGg/ZShSn9wMtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y0kZ5zRr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y0kZ5zRr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43944c51e41so25394735e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294917; x=1739899717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9bx0I47Tn6bEo7jRo7TyxG1K/HAB+sHkf2wm2VOOzI=;
        b=y0kZ5zRrZbKjre6Af3KM9mVrGwD0XIhOE/W9GTa8GSTXn77L3dSbGLeTfyM06KDPT1
         UXPCOthHeq8KynXbxiYlghVazAHp67pmdBvye/PRCShRZheQIRJVeAQkJQ9VRhkScgN3
         iFF++vTdBI0t+UJQrmy9Ta7hpOO8mH0IJMrNIBWKNN5CoRHrs1KEeT9F0uwlgiph/v5o
         O3dX9hZs7k7o0sDnZBYsUM5RKUxMwwLjZ8RrHKNUnZeOqk3u/urPalIEOiPmv0q04O+2
         W9mhyasJpW7ga8p5nLHvzPkWteuKo4ilNVVcsZhichvFb4jGHyesIogAPtJ1pK39puRY
         mSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294917; x=1739899717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9bx0I47Tn6bEo7jRo7TyxG1K/HAB+sHkf2wm2VOOzI=;
        b=KczzbA/t76kVy0+UaVbNntH6KEXqu0EwC3T3npdGJ5+QQC0x6ivkb7vky62/V5ylTS
         u+tTVO4H9XlyxWzyo2MnHuHiSWQIT5LFdw2oQ+NSN/nRAgc20dzHoh3XSYRl2SUbpaCm
         2VAAFE2JCNRb+JdhA+mfefAytKM08nOnVk2MWuGmopx4a72tPFI+HU4IGtDRLzxDeLQp
         6UnT6H7/wUFWI70T8HHT5M0CP7CRbF+sUlVpCz49dvOdP7XhcY5ULD1+CaiDgUU4p0VL
         2ejyt9STRbDDFNU3IXWx9ChXiGFkWHTbWvCaRpvN/zsbrQHIgSVquuhBTcBcheZwg5FS
         IbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh8slPnaL8QUwEx+VJGmB6V+yUaciDgjpPb5LRnrGPPS/2v9joBVKIu9GIefz58BWfGSwcVeoJ5ki9ZDregZlfjSDw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Eiy+GzQjyL6N+2fur9jrQl1Ssuv/sbsYSZzskAFRteCCZDlZ
	JpdjHQnrgV7PKxQhDn8sPTTYNNpKfa6pXdFZ/q9mRHNrW/79b6WEToSHCwSmCsM=
X-Gm-Gg: ASbGncsDKvT4J7yp98/JuZSVFgrg3FfLj4Z2M+n7FlPJ2WB5YH+CMcEtqW62+7/4vxg
	3DZ/WxnqCu1JOhLm9CrHpBnFyoNrim72WVl3DK0MlikJqY3nxNj/+UBSw5YBAwSgautgA1WgZbX
	maWaKtzzMwtWAyOj5zoYWgbwb4k+NUYN3itiO0RJpjv2NWYvfusBfhzHZOBAmrZQlNwugWbpWGt
	IrhSLLxNdM4g/8M1ANDeztZHPo2d/3TyLYKR8dP/TxPxZ/JWeWPYTybNkOCJL1eDoTg3GIOdr79
	6Wq2TCGq4VxzjVyalw==
X-Google-Smtp-Source: AGHT+IFtn7cTk53CsXLOs0ym8l94Gy0ie7XH6W8nO4K/ObG+5/+lrQBGQ0HbQ/z1Qw6bfBt122n8Rw==
X-Received: by 2002:a5d:5887:0:b0:38d:e3a9:d655 with SMTP id ffacd0b85a97d-38de3a9d75bmr4402306f8f.15.1739294916823;
        Tue, 11 Feb 2025 09:28:36 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 5/7] clk: eyeq: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:02 +0100
Message-ID: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aFYZ6uitcWrrRO3QpVWn0nNaiQ1LXsJLRLMMtNT53bw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g5lkk3cqWgHMP3CCG4BuwFe5C2F3wDshnNy
 Adoe13MMYqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOQAKCRDm/A8cN/La
 hfxOD/9Ov3vQy2nAixWu6Lno5OjamDl9bupksGzUtMDHc3Xnbgp0ZK8iN2OFHVZlt0w267iS/4d
 7BXXIUjw9uPxlI6NadJ92+0lsfL6O0LWMo9OmvzB1/x5pZBA+YEREunOSpce9nC20sikciEBxTi
 rAxg8rwr8ZbHZQdXySHjwnBJQwZC/iPPASuRiiFLp/ifq/OFA4BnF7OEQskN0iU7hG3dGoppKWP
 bWpN0Ij+Lrk15oMjG8ab6kxJlyfgfETay2YsUbcEO0nXWQ+5USk4ckRfYMdt3al182sK+D3FrRE
 PFFDpVNKveSTOJEVtRnW1eESzOqeg2fE3VkPAei/faQ0lwxcbDbLcY0UxsCoCxGmYLHN6hhgC5U
 XuMNecOSpFOMeKJO6vJFQQ0A3eACqbzTC6C3syS5lCJmD50uYrnc9EgYrbePOD3pbuhz9xpuNys
 ZvepVJNwvwaxXq/ouY7OWTUNzROguqe6owYkGT5o8Bzx14gpbHkorKDg8Yv007gSfVQPEra2XqZ
 SQ/E9ifTm3uHKHiGZjfpCIQNSXD38akhhCAtt8XKGlSYC11IsLi73ZRanAiq5Exj4o8s3iA/rg0
 u6tC0ZB/l5f4rEl3yzKymgSCtpn/VsM2fgBmzvPeQsj9wqGXJ4L4L6xeTkVUpxcrmqImB9uxOse KsRdlOtx7sxXS6g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-eyeq.c | 57 +++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 640c25788487f8cf6fb4431ed6fb612cf099f114..37e76ad3fbe95ee2dea7df8f6b02d28f19f1d5ef 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -322,38 +322,18 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 	}
 }
 
-static void eqc_auxdev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int eqc_auxdev_create(struct device *dev, void __iomem *base,
-			     const char *name, u32 id)
+static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
+				       const char *name)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->dev.parent = dev;
-	adev->dev.platform_data = (void __force *)base;
-	adev->dev.release = eqc_auxdev_release;
-	adev->id = id;
 
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret)
-		auxiliary_device_uninit(adev);
-
-	return ret;
+	if (name) {
+		adev = devm_auxiliary_device_create(dev, name,
+						    (void __force *)base, 0);
+		if (IS_ERR(adev))
+			dev_warn(dev, "failed creating auxiliary device %s.%s: %ld\n",
+				 KBUILD_MODNAME, name, PTR_ERR(adev));
+	}
 }
 
 static int eqc_probe(struct platform_device *pdev)
@@ -365,7 +345,6 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -379,21 +358,9 @@ static int eqc_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	/* Init optional reset auxiliary device. */
-	if (data->reset_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
-	}
-
-	/* Init optional pinctrl auxiliary device. */
-	if (data->pinctrl_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
-	}
+	/* Init optional auxiliary devices. */
+	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */

-- 
2.45.2

