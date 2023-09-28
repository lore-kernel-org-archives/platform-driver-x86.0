Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC69E732CA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Sep 2023 12:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjI1Mqs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Sep 2023 08:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbjI1Mqq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2023 08:46:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A9A19F
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695905156;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ACdKckhs2IGUtv5AveDwU/IL9fYWvBeI2aPkdMd1dhI=;
        b=Mb0DhrS2dQCLHBuvdSxJLORbSDm5z8iWjnlATXhNvf0yEY76hYDh5FrZsW5MlfitvqPn+s
        ZJzzlOhLxhmu5FEVgJ0kcKPc/TMOm5tS8me8fAhJ8L9yMyjUR00sj+c8qXBgzg4gpppc2I
        DDHQE5ItkCDZXAIoVrRlPkWAFNPVinU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-ceOEExNQMjmQgp2DQcUqhg-1; Thu, 28 Sep 2023 08:45:55 -0400
X-MC-Unique: ceOEExNQMjmQgp2DQcUqhg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae686dafedso1099013766b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695905154; x=1696509954;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACdKckhs2IGUtv5AveDwU/IL9fYWvBeI2aPkdMd1dhI=;
        b=Sq+feQPabVcPpo//gHf551OB3bVmGvQC+o7pzRbEhZQvOW6K5S25s8tO/M6Sx74iU/
         1d/UDXiy9GG4wvmOsoLg9SIQ8rIcwr/5d/yA66llMOKmZOErzzGfWro3lsnEiuf4cP3e
         r7iHC0ht7yZzCRc2P+90e7LP2jrcNtz3KWpNn6aIuf/1YmcZ//8riiDUyBj/3O1Uh3HY
         giJRGQXGRhi556Rc1REu9TFrGrumdj0alWzjjhqPmwgE8WurMHyOlUHgyMcls4YOTbnH
         0mHxfs/891a+nZhoN8ZPvCY6vbonH2U93sCrnrrCNmXWcwM6CXwCHMftHywVyVgTtZry
         IfZg==
X-Gm-Message-State: AOJu0YwYconGNNLmCgZ4r7XCU+qf9BnmfBHoEtwltYtU6x8+7PAl7gxg
        7o3iV3Lhi44g6CQP7k4d5iff55M9tSkx+dijUxvjtvgOWbM2MNmzNRp7Rk0te9coMbhfXqxQjOG
        Bb0Po4YPaHOAOv/xhmKrPSh4JRCHwVxu2/A==
X-Received: by 2002:a17:906:3150:b0:9ae:696c:2c43 with SMTP id e16-20020a170906315000b009ae696c2c43mr1183234eje.28.1695905154397;
        Thu, 28 Sep 2023 05:45:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQnYwpJz4FRm5OEctCUqntpuOgB3RgSDa5zxu4Q3oNPpnc3WMFQcTzGCzOVBYL6EaWeUHW8A==
X-Received: by 2002:a17:906:3150:b0:9ae:696c:2c43 with SMTP id e16-20020a170906315000b009ae696c2c43mr1183223eje.28.1695905154189;
        Thu, 28 Sep 2023 05:45:54 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.103])
        by smtp.gmail.com with ESMTPSA id lw13-20020a170906bccd00b0098884f86e41sm10683387ejb.123.2023.09.28.05.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:45:53 -0700 (PDT)
Message-ID: <93be52fc-fa87-423f-dde2-1b0b758ab632@redhat.com>
Date:   Thu, 28 Sep 2023 14:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 5/5] gpio: acpi: remove acpi_get_and_request_gpiod()
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230926145943.42814-1-brgl@bgdev.pl>
 <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
In-Reply-To: <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

With no more users, we can remove acpi_get_and_request_gpiod().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Link: https://lore.kernel.org/r/20230926145943.42814-5-brgl@bgdev.pl
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib-acpi.c   | 28 ----------------------------
 include/linux/gpio/consumer.h |  8 --------
 2 files changed, 36 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 17a86bdd9609..89ff93f3b579 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -158,34 +158,6 @@ static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 	return gpiochip_get_desc(chip, pin);
 }
 
-/**
- * acpi_get_and_request_gpiod - Translate ACPI GPIO pin to GPIO descriptor and
- *                              hold a refcount to the GPIO device.
- * @path:      ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
- * @pin:       ACPI GPIO pin number (0-based, controller-relative)
- * @label:     Label to pass to gpiod_request()
- *
- * This function is a simple pass-through to acpi_get_gpiod(), except that
- * as it is intended for use outside of the GPIO layer (in a similar fashion to
- * gpiod_get_index() for example) it also holds a reference to the GPIO device.
- */
-struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char *label)
-{
-	struct gpio_desc *gpio;
-	int ret;
-
-	gpio = acpi_get_gpiod(path, pin);
-	if (IS_ERR(gpio))
-		return gpio;
-
-	ret = gpiod_request(gpio, label);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return gpio;
-}
-EXPORT_SYMBOL_GPL(acpi_get_and_request_gpiod);
-
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
 {
 	struct acpi_gpio_event *event = data;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 1c4385a00f88..9d1f598b8971 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -614,8 +614,6 @@ void acpi_dev_remove_driver_gpios(struct acpi_device *adev);
 int devm_acpi_dev_add_driver_gpios(struct device *dev,
 				   const struct acpi_gpio_mapping *gpios);
 
-struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char *label);
-
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 #include <linux/err.h>
@@ -633,12 +631,6 @@ static inline int devm_acpi_dev_add_driver_gpios(struct device *dev,
 	return -ENXIO;
 }
 
-static inline struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin,
-							   char *label)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
 #endif /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 
-- 
2.41.0

