Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C57C4321E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Nov 2022 11:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbiK2LeH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Nov 2022 06:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbiK2Ldl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Nov 2022 06:33:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C452B65C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 03:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669721558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/d4T5zjZ2/xv0d6C4B2qXDDWBIIfOQ90oEadaEWlU8I=;
        b=YlEG2XmjdYNw3Ykqpdg++1xUz+mhdmYmqolvPzAhPPyTQ1KpzLIy7lpnvQMGQDfOrcev5g
        CkIuvyW/FCQucoyi0Fg6aLYLXH1OQVLPApVQR2B/uk23oIp+fuo+xcGIh91DrVdef5RdeQ
        CNamCw3Lp0l8wSyCBqq+EUFOSVbE/60=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-0h2dDkXGOru6FivYI44Enw-1; Tue, 29 Nov 2022 06:32:36 -0500
X-MC-Unique: 0h2dDkXGOru6FivYI44Enw-1
Received: by mail-ej1-f70.google.com with SMTP id jg27-20020a170907971b00b007ad9892f5f6so6290569ejc.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 03:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/d4T5zjZ2/xv0d6C4B2qXDDWBIIfOQ90oEadaEWlU8I=;
        b=2F+IL9GS4TD9eaMCgxoGyNttzYFD3hYFNsvO+QUrypVWPpveIpL9zNvPTP3JIklcZX
         vOpIPlJ8EBeDdwebwq6hXZJs33YkSB1fFzGdKBORdjYA5qllf0sVBJY+9gAwH3ngEzA2
         Ao4aQz9wq/1PofAm+2MieClHXeJiKHNiv5rVKScDaNB//xDcMBOslngd2r366DBoXits
         pTKP6ruSDnLLyxbUJzzPIZVsZydVpmvQalZkOBoc04Xp4jBL8Wp/t20+advCtcoz43xg
         zm7LsCUOPhktM/d6RPKqHTDwh1MtZR33ryxHgHMa2ga6TvUI58GBwCKJzzgCcNHTRaJO
         p9QQ==
X-Gm-Message-State: ANoB5pnO15BU6ez/83++7d7zaPqIcQDuZYwWyr7boFZ1ztsbBpFeCvjA
        EtlkwsFprrw03yuM2bzj+1ZbYnl6Ydj5MgcmqzpAWeP18P5GUitNf8L75l5adlODZO3uWD/YbLz
        l+42yQHWLqLaCIzEldfsBxZPKrj/Ld+P6Qg==
X-Received: by 2002:aa7:c788:0:b0:458:b9f9:9fba with SMTP id n8-20020aa7c788000000b00458b9f99fbamr35342085eds.305.1669721555244;
        Tue, 29 Nov 2022 03:32:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf47O6/boMZ9eapNP4eorwpxZfjoAbJB/XrVKiwje3UMF6/g6R0k8vp0N7qnRMo1p06c2veGNg==
X-Received: by 2002:aa7:c788:0:b0:458:b9f9:9fba with SMTP id n8-20020aa7c788000000b00458b9f99fbamr35342077eds.305.1669721555084;
        Tue, 29 Nov 2022 03:32:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d26-20020a170906305a00b007415f8ffcbbsm6096378ejd.98.2022.11.29.03.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 03:32:34 -0800 (PST)
Message-ID: <007a6345-62e7-20ee-1a48-4adb4a9fa9df@redhat.com>
Date:   Tue, 29 Nov 2022 12:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] gpio: tps68470: Add support for the indicator LED
 outputs
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-4-hdegoede@redhat.com>
 <CAHp75VcJJtYsxbAYt2FjqSEJGhjpok7Dsh3vp46VyOm3=5_2FQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcJJtYsxbAYt2FjqSEJGhjpok7Dsh3vp46VyOm3=5_2FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

Thank you for the reviews.

On 11/29/22 11:28, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The tps68470 has support for 2 indicator LED outputs called
>> ileda and iledb, at support for these as GPIO pins 10 + 11.
> 
> add ?

This models ileda and iledb outputs *as* GPIO pins 10 + 11
on the linux gpiochip.

But yes it also adds gpio pins 10 + 11 to the gpiochip, so
either one works I guess :)

> 
> ...
> 
>> +static void tps68470_gpio_get_reg_and_mask(bool get, unsigned int offset,
>> +                                          unsigned int *reg, int *mask)
> 
> Hmm... Usual way is to put the get/set flag at the end of the list of
> parameters.

For functions returning values by reference I always follow the
pattern of input parameters first, then output parameters.

> Also why not naming it as 'dir' to avoid confusion with the _get in
> the function name?

Because dir is meaningless without an enum to to define what a dir
of 0/false means. Where as get is clear without such an enum.
get is set to true when this function is called from
tps68470_gpio_get() and false when it is called from
tps68470_gpio_set(). It does not get more straight forward then that.

Regards,

Hans




> 
>> +{
>> +       if (offset < TPS68470_N_REGULAR_GPIO) {
>> +               if (get)
>> +                       *reg = TPS68470_REG_GPDI;
>> +               else
>> +                       *reg = TPS68470_REG_GPDO;
>> +               *mask = BIT(offset);
>> +       } else if (offset < (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT)) {
>> +               *reg = TPS68470_REG_SGPO;
>> +               *mask = BIT(offset - TPS68470_N_REGULAR_GPIO);
>> +       } else {
>> +               *reg = TPS68470_REG_ILEDCTL;
>> +               if (offset == (TPS68470_N_REGULAR_GPIO + TPS68470_N_LOGIC_OUTPUT))
>> +                       *mask = TPS68470_ILEDCTL_ENA;
>> +               else
>> +                       *mask = TPS68470_ILEDCTL_ENB;
>> +       }
>> +}
> 

