Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D721C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 16:06:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7912761351
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 16:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239411AbhKHQJj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 11:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29845 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231529AbhKHQJi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 11:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636387613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y1FCpwnoXru8LCUd4AbjW/RHjevdkDPK2hMhE65LRpk=;
        b=Oj9a5e876xhXTgp8+t8Td1u4nyIbiDZ7tzkRGO7jUeHM2o+btsBDhvdE8KeHhGLGwuM8l+
        D/Xdm4Qw2jyH35IUE/Uu3KLpJb7dl1R3TqWN+5zxYxwPixhKuBgA/lVMe4DjisfuODu7fU
        4rwMN5IjPnUwwN3eYrZAsQZTp7Za6xQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-EbXLYt5nObqCE1TqWujfhQ-1; Mon, 08 Nov 2021 11:06:52 -0500
X-MC-Unique: EbXLYt5nObqCE1TqWujfhQ-1
Received: by mail-ed1-f71.google.com with SMTP id z1-20020a05640235c100b003e28c89743bso15177505edc.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Nov 2021 08:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=y1FCpwnoXru8LCUd4AbjW/RHjevdkDPK2hMhE65LRpk=;
        b=K9zJjo5VT4p7EcjXbj+Y70H+krdyBRkc0lgeLw4ZRbbRSrsCzveUc9fsCYRao3nd6V
         ge8kBg1wJPhCsfByoCacL2YJucyNmTP9Dklc/yJ3iWOWwka4wZHygyfDMdbJaJr1jcFx
         PhvDdab8AbBgoXaZcgZGk7E5ZmuVTk5ZCskSFyo4I2MY0oq8oBdSaFAin8xUt21X0YkS
         w2Yqd3HFU4TKKwI153iFj1kTu00uzRiMNMEbQeHKVjVyaz3qebKwuMZjRrGPILaK0LnN
         GfTD/qGy37zEXvl5X5PksW1MkfeMXAW4OK8FsV8SN16o7Ehm6WgaZkrbPWK/Kn606ofc
         Frug==
X-Gm-Message-State: AOAM532yxVgv56pxU60nymwwBzTKVDM3iSYpUAtDc2l7F5jNGCUJQmVU
        y9a1lej1F0aSiX8tREb8Rz0OK7cMnsN9D8yNsmv5Ho59FKkVeYmSCn8TAqNaqdY4sKc4PcPFj6H
        wPK4+YBZNJWFIQrYoUAvHUs2tDyuhWz0c8g==
X-Received: by 2002:a05:6402:42d3:: with SMTP id i19mr351681edc.82.1636387611537;
        Mon, 08 Nov 2021 08:06:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu9/pkrAjKIXIFB1SkeQQxKCuuMdfW8j3XbHSYc37jzZgl2Op4II0m3tdXn02+xuywOMqKXw==
X-Received: by 2002:a05:6402:42d3:: with SMTP id i19mr351664edc.82.1636387611366;
        Mon, 08 Nov 2021 08:06:51 -0800 (PST)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id q8sm3675287edd.26.2021.11.08.08.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:06:50 -0800 (PST)
Message-ID: <6ffd2b8c-00f4-211e-de57-23d5159ae7d4@redhat.com>
Date:   Mon, 8 Nov 2021 17:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/13] power: supply: bq25890: Add support for registering
 the Vbus boost converter as a regulator
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20211030182813.116672-1-hdegoede@redhat.com>
 <20211030182813.116672-11-hdegoede@redhat.com>
 <CAHp75Vc=dZ1FPeDgaY8S+dSu8i=QUgbLN2NVOcsMz6h0uytNeg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc=dZ1FPeDgaY8S+dSu8i=QUgbLN2NVOcsMz6h0uytNeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/31/21 00:13, Andy Shevchenko wrote:
> On Sat, Oct 30, 2021 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The bq25890_charger code supports enabling/disabling the boost converter
>> based on usb-phy notifications. But the usb-phy framework is not used on
>> all boards/platforms. At support for registering the Vbus boost converter
>> as a standard regulator when there is no usb-phy on the board.
>>
>> Also add support for providing regulator_init_data through platform_data
>> for use on boards where device-tree is not used and the platform code must
>> thus provide the regulator_init_data.
> 
> ...
> 
>> @@ -1018,6 +1059,21 @@ static int bq25890_probe(struct i2c_client *client,
>>                 INIT_WORK(&bq->usb_work, bq25890_usb_work);
>>                 bq->usb_nb.notifier_call = bq25890_usb_notifier;
>>                 usb_register_notifier(bq->usb_phy, &bq->usb_nb);
>> +#ifdef CONFIG_REGULATOR
>> +       } else {
>> +               struct bq25890_platform_data *pdata = dev_get_platdata(dev);
>> +               struct regulator_config cfg = { };
>> +               struct regulator_dev *reg;
>> +
>> +               cfg.dev = dev;
>> +               cfg.driver_data = bq;
>> +               if (pdata)
>> +                       cfg.init_data = pdata->regulator_init_data;
>> +
>> +               reg = devm_regulator_register(dev, &bq25890_vbus_desc, &cfg);
>> +               if (IS_ERR(reg))
>> +                       return dev_err_probe(dev, PTR_ERR(reg), "registering regulator");
>> +#endif
>>         }
> 
> }
> #ifdef
> else {
>   ...
> }
> #endif
> 
> is a bit better to maintain (less error prone in case of new code).
> 
> ...
> 
>> +#ifndef _BQ25890_CHARGER_H_
>> +#define _BQ25890_CHARGER_H_
> 
>> +#include <linux/regulator/machine.h>
> 
> struct regulator_init_data;
> 
> should be sufficient, no header is needed.

Thanks, I've fixed both for v2 of the patch-set.

Regards,

Hans


> 
>> +struct bq25890_platform_data {
>> +       const struct regulator_init_data *regulator_init_data;
>> +};
>> +
>> +#endif
> 

