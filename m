Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B36EEE4993
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 11:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjHULN2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 07:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjHULN2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 07:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C50E7
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 04:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692616365;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0FM+nPzNu/yEWAl6wuIpYfXnc4jdFmf2PdKEfwiQVak=;
        b=IZPAWr9ctZyaGIRRUiT2WBA7YdGCgqucgvCYGCHvpSADFOTQqCEvuZ1bHKXplxEpS0Pq4+
        I/HcomMJ6GjB6Voc8oAVB4JplZdmu0R64ZZkyi3W8yw3mhh1z5yP0037928J2/maKOmQD9
        FJ0PZV8Qb3OQlM9NyXpgnwseZYB5Pew=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-_rARIAH-ONiG_q-eBdyMbg-1; Mon, 21 Aug 2023 07:12:44 -0400
X-MC-Unique: _rARIAH-ONiG_q-eBdyMbg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bebfada8cso213484966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 04:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692616362; x=1693221162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FM+nPzNu/yEWAl6wuIpYfXnc4jdFmf2PdKEfwiQVak=;
        b=EQSukwrSRHgDj4RReP8NbbFecLyU7Al3QbEG/IW4zUU1pWUhgEcBjJQBS29sSx2epl
         J4a5rVI9xm2AhXC2G9nGcoZU38nCo5yjF9MoHuAemfLfPZsfjR1uc1TXv8FIXCByO+xN
         QDViaxAQbePNO7Y17PUv5PQdqsrabg+ysh9cBR6gzGuBOQ0imGdKd1XWlNACkyK3yeSJ
         J/4FuKf0QhxIF4YQiHb3+mvLsaIPqg3M56IVSPR4FLUdLUJ8pKlgKY5LjJ1uW3DwQYC1
         0GJkINpZ/yccNICT/h4qXrnpNZEAPD+L0ONJ0A9Xk4UNp4xvPdCrkqDyGrkNjgX64hkA
         6h/w==
X-Gm-Message-State: AOJu0YzJ4n7u3I23lkKYAtyqOFJEfH1fv52oWZnBOcgyIB91Nzb9/WrL
        7iv6p8y3bInTBxKifIc5PLvNlxRwyfBF8p1f9HQBMdCLdbIJJ+eXAZFtAZQXZrA3pPjT20eikDS
        hLAiKrmwpjrRAQKjIdI0VXldT4Ff9TMUJvVNnbJ7wIw==
X-Received: by 2002:a17:907:7619:b0:99e:215:5365 with SMTP id jx25-20020a170907761900b0099e02155365mr4918306ejc.61.1692616362762;
        Mon, 21 Aug 2023 04:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx+QBsUabQVxxeeM9Nr4z2mjKlZkqGoohkG4klxm7VcMl9pS5boEVg0uC9uLo0R61WmLh6sw==
X-Received: by 2002:a17:907:7619:b0:99e:215:5365 with SMTP id jx25-20020a170907761900b0099e02155365mr4918293ejc.61.1692616362438;
        Mon, 21 Aug 2023 04:12:42 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id t3-20020a170906a10300b00993860a6d37sm6330547ejy.40.2023.08.21.04.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 04:12:41 -0700 (PDT)
Message-ID: <7e2830cf-0219-ed88-d717-c11519723d77@redhat.com>
Date:   Mon, 21 Aug 2023 13:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1 V3] platform/x86: lenovo-ymc: Add Lenovo Yoga 7 14ACN6
 to ec_trigger_quirk_dmi_table
Content-Language: en-US
To:     Swapnil Devesh <me@sidevesh.com>,
        Platform driver x86 <platform-driver-x86@vger.kernel.org>
Cc:     soyer <soyer@irl.hu>
References: <18a08a8b173.895ef3b250414.1213194126082324071@sidevesh.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <18a08a8b173.895ef3b250414.1213194126082324071@sidevesh.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/23 14:39, Swapnil Devesh wrote:
> This adds my laptop Lenovo Yoga 7 14ACN6, with Product Name: 82N7 (from `dmidecode -t1 | grep "Product Name"`) to the ec_trigger_quirk_dmi_table, have tested that this is required for the YMC driver to work correctly on this model.
> 
> V3: Updated the subject to mention the driver being updated
> V2:  Sent again from the mail that is signing off on this and the previous push had the tabs removed messing up the formatting of the patch.
> 
> Thanks to Gergo, the author of the Lenovo YMC driver for guiding this.
> 
> Signed-off-by: Swapnil Devesh <me@sidevesh.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
> drivers/platform/x86/lenovo-ymc.c | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
> index 41676188b373..7d38151a5b27 100644
> --- a/drivers/platform/x86/lenovo-ymc.c
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -32,6 +32,13 @@ static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
>             DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
>         },
>     },
> +    {
> +        /* Lenovo Yoga 7 14ACN6 */
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
> +        },
> +    },
>     { }
> };
> 

