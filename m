Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB39CA0FFD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 18:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240309AbjIESzK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 14:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239223AbjIESzF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 14:55:05 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583E4CF9
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 11:54:36 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401ec23be82so30149465e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940012; x=1694544812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ESplXfwHuP68mF4bwcKzJlFkniMRPzx/b85/cMF6oE=;
        b=t6vnKqg+T54zB4Fkaa6Gy9AZAwhWlkIbFZZHoCfpms+RuRj6YJyXvIX1Wypx53fBqS
         ttS+voJEq+UucTCkf4/EU9pxZml9x38cspPMCu3FrX66N5Yg28F5N8FMEieVxRwRb+ZF
         E2NY8v6ju8+Y27OxjHyVsJzdrAMRomc2mT2SSXGTDokhY7gQgTbmaT6N8tXraLbt5NJp
         3jEmVCJiEdw8wth1e6Y+QlwteQHt2OAmZI7Tz+7qUAOeJnTSkeRVizE+H5JU9idv0ygH
         kq/U3oYVdaOinSqHyWCHvHr0DTlem8c5OxqzxwQTPK3ozuPMt2RKw9s2UQ0kjTKZmp1+
         1pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940012; x=1694544812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ESplXfwHuP68mF4bwcKzJlFkniMRPzx/b85/cMF6oE=;
        b=AyM5m5REJs1rAaFdaMd7/b40l4vYJabGbXif88iA9T9sU8QLa9Ks3K+cj6hkATNrda
         vAAo2dQ8vXa7uwO9QASdS7JRXUfe7vZtqhMIDC2zzxRQR78boF/nApPwu0jYfSlBn7gD
         3oea8F/FDBM6GZDNUbWrifucW9DKquoSebDbanTAnPzRZY1aHrEkKlMJo/s/0XnSY9Fk
         G18F79bxFU09sggWSOTLoLJP3bVV89EcqY2hghDvgW6mE9+nm5N/gaOZgOp/X1PVMGts
         rM4Ozz+lJAViNiVFqxqqxWpVIy2OfKTHHqgfC6//J2ompwLMwOeRRHNWPs0uvN3fcqtR
         5ScQ==
X-Gm-Message-State: AOJu0YwP2uDe854ZwF04UV2LxZC3X8j4DKKsykXq2B+0Ed7PFV1P0nuR
        O+w5U5sJZx6Q6BpMgb7DcaZcUA==
X-Google-Smtp-Source: AGHT+IH/VUJWjUGeUiwbD9fUfZeGiUcxVuhg9dWO0f7MJ889A/l01WqAkHMkYlgWTOb/EzfuaH05Kg==
X-Received: by 2002:a7b:c411:0:b0:3fe:f45:772d with SMTP id k17-20020a7bc411000000b003fe0f45772dmr436878wmi.28.1693940012315;
        Tue, 05 Sep 2023 11:53:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:31 -0700 (PDT)
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
Subject: [PATCH 05/21] gpiolib: add support for scope-based management to gpio_device
Date:   Tue,  5 Sep 2023 20:52:53 +0200
Message-Id: <20230905185309.131295-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the few users that need to get the reference to the GPIO device often
release it right after inspecting its properties, let's add support for
the automatic reference release to struct gpio_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a769baf3d731..b2572b26c8e3 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -614,6 +614,8 @@ struct gpio_device *gpio_device_find_by_label(const char *label);
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
 
+DEFINE_FREE(gpio_device_put, struct gpio_device *, if (_T) gpio_device_put(_T));
+
 bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
-- 
2.39.2

