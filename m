Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3203DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 18:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241500AbhLUS6b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 13:58:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22901 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237347AbhLUS6b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 13:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640113110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ne1bsk1SsL8jAGhaeIKOOPxk9oTyHio8F6FuLYA3huk=;
        b=OEAWYEwa5B5k3IiY1rl4JPeTuPxOUuZcZ/AK4CCBCvl0/xRm0KOvPzE/6LKJZM9WOjqV+l
        zsHl+09aMav82l4pWvM0XHdTjDf4vnwdJ3uGs9OlOyoLQcbqXiZY5y+H4aefVmncVMmhsN
        5Z0poOvQ3Wp1et6b9Nj7nvkC4ur9Mvw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-kZJkKOvmMoGOV3I1kGeUpg-1; Tue, 21 Dec 2021 13:58:29 -0500
X-MC-Unique: kZJkKOvmMoGOV3I1kGeUpg-1
Received: by mail-ed1-f71.google.com with SMTP id o20-20020a056402439400b003f83cf1e472so7018300edc.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 10:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ne1bsk1SsL8jAGhaeIKOOPxk9oTyHio8F6FuLYA3huk=;
        b=F7q+DjMDBl+SF8AZqfRiJEfX4EBjkUa0ajrNw1Q+Q4APAe539s1on+3JJymyWtkB8e
         qBnW2IGbbNJbXLyzoTDWR5QMNn+phxlvU2uaGNuouE5SkVvvdexGy2NgCYSVvj0o0ksJ
         7gBINPCDZn5gyqj/h1isRFERpM71M4ZBxURjJyLdSEeKEtBwyQjaj9TTP7nXqyTxC7gO
         Feq2rUgTwKKOp2UbRsEiqgMQ/yFpdIxqj6tOnHawCYR6yXIX+Zt2PLHhvu5h+H6d4eNL
         ESnJ6AMdVFvbMUrOAkfQGJblSo4mwVIm9TMnKerxkT0VMmxG0Gm+N3XL2hthNUd8ZyuS
         KxlQ==
X-Gm-Message-State: AOAM533boRDCa9gm5TOnAga1/iZ+7sLTppzv22x6eBBArJRtLZtPbM+0
        Fz50xcxRGOy49GQ6pQL8spNohWUaMhQNNoeRfkV92/SoHlyO7r1W314vQ2ligdZEuY88kza9OBN
        0Gtbt9WX8nSMvDvsyD5uMkGKVf5ObvotASQ==
X-Received: by 2002:a17:906:c788:: with SMTP id cw8mr3907743ejb.528.1640113108254;
        Tue, 21 Dec 2021 10:58:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyM+2Ujm6iRVsre7x1ccXdZfFfPAEcdwrQ85ZbrpeYpQ10KfmThfQ58+KKzov1uQrzvavN8OQ==
X-Received: by 2002:a17:906:c788:: with SMTP id cw8mr3907726ejb.528.1640113108040;
        Tue, 21 Dec 2021 10:58:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id ht14sm2957955ejc.64.2021.12.21.10.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 10:58:27 -0800 (PST)
Message-ID: <32e68787-66ec-1522-0fea-e11130a428b8@redhat.com>
Date:   Tue, 21 Dec 2021 19:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] platform/x86: Add x86-acpi-irq-helpers.h
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20211221151243.66216-1-hdegoede@redhat.com>
 <CAHp75VcCMeuSHkQT=azcEZeFxqU9_Na2yiXESEBvNqniyhtDvg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcCMeuSHkQT=azcEZeFxqU9_Na2yiXESEBvNqniyhtDvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/21/21 16:27, Andy Shevchenko wrote:
> On Tue, Dec 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add helper code to get Linux IRQ numbers given a description of the IRQ
>> source (either IOAPIC index, or GPIO chip name + pin-number).
>>
>> This is intended to be used to lookup Linux IRQ numbers in cases where the
>> ACPI description for a device somehow lacks this info. This is only meant
>> for use on x86 ACPI platforms.
>>
>> This code is big/complex enough to warrant sharing, but too small to live
>> in its own module, therefor x86_acpi_irq_helper_get() is defined as
>> a static inline helper function.
> 
> ...
> 
>> +/* For gpio_get_desc which is EXPORT_SYMBOL_GPL() */
> 
> gpio_get_desc()

Fixed in my local version.

> and honestly I don't like this kind of includes (yes,
> I know sometimes it's the best compromise).
> 
>> +#include "../../gpio/gpiolib.h"
> 
> ...
> 
>> +               /* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
>> +               chip = gpiochip_find(data->gpio_chip, x86_acpi_irq_helper_gpiochip_find);
>> +               if (!chip)
>> +                       return -EPROBE_DEFER;
>> +
>> +               gpiod = gpiochip_get_desc(chip, data->index);
>> +               if (IS_ERR(gpiod)) {
>> +                       ret = PTR_ERR(gpiod);
>> +                       pr_err("error %d getting GPIO %s %d\n", ret,
>> +                              data->gpio_chip, data->index);
>> +                       return ret;
>> +               }
>> +
>> +               irq = gpiod_to_irq(gpiod);
>> +               if (irq < 0) {
>> +                       pr_err("error %d getting IRQ %s %d\n", irq,
>> +                              data->gpio_chip, data->index);
>> +                       return irq;
>> +               }
>> +
>> +               irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
>> +               if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
>> +                       irq_set_irq_type(irq, irq_type);
>> +
>> +               return irq;
> 
> I'm wondering why it can't be a part of the GPIO ACPI library?

Interesting suggestion, but this really is only intended for the
special case when the DSDT is missing this info. I'm a bit worried
that having this available as a generic helper may lead to it
getting used too much. But I guess we can just put a comment on it
explaining that normally its use should be avoided.

I've added Mika to the Cc, Mika, what do you think about adding this
as a new helper to the GPIO ACPI library ?

Regards,

Hans




