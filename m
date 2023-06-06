Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630E1C77B73
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jun 2023 13:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbjFFNPY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238351AbjFFNO7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2023 09:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89945F3
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jun 2023 06:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686057246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OhakQxI0/+wVOifMvRrCQ2C86ieS9Fk42SAnLKoOJS0=;
        b=eBfWWgnFQbr5XMc/wp4TXO3yrDAcloLmCchpRTeBZZrRI6xwABlSUgcViELwCleC1HZU8D
        wGa/UFDhV38a2R0umNabW9A5jMHGaiYtK7fPThBK/WPboY1NHWJdfbQXlda8hGZuzqk6AT
        Y+K5MxdAAUbtLLV8UXT354eTPaQpE6Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-tbRj68WBMpqntXe_7A_gPQ-1; Tue, 06 Jun 2023 09:13:56 -0400
X-MC-Unique: tbRj68WBMpqntXe_7A_gPQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5128dcbdfc1so3871463a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2023 06:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057230; x=1688649230;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhakQxI0/+wVOifMvRrCQ2C86ieS9Fk42SAnLKoOJS0=;
        b=ZTGgvgOeBPjeM4ISygJUj0FTFE1Ek2SdbEksGEBH8XElIpkCa8jlEJPwm4oqlbNu/m
         nkJKx6EbZp0Xs5NA0rvi5R412qhb8oIk2qH1zLvwXr5jul1u9eQ4mh0NO848mdGtOy+I
         8TpBzKaYGK9Y0tD64XTuhRyEi/bQmfqhQDmx60JBTiWQxjdkLrtoIVj4uagk4KhzWM51
         Tc+37pk6PuFHHYt8weHYO/S7mmxOCSn4q86Ooz4c+Agh8+FELOdHMIcU8hbEGnh8E9kx
         tZ9m12DkycThyRDxUHi4H+Q4gO0dYoLdcqYv5u8FGK9AqYtEsF14+xQKpJGT4t5Kk2Y2
         /lng==
X-Gm-Message-State: AC+VfDwD6N0UTWE7XSSM1vxYxyriEWE8v8xKJpmGPmmQEeRNjz5Vttd4
        OYHhEGF1SJ+pbYrjFpFq0kFaVGIQncBDw6l7yIGECbT6pHBKo1qDzqRwoReG8Aj4d7qi41VELIV
        BECBVvtV1NtsS77nmOTMYrdiVprHJR0cV5Q==
X-Received: by 2002:aa7:d450:0:b0:50d:dba8:c64a with SMTP id q16-20020aa7d450000000b0050ddba8c64amr1709368edr.18.1686057230481;
        Tue, 06 Jun 2023 06:13:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7McBg9VQUYWeSOZVbIWOPZyxGdNTYK1Q3mZYZhEhdxxefi8b52zqqxYqTGnusqSnJN5VChgg==
X-Received: by 2002:aa7:d450:0:b0:50d:dba8:c64a with SMTP id q16-20020aa7d450000000b0050ddba8c64amr1709341edr.18.1686057230158;
        Tue, 06 Jun 2023 06:13:50 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.131.166])
        by smtp.gmail.com with ESMTPSA id n14-20020a056402514e00b0051495ce23absm5123394edd.10.2023.06.06.06.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:13:49 -0700 (PDT)
Message-ID: <5d38e467-d3f9-1d7b-84e7-e107e048cb01@redhat.com>
Date:   Tue, 6 Jun 2023 15:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
References: <20230531134429.171337-1-hdegoede@redhat.com>
 <CAHp75VfZN5M8LiP3nw0NT5p3WyJJJJm6w2OZKgm28b6aokzopQ@mail.gmail.com>
 <b1cdf8b7-ae9b-a86d-5298-bd0cfa70f9cb@redhat.com>
 <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/6/23 13:26, Andy Shevchenko wrote:
> On Tue, Jun 6, 2023 at 12:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/31/23 19:56, Andy Shevchenko wrote:
>>> On Wed, May 31, 2023 at 4:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +       if (clk->ena_gpio)
>>>> +               gpiod_set_value_cansleep(clk->ena_gpio, 1);
>>>> +       else
>>>> +               skl_int3472_enable_clk_acpi_method(clk, 1);
>>>
>>> Looking at this, can we avoid duplicative validation of the GPIO?
>>> Perhaps skl_int3472_enable_clk_acpi_method() can have embedded another
>>> check so they won't be called together?
>>>
>>> ...
>>>
>>>> +       if (clk->ena_gpio)
>>>> +               gpiod_set_value_cansleep(clk->ena_gpio, 0);
>>>> +       else
>>>> +               skl_int3472_enable_clk_acpi_method(clk, 0);
>>>
>>> Ditto.
>>
>> Ack, I've squashed a fix for this into this patch while merging it into
>> my review-hans branch.
> 
> Now you have two different checks for the same, I would suggest that
> you switch to check clk->cl in the skl_int3472_enable_clk()
> as it's done in the skl_int3472_register_dsm_clock() instead of GPIO.
> Other way around is also possible but it seems to me that checking for
> clock existence has better guarantees than just checking for GPIO
> availability.

Hmm, you mean the:

        if (int3472->clock.cl)
                return 0; /* A GPIO controlled clk has already been registered */

Check in skl_int3472_register_dsm_clock() ? That matches with / aligns with
this check:

        if (int3472->clock.cl)
                return -EBUSY;

in skl_int3472_register_gpio_clock().

To me it seems sensible to align the checks for "a clk has already been
registered" up this way.

Regards,

Hans




