Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204D2C83F3E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 19:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239704AbjIETLd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbjIETLc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 15:11:32 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884E783
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 12:11:01 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ffa248263cso4512205e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941005; x=1694545805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqkLr0JyIMxB5faQNNXnf+zRj68nvo49fQs7ZKVuUBo=;
        b=BraFMW3n0SWBv6qLeaIEoqpgkGq7u+L7mUF8KrjHhKg4vbBnX+j+UPdoV4ZzXrLzJO
         dl5IAemhyeoTJLmLDUmohCfH67ZRVtxJMaiqEkGm8sSx8yw/G3suv18TJiCxg7WNsKkb
         wEUkNJ09ie/NTrTdA2Xcw/OMXeMZB/exEUXamaPL6/7FDIfxkUCp6O/d6SR6eGRrnQTi
         inLqyl9v1oRtXf9KMl2jX4rr+jBNSR1A8vLTvnD9OzfFaQujtoZ0QF0SiyV0piPblg1/
         /h4OoFBVBn5xF+XZRIQSrIT06jTLChboc8f5FIBpsGIdv2A6aVZ2oDx+/Y8wzRm8Mber
         XvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941005; x=1694545805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqkLr0JyIMxB5faQNNXnf+zRj68nvo49fQs7ZKVuUBo=;
        b=bY3kwr7bjRqZw7b1eiM4Cm7T3ObBd5htxyoW5HPJxmCyNnQf/zLWTkmZYd1x2HOSwd
         DtugbnR3hiEoxIs7ZLvzz5cmlr2XJpd2krLD4lm9ekkgYVu4Ka+Dz3WoE4ygrasrNQ2N
         5dBNWecCW06Zvr2ZlL/oz5x2Wbzn1IFIFuQV7u7+K/d4cO0OW/a7A6YpFxmozp1X/OjW
         /9+lONmOQ68JXvSDacnMmNtuWUa5C9g0y1eUka2Qs/vBn4Xn2FJRSv8iaK//fVjTAlS/
         OWm8aqQHg74t8UKNwQTj+gnbdSyhpNXXii++T+eFGGNbIT0Z9RhvxOLRPrgbNeCFknkJ
         owPg==
X-Gm-Message-State: AOJu0YzzpptFskN9l34Ys6u7nFWjKa/hzetByJYFxlXEFLx7aohIGliW
        cnTSD3VmUO4HJP7qFRml0u2kiAc95c+xEUQQtfY=
X-Google-Smtp-Source: AGHT+IG3KG15PaiG7DgNG5yZVi1RIG05HTUsTSLH76kG9iwAZEGSHThfSg45jv+oBWQBQS0UnnvYaw==
X-Received: by 2002:a05:600c:2256:b0:3fe:1af6:6542 with SMTP id a22-20020a05600c225600b003fe1af66542mr449099wmm.33.1693940009775;
        Tue, 05 Sep 2023 11:53:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:29 -0700 (PDT)
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
Subject: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
Date:   Tue,  5 Sep 2023 20:52:51 +0200
Message-Id: <20230905185309.131295-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

By far the most common way of looking up GPIO devices is using their
label. Provide a helpers for that to avoid every user implementing their
own matching function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9e083ecb8df0..74b837671d30 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -20,6 +20,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -1074,6 +1075,26 @@ struct gpio_device *gpio_device_find(void *data,
 }
 EXPORT_SYMBOL_GPL(gpio_device_find);
 
+static int gpio_chip_match_by_label(struct gpio_chip *gc, void *label)
+{
+	return gc->label && !strcmp(gc->label, label);
+}
+
+/**
+ * gpio_device_find_by_label() - wrapper around gpio_device_find() finding the
+ *                               GPIO device by its backing chip's label
+ * @label: Label to lookup
+ *
+ * Returns:
+ * Reference to the GPIO device or NULL. Reference must be released with
+ * ``gpio_device_put``.
+ */
+struct gpio_device *gpio_device_find_by_label(const char *label)
+{
+	return gpio_device_find((void *)label, gpio_chip_match_by_label);
+}
+EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
+
 static int gpiochip_match_name(struct gpio_chip *gc, void *data)
 {
 	const char *name = data;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5c5029cec226..92f7143bad3e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -609,6 +609,7 @@ struct gpio_chip *gpiochip_find(void *data,
 struct gpio_device *gpio_device_find(void *data,
 				     int (*match)(struct gpio_chip *gc,
 						  void *data));
+struct gpio_device *gpio_device_find_by_label(const char *label);
 
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
-- 
2.39.2

