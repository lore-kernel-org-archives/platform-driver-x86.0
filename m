Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53535C352A1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Nov 2022 10:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235147AbiK3Kf5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 05:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiK3Kf4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 05:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDFA4509A
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669804502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Cvc7zQE6RbA2ONv2qyzGEDJ/T9bPExPePrr7SYOkIKM=;
        b=BS4OvMMeWO9B912LgDapKlJouCZXOGmv1MwIY0ub0Zldh8qViX2qJkdTYslaZZkexMT9kq
        gBHvWDPw8SYSDGwZLPa9elephGOir0JoVh3lGS5y7e0DqYgQ8OG2PCn8k+wi6IPJk/feq9
        yUHqCNzI6i1JoQc/kmonEBzt2bN93Sw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-0OLdQaVnOqmBJrT1jxS5nA-1; Wed, 30 Nov 2022 05:35:01 -0500
X-MC-Unique: 0OLdQaVnOqmBJrT1jxS5nA-1
Received: by mail-ej1-f71.google.com with SMTP id sh37-20020a1709076ea500b007c09b177cd1so1445594ejc.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 02:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cvc7zQE6RbA2ONv2qyzGEDJ/T9bPExPePrr7SYOkIKM=;
        b=hv6nrJ8kH1NEoeidyy9a2SDfgIJsAvfHz3OIF6IBdWivuWfWXIR6xJmR5EBaM9GK25
         Kbg8yvN+bLMH9jh6OtMnRDleieAoTQf0q5jK7Aw3TYhawejqGiDh1Ilrv4WhzmFzcpnZ
         WWJwTQ1f0mL5JLiSJrIUpZ3pbHfkswLOWqCrGHSV2Bgl8Vpj/JMCAB2p83ur7er68y3E
         KwlEgoua2H9k6MAAwtrljxZnQzOSK6SlDpGlzy2DqWl042ZmeZpAR5Fek5qyF3MF0mSq
         vxN0qhbzw2Ptvc2AXAsIn3paJ3xVSXv2li87cmr9svibvvYQgZJA5tL95ic519+VTHeY
         Yxtg==
X-Gm-Message-State: ANoB5pm7Oq11qIiG8mo6BUNiC71ZPDiFtHJlTLRbWKcJnoUmxcN4w5UA
        gk5acB4UffGfEzgyd2a1id4V5qwqXs0VWBLobnhtY2r7X2Dx+KxzSj2o4i88YJN72FxQumxg1oB
        d2eDQrBu1JlBlObv8xq5FsWj4lUiMos9U5w==
X-Received: by 2002:aa7:dd4d:0:b0:45c:98a9:7bbf with SMTP id o13-20020aa7dd4d000000b0045c98a97bbfmr39326419edw.372.1669804499604;
        Wed, 30 Nov 2022 02:34:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59ssUHREjZsmQz9LJjiR983EFAnjxYQCIU0PCW65a3e4+hmwm1voA9Pp0gimhglc2Gac98Lg==
X-Received: by 2002:aa7:dd4d:0:b0:45c:98a9:7bbf with SMTP id o13-20020aa7dd4d000000b0045c98a97bbfmr39326401edw.372.1669804499345;
        Wed, 30 Nov 2022 02:34:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007ae4717bef1sm506303ejc.15.2022.11.30.02.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 02:34:58 -0800 (PST)
Message-ID: <f54e3235-b146-ed4d-4848-edfbeb97bbe6@redhat.com>
Date:   Wed, 30 Nov 2022 11:34:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/6] platform/x86: int3472/discrete: Treat privacy LED as
 regular GPIO
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-4-hdegoede@redhat.com>
 <CAHp75VfZ2Lk-AaQDazaUJARiHrGrMH46d5La7qwVTU8fkDiPAQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfZ2Lk-AaQDazaUJARiHrGrMH46d5La7qwVTU8fkDiPAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/30/22 10:54, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On some systems, e.g. the Lenovo ThinkPad X1 Yoga gen 7 and the ThinkPad
>> X1 Nano gen 2 there is no clock-enable pin, triggering the:
>> "No clk GPIO. The privacy LED won't work" warning and causing the privacy
>> LED to not work.
>>
>> Fix this by treating the privacy LED as a regular GPIO rather then
>> integrating it with the registered clock.
>>
>> Note this relies on the ov5693 driver change to support an (optional)
>> privacy-led GPIO to avoid the front cam privacy LED regressing on some
>> models.
> 
> ...
> 
>> -       case INT3472_GPIO_TYPE_PRIVACY_LED:
>> -               gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
>> -               if (IS_ERR(gpio))
>> -                       return (PTR_ERR(gpio));
>>
>> -               int3472->clock.led_gpio = gpio;
>> -               break;
> 
> I'm not sure how the previous patch makes this one work without
> regressions. We have a "privacy-led" GPIO name there and here it used
> to be with a prefix. Maybe I'm missing something...

The GPIO used to be controlled as part of the clk-provider,
and the "int3472,privacy-led" name was the name of the consumer
of the GPIO shown in /sys/kernel/debug/gpio. The "int3472,privacy-led"
name has no lookup meaning since the pin is directly looked up by
GPIO chip ACPI path + pin offset here.

Since not all devices with a privacy LED also have a clk-enable GPIO
and thus a clk provider this did not work anywhere.

So this patch removes the code which controls the privacy LED
through the clk-provider (which used the "int3472,privacy-led"
and instead now adds an entry to the GPIO lookup table attached
to the sensor. That new GPIO lookup table entry uses the name
"privacy-led" since the LED no now longer is controlled by
the INT3472 code (*).  The matching sensor driver patch
(patch 1/6) to make the sensor driver directly control the
privacy-led also uses "privacy-led" when calling gpiod_get()
for it.

I hope this helps explain.

Regards,

Hans


*) all the INT3472 code now does is add the lookup table entry
gpio lookup table 



