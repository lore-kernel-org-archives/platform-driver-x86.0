Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60789C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Dec 2021 17:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349472AbhLWR0J (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Dec 2021 12:26:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32641 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233445AbhLWR0I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Dec 2021 12:26:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640280368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D6DKkgDTDhxYtT7SE1MZ2gU4Qw7DNSyzKlW+Sc2CEo0=;
        b=HVcy/iF84JrXFPV7ibFdcP8Jt+aQHF6mbh7MkEebGXjYrup9xnz6nqyPUCeQMGnRU39TGE
        1xfuuJjVQA2/v9nQvMa9+oArwky2HXx+toL6e/oFRVJbRXUfPoEdWZt4duAYEO7pCDkbaT
        L21/dECpA8sjOH83U9hgOXQSvUfUrUE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-zSHmx1DoN1GkQz-HRRRyPQ-1; Thu, 23 Dec 2021 12:26:06 -0500
X-MC-Unique: zSHmx1DoN1GkQz-HRRRyPQ-1
Received: by mail-ed1-f69.google.com with SMTP id t1-20020a056402524100b003f8500f6e35so4996766edd.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Dec 2021 09:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D6DKkgDTDhxYtT7SE1MZ2gU4Qw7DNSyzKlW+Sc2CEo0=;
        b=5vbPAB36zzn1ucNioEjgOOBBgzwlehHxZI0lCrI0ChchUupmKSwOcV2NX/61snDblf
         a8bHnQBnzhzY7e4PVcIaJijmVTD+E1fPb1LOsF2UxnfgldxYnWU45Pb71HkU2DKC9ZqC
         /eOmbSCxMtsJSEpEJtJyhATRYeuh+sNjELgJLa/CahZQFdcn2wbPnYHAtjT0R8j+z2qD
         UJLcWc4fB29ggUHSPhCvQ3DzKBhg0W8KrlwwNDwgzwkW8LdGfpLfSoCcdc+CT4aAf1K4
         1u0nj8a8nRYJCI+bTEKN5VokqhZkbVnUXQ+Yomu7V1QLQ2R0DxneOUTqIpGvLqEQb66m
         Vacw==
X-Gm-Message-State: AOAM531cS+lLbs/yyKN6CaB7dNYFHV98jEuLRsl/ZTt4R0UopD1l+D0k
        Lzd/8phYGvMkW+ndYejp3vIbhm5yKlyxhS/wbYQ1esrx1cb/2NYGjpasegmYVn6bjtuBqB3qWf+
        WQlJIMVcfkClMZ8ldo91aOpAraPwPGtBo/g==
X-Received: by 2002:a05:6402:4389:: with SMTP id o9mr2846383edc.348.1640280365728;
        Thu, 23 Dec 2021 09:26:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwntV11rt4+lhlGdS8MxSVHoWS+d9FKrsZW5VbZIavL9hRy3z6+qAQUEGXAK9r+I3+Y/BWoAw==
X-Received: by 2002:a05:6402:4389:: with SMTP id o9mr2846366edc.348.1640280365561;
        Thu, 23 Dec 2021 09:26:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c20sm739730ede.12.2021.12.23.09.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 09:26:05 -0800 (PST)
Message-ID: <499f6c66-8f6d-6b25-e941-f14f729257d7@redhat.com>
Date:   Thu, 23 Dec 2021 18:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] platform/x86: Add x86-acpi-irq-helpers.h
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20211221151243.66216-1-hdegoede@redhat.com>
 <CAHp75VcCMeuSHkQT=azcEZeFxqU9_Na2yiXESEBvNqniyhtDvg@mail.gmail.com>
 <32e68787-66ec-1522-0fea-e11130a428b8@redhat.com> <YcMd7dn+RCVrKOlj@lahna>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YcMd7dn+RCVrKOlj@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/22/21 13:45, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Dec 21, 2021 at 07:58:26PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 12/21/21 16:27, Andy Shevchenko wrote:
>>> On Tue, Dec 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Add helper code to get Linux IRQ numbers given a description of the IRQ
>>>> source (either IOAPIC index, or GPIO chip name + pin-number).
>>>>
>>>> This is intended to be used to lookup Linux IRQ numbers in cases where the
>>>> ACPI description for a device somehow lacks this info. This is only meant
>>>> for use on x86 ACPI platforms.
>>>>
>>>> This code is big/complex enough to warrant sharing, but too small to live
>>>> in its own module, therefor x86_acpi_irq_helper_get() is defined as
>>>> a static inline helper function.
>>>
>>> ...
>>>
>>>> +/* For gpio_get_desc which is EXPORT_SYMBOL_GPL() */
>>>
>>> gpio_get_desc()
>>
>> Fixed in my local version.
>>
>>> and honestly I don't like this kind of includes (yes,
>>> I know sometimes it's the best compromise).
>>>
>>>> +#include "../../gpio/gpiolib.h"
>>>
>>> ...
>>>
>>>> +               /* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
>>>> +               chip = gpiochip_find(data->gpio_chip, x86_acpi_irq_helper_gpiochip_find);
>>>> +               if (!chip)
>>>> +                       return -EPROBE_DEFER;
>>>> +
>>>> +               gpiod = gpiochip_get_desc(chip, data->index);
>>>> +               if (IS_ERR(gpiod)) {
>>>> +                       ret = PTR_ERR(gpiod);
>>>> +                       pr_err("error %d getting GPIO %s %d\n", ret,
>>>> +                              data->gpio_chip, data->index);
>>>> +                       return ret;
>>>> +               }
>>>> +
>>>> +               irq = gpiod_to_irq(gpiod);
>>>> +               if (irq < 0) {
>>>> +                       pr_err("error %d getting IRQ %s %d\n", irq,
>>>> +                              data->gpio_chip, data->index);
>>>> +                       return irq;
>>>> +               }
>>>> +
>>>> +               irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
>>>> +               if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
>>>> +                       irq_set_irq_type(irq, irq_type);
>>>> +
>>>> +               return irq;
>>>
>>> I'm wondering why it can't be a part of the GPIO ACPI library?
>>
>> Interesting suggestion, but this really is only intended for the
>> special case when the DSDT is missing this info. I'm a bit worried
>> that having this available as a generic helper may lead to it
>> getting used too much. But I guess we can just put a comment on it
>> explaining that normally its use should be avoided.
>>
>> I've added Mika to the Cc, Mika, what do you think about adding this
>> as a new helper to the GPIO ACPI library ?
> 
> Preferably no :-) Reason is that even if we add comment to the function
> you don't remember it after two weeks so the next patch adding another
> user will not be noticed by reviewers (unless tha name of the function
> clearly says it is a quirk/workaround).

Right, I also just found another, better way of dealing with the second
use-case for these helpers, which leaves only the upcoming
x86-android-tablets kernel module as user. So for version 3 of that module
I'm just going to fold these back into that module, since now that will
be the only user of this kludge.

Turning this into a separate helper did result in a nice cleanup, so I'm
going to keep things as is but just put them back into x86-android-tablets.c
keeping them as is will also make it easier to factor them out again
if that ever becomes necessary.

Regards,

Hans

