Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA909C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 19:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237319AbhLUTMZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 14:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26681 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231410AbhLUTMZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 14:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640113944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vW7ChJoI1+RUe/vMGcK4Pv09q1Fx+Ehw4EFzc8btr0I=;
        b=VyrizMd26j+91evYcJGshl1/qwhjwjDqrRFDVwjyv07Ea7OWpeomKQX0MVMwqHmgiaOIVL
        J4lttvbwpNXxKEqv78t9Z5KT1JRBCxHfhiveQ7C94nAv+tBdUNZIyIMv8qcUSBT+nn/1HZ
        rAaBa1dhARgstYHxqVTKvfhtkbkiE1o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-0-52TOu_M0WUryCuXanmbQ-1; Tue, 21 Dec 2021 14:12:23 -0500
X-MC-Unique: 0-52TOu_M0WUryCuXanmbQ-1
Received: by mail-ed1-f71.google.com with SMTP id y17-20020a056402271100b003f7ef5ca612so11188671edd.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 11:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=vW7ChJoI1+RUe/vMGcK4Pv09q1Fx+Ehw4EFzc8btr0I=;
        b=hi8RYx4jLXwQa+XXZj4OeGryZv9ygIZymZUWqq27u0IT6X2AM43WRhIMz+ASdnOesX
         AD1r/IG49XOW7JqfJ1aLRhk8plQNtGo6qhLbwluE2qdbQRxMdTE4YxqE0mykHhubM792
         Duw/QoOgT/8QHAh8UQYSwNKlPfBoPez71Tba4oQdhsUGPPhHvUOsgRUM5kETwFtDuqIy
         nXoXZI2tVEvqv0EjFDjZ39DN3eebmP9L8UFc4S6t6/jc08Dvabz1Sf74FJT94lMGig7Q
         CUykLHg9vUoVt/gF3KjRtPpLjFfMwxT3noJwi/LYmWIO8K1i3s+MDCgWGbZRn/e7UlJB
         INCQ==
X-Gm-Message-State: AOAM533WU0Du9HYyZ6ImjVXGJNoRrTthRahce/jKuZ321/HWF0WX6Yyx
        thUJVCXQQMVHhosaF01bETCOXEVD/AWdsJyM9Ifj5qN95AaeXX/FrCExmwHrytWK6rJBsmWDEEP
        HOeEAhTvft/1LZSqxllGUcFX8rBEthCir2w==
X-Received: by 2002:a05:6402:440b:: with SMTP id y11mr4669135eda.226.1640113942284;
        Tue, 21 Dec 2021 11:12:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhLdSrh+Q44+uU970EfRV/nJvfrhjAyPf+yMNAcAHlW8ms7onROnYQlY41W+CygjiH+23noA==
X-Received: by 2002:a05:6402:440b:: with SMTP id y11mr4669120eda.226.1640113942088;
        Tue, 21 Dec 2021 11:12:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id gv11sm1207490ejc.135.2021.12.21.11.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 11:12:21 -0800 (PST)
Message-ID: <ba156166-2e88-a6a5-a061-0630eef3da3f@redhat.com>
Date:   Tue, 21 Dec 2021 20:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: New driver for
 x86 Android tablets
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20211221151243.66216-1-hdegoede@redhat.com>
 <20211221151243.66216-2-hdegoede@redhat.com>
 <CAHp75Ve8NP4FQO1R6tsRV7G4rSmch-dX5ADKCb7E7Q83zqKyew@mail.gmail.com>
 <74a71e6c-1ee3-20ce-4ac6-0abfccda79dc@redhat.com>
In-Reply-To: <74a71e6c-1ee3-20ce-4ac6-0abfccda79dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/21/21 20:05, Hans de Goede wrote:
> Hi,
> 
> On 12/21/21 16:39, Andy Shevchenko wrote:
>> On Tue, Dec 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> x86 tablets which ship with Android as (part of) the factory image
>>> typically have various problems with their DSDTs. The factory kernels
>>> shipped on these devices typically have device addresses and GPIOs
>>> hardcoded in the kernel, rather then specified in their DSDT.
>>>
>>> With the DSDT containing a random collection of devices which may or
>>> may not actually be present as well as missing devices which are
>>> actually present.
>>>
>>> This driver, which loads only on affected models based on DMI matching,
>>> adds DMI based instantiating of kernel devices for devices which are
>>> missing from the DSDT, fixing e.g. battery monitoring, touchpads and/or
>>> accelerometers not working.
>>>
>>> Note the Kconfig help text also refers to "various fixes" ATM there are
>>> no such fixes, but there are also known cases where entries are present
>>> in the DSDT but they contain bugs, such as missing/wrong GPIOs. The plan
>>> is to also add fixes for things like this here in the future.
>>>
>>> This is the least ugly option to get these devices to fully work and to
>>> do so without adding any extra code to the main kernel image (vmlinuz)
>>> when built as a module.
>>
>> ...
>>
>>> +config X86_ANDROID_TABLETS
>>> +       tristate "X86 Android tablet support"
>>> +       depends on I2C && ACPI
>>> +       help
>>> +         X86 tablets which ship with Android as (part of) the factory image
>>> +         typically have various problems with their DSDTs. The factory kernels
>>> +         shipped on these devices typically have device addresses and GPIOs
>>> +         hardcoded in the kernel, rather then specified in their DSDT.
>>
>> than
> 
> Fixed.
> 
>>
>>> +
>>> +         With the DSDT containing a random collection of devices which may or
>>> +         may not actually be present. This driver contains various fixes for
>>> +         such tablets, including instantiating kernel devices for devices which
>>> +         are missing from the DSDT.
>>
>> ...
>>
>>> +static const char * const chuwi_hi8_mount_matrix[] = {
>>> +       "1", "0", "0",
>>> +       "0", "-1", "0",
>>> +       "0", "0", "1"
>>
>> + comma?
> 
> This is a 3x3 matrix, there are never going to be extra entries
> added, so no I don't think so.
> 
>>
>>> +};
>>
>> ...
>>
>>> +       int ret = 0;
>>
>>> +       board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
>>> +       if (board_info.irq < 0) {
>>> +               ret = board_info.irq;
>>> +               goto out;
>>> +       }
>>
>> Can we rather use
>> ret = ...
>> if (ret < 0)
>>  goto
>> .irq = ret;
>>
>> ?
> 
> Ack, fixed.

Scrap that, this way the function will now return the Linux IRQ number on
success instead of 0.

Instead I've ended up refactoring things so that I don't need a ret variable;
nor a goto at all anymore (by getting the irq first).

Regards,

Hans




> 
>>
>> ...
>>
>>> +       i2c_clients[idx] = i2c_new_client_device(adap, &board_info);
>>> +       if (IS_ERR(i2c_clients[idx])) {
>>
>>> +               ret = PTR_ERR(i2c_clients[idx]);
>>> +               pr_err("Error creating I2C-client %d: %d\n", idx, ret);
>>
>> dev_err_probe()? (device of the adapter)
> 
> Ack, fixed.
> 
> 
>>
>>> +       }
>>
>> ...
>>
>>> +out:
>>
>> out_put_device: ?
> 
> I've gone with out_put_adap instead.
> 
> Regards,
> 
> Hans
> 
> 
>>
>>> +       put_device(&adap->dev);
>>> +       return ret;
>>
>> ...
>>
>>> +       int i, ret = 0;
>>
>> Do you need this assignment? See below.
>>
>> ...
>>
>>> +       for (i = 0; i < dev_info->i2c_client_count; i++) {
>>> +               ret = x86_instantiate_i2c_client(dev_info, i);
>>> +               if (ret < 0) {
>>> +                       x86_android_tablet_cleanup();
>>
>>> +                       break;
>>
>> return ret; ?
>>
>>> +               }
>>> +       }
>>
>>> +       return ret;
>>
>> return 0; ?
>>

