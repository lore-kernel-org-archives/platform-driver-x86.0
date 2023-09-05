Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BD5C83F3E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 19:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237892AbjIETRx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242530AbjIETRt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 15:17:49 -0400
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD20BD
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 12:17:21 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52bcb8b199aso4049367a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941078; x=1694545878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=pSIgWXxcqb9T6ucmZmrIqEneFVmFgfEh12dpe3QQvPw1pIPa7zl7A1m/lxZAyeGvU5
         u0Titcjv2VWatUYJglNPumVMvSMf+n2/Yr1SQT3A5+6liCNLpcp9dpiy/F3nq6e1nh4+
         XIkVMtnQRLJbAmtno50N3P1b6qrscDTRdzCNbUcnzZpXnQTfEMHPt/Gm1wTQMeac+OYz
         tuSY0jS1KOijkgCgj/eR0uHspsstr9ewgy3ARfSO2JPbqB9FTNboTnx8bLYGfnMBecrH
         oAUZVdeSuobGo4RmQKXxnsK3GHt29qA4dC32BcOhYFm+l6QjgjJuxTWh4hfiH+Fxg5Ys
         agiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941078; x=1694545878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=KlyRxwkJaaZUa7Pi6C3unr4xwrW7+UWMm1Xh++3fic2GtWfAkIeKdje4A01/tW228h
         KUvuDKZoyi0K0UZI8VOek4yJnruNEn57+Gg187YjUOokLoIARDT1USeHcTBFNbiKNInJ
         ICP55F/x3zwipYBU6zwXSUcZDJOZpXh1okgrLpt931G3cAoAkxB9SUHzXtJ0iF9pYAtO
         otq7F4kWSJdYiiPaVfrmM3AdEDp/aBgdp5UhR22n9ygpqt+Dl1Cos0EIg/D9c5rjOxH8
         2zL8SgRc/EvUuKB8PrgFZ1yggviDMc3GnviVSWy6vBAMfIy+msMyqNcF6lY6O/y9XWK+
         YQIQ==
X-Gm-Message-State: AOJu0YzqAjA1usCit61+v5BmshJwBCNlgeIm46eHRTYmAA42aiJqzsaL
        TwNaF9fpJMbXBR9bPal9AXgZ1vtLUr4PMEqWwRc=
X-Google-Smtp-Source: AGHT+IGj2EuAvHtXRXD8rdSvHdyQNmCzp7/4dD7j6aPqgw+n/kXSu9aLQQjPpRIFRE646UdFzsOLag==
X-Received: by 2002:adf:e0c5:0:b0:319:6b6c:dd01 with SMTP id m5-20020adfe0c5000000b003196b6cdd01mr477303wri.17.1693940014702;
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
Date:   Tue,  5 Sep 2023 20:52:55 +0200
Message-Id: <20230905185309.131295-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's start adding getters for the opaque struct gpio_device. Start with
a function allowing to retrieve the base GPIO number.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 13 +++++++++++++
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9637a79a9a60..9715bbc698e9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -233,6 +233,19 @@ struct gpio_device *gpiod_to_device(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_device);
 
+/**
+ * gpio_device_get_base() - Get the base GPIO number allocated by this device
+ * @gdev: GPIO device
+ *
+ * Returns:
+ * First GPIO number in the global GPIO numberspace for this device.
+ */
+int gpio_device_get_base(struct gpio_device *gdev)
+{
+	return gdev->base;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_base);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e3747e730ed1..b68b3493b29d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -780,6 +780,9 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
+/* struct gpio_device getters */
+int gpio_device_get_base(struct gpio_device *gdev);
+
 #else /* CONFIG_GPIOLIB */
 
 #include <linux/err.h>
-- 
2.39.2

