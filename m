Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59920C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 22:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353031AbhLFWHV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 17:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50089 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229581AbhLFWHV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 17:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638828231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4xIe/+QwK3Gt103tg62c3fVZruR+xSiq1mNfBlT2C4s=;
        b=D3lu6M42E8Nh8PJy9mTQTPhrmFooqP3vkTM37y9SiVyd0zG4MIXSoKyakSx8W4VoRQoxQj
        moF7XKA+Ca5rER/T7lg+fWiR1i7OKIBN6z/mu8SeycNYKFlD+EZxnYIT+N2YFiK2WWFT2s
        OTtYrqxgBoOdA2Vd4VO28J3OBvU9rq0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-LpMIGEmWMSG5c8P1-B6IUA-1; Mon, 06 Dec 2021 17:03:50 -0500
X-MC-Unique: LpMIGEmWMSG5c8P1-B6IUA-1
Received: by mail-ed1-f72.google.com with SMTP id w5-20020a05640234c500b003f1b9ab06d2so9568720edc.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Dec 2021 14:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4xIe/+QwK3Gt103tg62c3fVZruR+xSiq1mNfBlT2C4s=;
        b=Sr4QiN2yQH/hNMt+Lgv9T14HmCsToQCiAiu1u7ot8lLYaoBB+U0yY1khmMqocVz1zL
         QY4qSJ6IsE+YxEGM6xsjQKwOGSNq1UyfRpL3VBioBvgY5WM3L7njt0WxdcErynnWrLXB
         j01iGxEaJ7Vr8+nZz/1dq8ShH2mwIZKI80/er4G8awlKPzNkeRghKUYIRm4mFn/tNZmx
         MkZV0uYyCCQHdnbhV1IThGbbnnJjhBsXMQeVboaSRUqkXhIVkR/AOs67C1nsYWQKsoSJ
         I5aJruLQ+RCflXnqRS+6nt1zrjZz+5Q8TVMpLP55uOH1XGEAjt71GPHr0AGszgpYf94M
         WgVA==
X-Gm-Message-State: AOAM533mTESsmVvElgmXzvliorgPN1LPx6IfV1Alg8GDTyyccG7yvNgN
        7jPWLEOLNxY0uKg6xQn63HZdc7d22sj7MSd79/I9+0io9KzgUYLtNIMxBeeftaQOjn1xx14gPyd
        RJIjHu8gWLN/lkMGmGDCZZD8NdHzcxaurIA==
X-Received: by 2002:a17:906:9482:: with SMTP id t2mr47906473ejx.288.1638828229086;
        Mon, 06 Dec 2021 14:03:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB5lhiSjR14mhzE7nuptSjD31TGbUEy/eaUMaTmqJSoBtKRt1z83uzUkwZ0cPukeK5SrlX4Q==
X-Received: by 2002:a17:906:9482:: with SMTP id t2mr47906447ejx.288.1638828228832;
        Mon, 06 Dec 2021 14:03:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a13sm8598277edk.29.2021.12.06.14.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 14:03:48 -0800 (PST)
Message-ID: <90ae65b0-c7fa-6faf-770a-0b8f45319860@redhat.com>
Date:   Mon, 6 Dec 2021 23:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: x86-android-tablets: New driver for x86
 Android tablets
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20211125192618.732348-1-hdegoede@redhat.com>
 <CAHp75VfBojmmJe-doVt1X8CvzxKh9Ut=kRALr_z3Gmx3ndtL8Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfBojmmJe-doVt1X8CvzxKh9Ut=kRALr_z3Gmx3ndtL8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/21 20:43, Andy Shevchenko wrote:
> On Thu, Nov 25, 2021 at 9:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> x86 tablets which ship with Android as (part of) the factory image
>> typically have various problems with their DSDTs. The factory kernels
>> shipped on these devices typically have device addresses and GPIOs
>> hardcoded in the kernel, rather then specified in their DSDT.
>>
>> With the DSDT containing a random collection of devices which may or
>> may not actually be present as well as missing devices which are
>> actually present.
>>
>> This driver, which loads only on affected models based on DMI matching,
>> adds DMI based instantiating of kernel devices for devices which are
>> missing from the DSDT, fixing e.g. battery monitoring, touchpads and/or
>> accelerometers not working.
>>
>> Note the Kconfig help text also refers to "various fixes" ATM there are
>> no such fixes, but there are also known cases where entries are present
>> in the DSDT but they contain bugs, such as missing/wrong GPIOs. The plan
>> is to also add fixes for things like this here in the future.
>>
>> This is the least ugly option to get these devices to fully work and to
>> do so without adding any extra code to the main kernel image (vmlinuz)
>> when built as a module.
> 
> The idea is not bad.
> 
> ...
> 
>> +config X86_ANDROID_TABLETS
>> +       tristate "X86 Android tablet support"
> 
>> +       depends on I2C && ACPI
> 
> Why I²C dependency? Are you expecting all problematic DSDTs to be
> related to I²C?

I2C at a minimum is a big part if it. So far all this "driver" dies
is instantiate I2C devices, so building it in a kernel which has I2C
disabled does not make any sense.

> 
>> +       help
>> +         X86 tablets which ship with Android as (part of) the factory image
>> +         typically have various problems with their DSDTs. The factory kernels
>> +         shipped on these devices typically have device addresses and GPIOs
>> +         hardcoded in the kernel, rather then specified in their DSDT.
> 
> than

Ack, will fix.

> 
>> +         With the DSDT containing a random collection of devices which may or
>> +         may not actually be present. This driver contains various fixes for
>> +         such tablets, including instantiating kernel devices for devices which
>> +         are missing from the DSDT.
>> +
>> +         If you have a x86 Android tablet say Y or M here, for a generic x86
>> +         distro config say M here.
> 
> ...
> 
>> +#define pr_fmt(fmt) "x86-android-tablet: " fmt
> 
> Can we use a predefined module name instead?

Ack, will fix.

> 
> ...
> 
>> +#define IRQ_TYPE_NONE          0
>> +#define IRQ_TYPE_APIC          1
>> +#define IRQ_TYPE_GPIOINT       2
> 
> Is this same / similar to what we have in I²C multi-instantiate
> driver? Perhaps something in include/linux/platform_data/x86?

Yes and no, it looks similar, but there the "enum" is used to select
which ACPI resource to lookup. Where as here we are manually looking
up the interrupt number ourselves since there are no ACPI resources.

So the similarity is superficial only the actual code is quite
different.

> 
> ...
> 
>> +struct x86_i2c_client_info {
>> +       struct i2c_board_info board_info;
>> +       char *adapter_path;
> 
>> +       int irq_type;
>> +       int irq_index;
>> +       int irq_trigger;
>> +       int irq_polarity;
> 
> Wondering if these fields are already defined in some structure by IRQ
> core or alike. In such case I would rather use more memory and
> predefined structure (it it has proper naming, of course).

irq_type is set to our own unique defines from above, so I'm
afraid there is no pre-defined structure matching this.

> 
>> +};
> 
> ...
> 
>> +static const struct x86_dev_info chuwi_hi8_info __initconst = {
>> +       .i2c_client_info = chuwi_hi8_i2c_clients,
>> +       .i2c_client_count = ARRAY_SIZE(chuwi_hi8_i2c_clients),
>> +       .gpiod_lookup_table = &chuwi_hi8_gpios,
>> +};
> 
> Okay, looking into the below, I think of better granularity of this
> one, by splitting on per device module or so. Does it make sense? (I'm
> expecting this one to grow too big to be suitable for everybody)

I actually started with a 1 special driver per model as concept,
but having a lot of tiny modules has a price too, figuring out Kconfig
options takes quite some time for distro kernel maintainers.

And each module adds overhead to, in disk use, but also in depmod info.

So I deliberately decided to go for one file. I'm actually not expecting
this to grow that much at all. Most tablets are dual-boot and the dual-boot
ones typically have a DSDT which is fine.

The only troublesome models which I'm aware of and which I plan to
eventually add are:

1. Asus MeMO Pad 7ME176C (7" BYT Android only tablet)
2. Asus Transformer TF103C (10" BYT Android only tablet)
3. No-name (sometimes branded as Glavey) TM800A550L (8" BYT Android only tablet)

Which puts the total at 5 devices, at least for now. So I believe that
keeping this in 1 file is fine. We can always split it later if it
becomes too big.


> ...
> 
>> +/*
>> + * On the Xiaomi Mi Pad 2 X86 tablet a bunch of devices are hidden when
>> + * the EFI if the tablet does thinks the OS it is booting is Windows
> 
> in Windows

Ack, will fix.

> 
>> + * (OSID in the DSDT is set to 1); and the EFI code thinks this as soon
>> + * as the EFI bootloader is not Xiaomi's own signed Android loader :|
>> + *
>> + * This takes care of instantiating the hidden devices manually.
>> + */
>> +static const char * const bq27520_suppliers[] = { "bq25890-charger" };
>> +
>> +static const struct property_entry bq27520_props[] = {
>> +       PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27520_suppliers),
>> +       { }
>> +};
> 
> ...
> 
>> +               if (ret < 0) {
> 
>> +                       pr_err("Error getting APIC IRQ %d: %d\n",
>> +                              client_info->irq_index, ret);
> 
> One line?

Ack, will fix.

> 
>> +                       goto out;
>> +               }
> 
> ...
> 
>> +       ret = 0;
>> +       i2c_clients[idx] = i2c_new_client_device(adap, &board_info);
>> +       if (IS_ERR(i2c_clients[idx])) {
>> +               ret = PTR_ERR(i2c_clients[idx]);
>> +               pr_err("Error creating I2C-client %d: %d\n", idx, ret);
>> +       }
> 
> Ah, can we actually use i2c-multi-instantiate as a driver here?

That expects ACPI resources, both for the I2C adapter / client address
pair (an I2cSerialBusV2 resource) as well as for the IRQs.

> 
> ...
> 
>> +       if (dev_info->gpiod_lookup_table)
> 
> Perhaps it makes sense to move this to the GPIO library? AFAIR I saw a
> few more cases like this.

Maybe something for a separate cleanup series, I don't know adding
NULL checks to register/add functions is not really standard practice
in the kernel.

> 
>> +               gpiod_add_lookup_table(dev_info->gpiod_lookup_table);
> 
> ...
> 
>> +       if (dev_info->gpiod_lookup_table)
> 
> This is not needed. (Yes, now I checked it carefully)
> 
>> +               gpiod_remove_lookup_table(dev_info->gpiod_lookup_table);

Ack, will fix.


> 
> ...
> 
> 
>> +
>> +module_init(x86_android_tablet_init);
>> +module_exit(x86_android_tablet_cleanup);
> 
> I would prefer to see them attached to the methods and without an
> additional blank line (but it's minor thingy).
> 

Regards,

Hans

