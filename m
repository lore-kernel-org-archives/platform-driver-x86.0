Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A1FCA0FFF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 19:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjIETKf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbjIETKe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 15:10:34 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51F3E59
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 12:10:04 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99cce6f7de2so426094766b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 12:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940951; x=1694545751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8EoAIqFLJCxUpfLhsvBV4jgy9F1vQzmq/NZ2XWmhPM=;
        b=WM8k+JmQL5+e/1WgtJ+CjnGgMeIBqmzUZKFm3c7Bx0vZxxvmwH3uuXLE5kSwXH3MZ4
         6mFac7fs7ZVRJf32DpZ7G9gtIdgDscFD3q+/5Jf1NB2LiMDXYAfElH5sUbH/YVInoaiw
         suYA5SzfNpB2bwDJ8T46wCK2Ly8pRjNylECZJ4tZO8Tco8CA7cApfnN7TetDF9941PyO
         AAOA9sOEh7I6X2ha9ucc3hC8wSH/s1IyDCclT3JMFFXmp7/QT/wr0fXZdl1OmDqpz4Gk
         Uw8PA8sEQj/CZYQPrUqFUc22Xu38XkdSemG8UMyt1vL8hdd4jId5xFEUW8K9mqZA4+JG
         2Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940951; x=1694545751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8EoAIqFLJCxUpfLhsvBV4jgy9F1vQzmq/NZ2XWmhPM=;
        b=ZOASd+r9ZMuI5u8X33wYdgiooqBmobURejxPvpi6iQQzF2Gx+3vdjgbMx4RhGJGUFR
         mHhEdPIpW9wYkHZRaMpUbVLJ32tG0t362D1XPZkOG7R5pWwcVEGwcTlWlSVN52HmDc/7
         raT86B7gplhsp/Cw+27nES/X+otw1d7tsq5I0C3+J3sdCr91e1LGcd2ySOOH8KlUQBn1
         RBnFt4+zYAQQMWVQXlmqhmphI9jYrwVfH+vo8tCfD19+G0n6YOJMMFnz++mVmh9P0AW6
         xQyV5Tuki23+RXydks5Op1uK6pg5d26ahN34nC5dFJNblQBHDcI9uXy0QWdXlO9XXqKz
         wcBQ==
X-Gm-Message-State: AOJu0YzFPcy+FWAoAk58wne6ZPwew+9tktW+zx0ITDS9h8J9hq5k+Zys
        wy4a0pmGaOQFUpVENraXahi6fZcKZOT3+ENhBSo=
X-Google-Smtp-Source: AGHT+IGdmweLsvxMkviAD6X4Rb7LNMdeCjqz2Ypd3y+SG6ZL6d4+T9L7pYZxfgxQTgv+RGIUJmtJEw==
X-Received: by 2002:a05:600c:2809:b0:3fe:dcd0:2e10 with SMTP id m9-20020a05600c280900b003fedcd02e10mr472155wmb.17.1693940027944;
        Tue, 05 Sep 2023 11:53:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:47 -0700 (PDT)
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
Subject: [PATCH 18/21] gpio: acpi: replace gpiochip_find() with gpio_device_find()
Date:   Tue,  5 Sep 2023 20:53:06 +0200
Message-Id: <20230905185309.131295-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're porting all users of gpiochip_find() to using gpio_device_find().
Update the ACPI GPIO code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 5633e39396bc..15d3350123d9 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -143,7 +143,7 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
  */
 static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 {
-	struct gpio_chip *chip;
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
 	acpi_handle handle;
 	acpi_status status;
 
@@ -151,11 +151,11 @@ static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 	if (ACPI_FAILURE(status))
 		return ERR_PTR(-ENODEV);
 
-	chip = gpiochip_find(handle, acpi_gpiochip_find);
-	if (!chip)
+	gdev = gpio_device_find(handle, acpi_gpiochip_find);
+	if (!gdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	return gpiochip_get_desc(chip, pin);
+	return gpiochip_get_desc(gdev->chip, pin);
 }
 
 /**
-- 
2.39.2

