Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77AAE732C7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Sep 2023 12:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjI1Mnj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Sep 2023 08:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjI1Mni (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2023 08:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD578180
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695904976;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iIgaek/2vaj0JutvpQK/iD5J0G41ovSmgWF0taiXJOo=;
        b=ABnrU8gadb0LF5VFST68oT/RuNSM96XzrjGVavQwZAwyQuqyisMkamQbdSAvdoOBnQDdGT
        97ChURdTQth5gbFu1W+zRLEXaGT52yVPaaT7DUZ4ipXvO+yUCLGIvZQOoFXyQ8fG+ASPuT
        u8NRBfMCVaNEP9bZqomYqCFSxiK+6XI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-LNFZVWSBPka5zYQ1uB2YYQ-1; Thu, 28 Sep 2023 08:42:54 -0400
X-MC-Unique: LNFZVWSBPka5zYQ1uB2YYQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9ae57d8b502so1074944366b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 05:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904973; x=1696509773;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIgaek/2vaj0JutvpQK/iD5J0G41ovSmgWF0taiXJOo=;
        b=DwQD2obUu+EfWqKUoVCdNmVMe76qGuo8QlbY7AtkkOr/0zSlzZsLnc/dEyZL3ImMML
         SMynaY34qDm+gP8rAAu4HOzSNQ67uGo/WgtIr1B/OSCpXnWMpbFKhnjajHdjauDGv92T
         +PHMi33M8CbZDB0pLx1+td8Baa7kkDLJO/Wr57F72P6UCH03LL8C6TIJelSqdUZJA+0w
         Z7ihxa5JASDT3SilbWMgvaBbt5IJevg37Hvynt+rNFFW8RXmYZZW47oENKXbh0MCARyU
         7O+r6Rq8C8rqQLFnvA7Vr+INevKKTD+gppltT2Rb5FqTl3NeXhftO8SxCPgaUvrIa5RL
         h+VA==
X-Gm-Message-State: AOJu0Yx6yPskBmedloGhcv8r3a0BgaMvVW2lrKQGp0jYYRHn65hVvNp0
        nQ775ifFORg/WPFHYyVmN2B6nn+Xhi7/90lrVRRh4FhLIBsyVvdwDeHyiVEaP8mihQ/BLTtD/Ug
        0+llT2FvwsBOXWcIJ64XZN4SJt8ki40mncQ==
X-Received: by 2002:a17:906:209e:b0:9a5:874a:9745 with SMTP id 30-20020a170906209e00b009a5874a9745mr1015776ejq.26.1695904973505;
        Thu, 28 Sep 2023 05:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlywnIyNYShfOZQqUKF/nPnEpW/BE9ULWRGFQaKFsFKQmtPIGivvU6o7bT5pQ/APNJZdsd4A==
X-Received: by 2002:a17:906:209e:b0:9a5:874a:9745 with SMTP id 30-20020a170906209e00b009a5874a9745mr1015758ejq.26.1695904973121;
        Thu, 28 Sep 2023 05:42:53 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.103])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00993a37aebc5sm10864511ejb.50.2023.09.28.05.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:42:52 -0700 (PDT)
Message-ID: <b8b1a3f0-3aca-341c-07ee-389b077a01f7@redhat.com>
Date:   Thu, 28 Sep 2023 14:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 2/5] platform/x86: int3472: Add new
 skl_int3472_gpiod_get_from_temp_lookup() helper
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

Add a new skl_int3472_gpiod_get_from_temp_lookup() helper.

This is a preparation patch for removing usage of the deprecated
gpiod_toggle_active_low() and acpi_get_and_request_gpiod() functions.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[hdegoede@redhat.com] use the new skl_int3472_fill_gpiod_lookup() helper
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 351ecf047944..a46c3a206aa3 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -99,6 +99,32 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 	return 0;
 }
 
+/* This should *really* only be used when there's no other way... */
+static struct gpio_desc *
+skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
+				       struct acpi_resource_gpio *agpio,
+				       const char *func, u32 polarity)
+{
+	struct gpio_desc *desc;
+	int ret;
+
+	struct gpiod_lookup_table *lookup __free(kfree) =
+			kzalloc(struct_size(lookup, table, 1), GFP_KERNEL);
+	if (!lookup)
+		return ERR_PTR(-ENOMEM);
+
+	lookup->dev_id = dev_name(int3472->dev);
+	ret = skl_int3472_fill_gpiod_lookup(&lookup->table[0], agpio, func, polarity);
+	if (ret)
+		return ERR_PTR(ret);
+
+	gpiod_add_lookup_table(lookup);
+	desc = gpiod_get(int3472->dev, func, GPIOD_OUT_LOW);
+	gpiod_remove_lookup_table(lookup);
+
+	return desc;
+}
+
 static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
 {
 	switch (type) {
-- 
2.41.0

