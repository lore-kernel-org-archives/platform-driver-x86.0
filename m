Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F77C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 13:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56E9961222
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 13:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbhEENZA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 09:25:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22297 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231774AbhEENY7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 09:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620221042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gMchfOp6Ltdn4ef76YgieWUBY94rW4g/5Cql6qMjVFQ=;
        b=g6gpwigZs7tIcR0DpABQi5NJnxBAvKwZJzouLEl5+PC2mldlhnoS/DT7qMm8n7nOVEI4q5
        s364yStchpH9Bm1rt7pWqDl2i4mofYszNNnq3y6/w4pCaSSZhPvHTu54BQ8SN3X3E0Roah
        +MOjK8543ujmnzNCCIGA0citW+9b/xc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-FawuYYgDMCO0KHEyqNy7PA-1; Wed, 05 May 2021 09:24:01 -0400
X-MC-Unique: FawuYYgDMCO0KHEyqNy7PA-1
Received: by mail-ej1-f69.google.com with SMTP id z15-20020a170906074fb029038ca4d43d48so442952ejb.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 May 2021 06:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gMchfOp6Ltdn4ef76YgieWUBY94rW4g/5Cql6qMjVFQ=;
        b=BmGurSGQdfoeLKNz4XxgcjhHa6JtJRDkopnK6awD9AJxBw7Radk62Bi3aV3va+XJmS
         lAtD+c+tM9VEA4VHeOCW3+8cZV/HgFvihw4l1dpYRvk5jZ3zGdVWK58kD2TgXM3xQ1im
         aAqget6biEQwoNOJXEA0YXA6JnQHuqCVqfl05NslZOWr6OuF8bREVIOs7cprVskKUfCN
         cJfPhSk9MYYIcf43rJopgCELt7/8QLz3QRWlR0c4fr98KNUJRDBHMhcNAN2+GUmtiJ6Z
         +xl1Ff/qIO/dZB82F+M4IhAwFEhev4S535RIBD1M4DTbXLRWMg/XNOtUL7kzKSS2gMWU
         o0Fg==
X-Gm-Message-State: AOAM532iVWcKhoX3JiFbWT/CZjuqp6wzJyt+wb0qLNHgY3EFBtkUUn23
        eqnf+Pa+0MHt/NidCSnpI7z0WDv2uJXqogQTDfryFgvG1UhTAZS0146K2VOiXD85/qZz8tY4hUo
        6Tm2n7UmVVWahs4ssd3H6KIriviF/c8yLiQR6gUVgLN4Y2//ptRfVryXM5FnC25WedeUgsMdeg+
        v/XL+JEPG5DA==
X-Received: by 2002:a05:6402:199:: with SMTP id r25mr32454492edv.128.1620221039907;
        Wed, 05 May 2021 06:23:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzptaWcBUE3+5K+c4ACcILgNlmN2lX6JQUeGNxEVsplyAAZ+H4vRTKzfad3Is7IycuqnDrkBQ==
X-Received: by 2002:a05:6402:199:: with SMTP id r25mr32454475edv.128.1620221039717;
        Wed, 05 May 2021 06:23:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b8sm16280702edu.41.2021.05.05.06.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 06:23:59 -0700 (PDT)
Subject: Re: [v3,1/1] adv_mix955x is a scheme that multiplexes PCA9554/PCA9555
 into LED and GPIO
To:     =?UTF-8?B?eXVlY2hhby56aGFvKOi1tei2iui2hSk=?= 
        <yuechao.zhao@advantech.com.cn>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "345351830@qq.com" <345351830@qq.com>,
        =?UTF-8?B?UmFpbmJvdy5aaGFuZyjlvLXnjokp?= 
        <Rainbow.Zhang@advantech.com.cn>,
        =?UTF-8?B?eXVueGlhLmxpKOadjuS6kemcnik=?= 
        <yunxia.li@advantech.com.cn>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        =?UTF-8?B?SmlhLlN1aSjotL7nnaIp?= <Jia.Sui@advantech.com.cn>,
        Mark Gross <mgross@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <tencent_F8EEB847E2CD8A6813D0BF4863964CDF3508@qq.com>
 <b787cd95ad7746d9a04e8cd7f6c0b645@ACNMB2.ACN.ADVANTECH.CORP>
 <CAHp75Vce_-m5uXgpyRO300M1Vw8DX2BmnBPsF5OaUK2_hNDb_A@mail.gmail.com>
 <DFBFA86F-1A66-4351-9987-C63CCB40D82A@advantech.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ec4da512-76c7-acec-f41d-179fd469b615@redhat.com>
Date:   Wed, 5 May 2021 15:23:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <DFBFA86F-1A66-4351-9987-C63CCB40D82A@advantech.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/3/21 3:16 PM, yuechao.zhao(赵越超) wrote:
> Hi Andy
> Sorry for the late reply
> 
> The reason for writing this driver is that our customers hope that the LED and GPIO can be used out of the box
> When they using our X86-Platform
> 
> About the document and ACPI expert, I will provide them after I improve them. Please wait for a few days.

So my initial assessment of this code matches Andy's I don't like the idea
of duplicating the GPIO chip functionality from drivers/gpio/gpio-pca953x.c here.

I understand that you want to have things working out of the box and I believe
that we all agree that that is what we want.

But you can get there without duplicating the code.

We already have cases where there is an I2C device with an existing driver
where we need some "glue" code to translate the ACPI provided info to
what the i2c drivers expect, some examples of these are:

drivers/platform/x86/i2c-multi-instantiate.c
drivers/platform/x86/intel_cht_int33fe_typec.c

So what you need to do is basically start writing a completely new driver
which:

1. Instantiates an i2c-client for the drivers/gpio/gpio-pca953x.c driver
to bind to.

2. Creates and attaches software-fwnodes which provide info for the 
drivers/leds/leds-gpio.c code to parse and have that code instantiate
LED class devices which drive the leds through the GPIO interface
offered by the drivers/gpio/gpio-pca953x.c driver.

Regards,

Hans


> ﻿在 2021/5/2 下午6:50，“Andy Shevchenko”<andy.shevchenko@gmail.com> 写入:
> 
>     On Fri, Apr 30, 2021 at 8:27 AM yuechao.zhao(赵越超)
>     <yuechao.zhao@advantech.com.cn> wrote:
>     >
>     > From: Yuechao Zhao <yuechao.zhao@advantech.com.cn>
>     >
>     > With this driver, we can multiplex PCA9554/PCA9555 into LED and GPIO
>     > based on the ACPI data of BIOS.
> 
>     NAK as per v2.
> 
>     Please, add a proper documentation and show ACPI excerpt, and last but
>     not least is missing justification.
> 
> 
>     -- 
>     With Best Regards,
>     Andy Shevchenko
> 

