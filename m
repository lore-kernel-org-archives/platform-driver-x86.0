Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230BFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 15:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356147AbhKYPli (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 10:41:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51271 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234528AbhKYPjh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 10:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637854585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TtCB2GSB6fvEpPp2XAo0ayiv6a2jnAbDE1AtR+ngZyI=;
        b=ieve6waiVMB4a9haRfIvl0QdiaGT9JaSbIxPiPkTnVB1RxL5S/M7E+Ai9yCH/NnIA/3OCR
        oSk6eOb1nUKPHEWz/c/jgwjb99iB3N2/yDuwmix0R9dE2z3y1pd0apiZXs0X9CkIpH/a//
        hVWSHnDn+VeWSyb7KWJC+8n/HYGu8fg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-uDflDIifMPKW0BLra4Sfig-1; Thu, 25 Nov 2021 10:36:24 -0500
X-MC-Unique: uDflDIifMPKW0BLra4Sfig-1
Received: by mail-ed1-f69.google.com with SMTP id eg20-20020a056402289400b003eb56fcf6easo5725090edb.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 07:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TtCB2GSB6fvEpPp2XAo0ayiv6a2jnAbDE1AtR+ngZyI=;
        b=pdzTSs7jXlKzu4cDQw4Hnnrrhf6EnCaQ98romhJbC0LZEsp2BeqdXmaLlpGw7SLJ+Z
         YObvHvmXS0Nth0nBt4wAn5SDe4t4TMxYcvAJdUa/MoTe4es2sPVLR57NckbR07L1KP2Q
         PHVElTeZLaaarXqZhP8TOyatA4gyMd1qnkK5nEh0fNO3Wv9HL1xSvq1FHv7/Nbm9COnl
         cCXIEzDdbHj8/xj2IMi1hpsAqhrXXi3YjpJ0f9HThw4Dwppuhst22bX7Yr/Gy48Dawf/
         mBTY2kHa4FRq+te957tieMZvct0RKhDQiqqg2HYIBVb1mBBWxZn9mbEX3xjhKLr6OBFh
         H8Cw==
X-Gm-Message-State: AOAM5324DSF4/znbKm+DMn1Ekw3W8WhJH8ayWDZe4TgkOGZdwbS3W5g2
        8T2fJYK+FrcTX9P8rTRTt3qjQw18Rho7Z3yeDhQUbuLORpYTbZWB/DCx2I7a4xnV4R3sD6JU+Ov
        UhzElodaJDpVGTrGXGJ4rr5lgGqlIEPjsuA==
X-Received: by 2002:a05:6402:35ce:: with SMTP id z14mr38624736edc.197.1637854583144;
        Thu, 25 Nov 2021 07:36:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKaZQH3mEp86gkciV/Iy6yzpSITcVdSu1JUeMEhFg0Z14ZZRrgDYeN5NoiMXAjoAfElWHibg==
X-Received: by 2002:a05:6402:35ce:: with SMTP id z14mr38624693edc.197.1637854582886;
        Thu, 25 Nov 2021 07:36:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hb36sm1672248ejc.73.2021.11.25.07.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 07:36:22 -0800 (PST)
Message-ID: <673d9b69-9193-9ac6-3253-8c760edd7417@redhat.com>
Date:   Thu, 25 Nov 2021 16:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] lg-laptop: Recognize more models
Content-Language: en-US
To:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <c752b3b2-9718-bd9a-732d-e165aa8a1fca@svgalib.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c752b3b2-9718-bd9a-732d-e165aa8a1fca@svgalib.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/23/21 21:14, Matan Ziv-Av wrote:
> 
> LG uses 5 instead of 0 in the third digit (second digit after 2019) of the year string to indicate newer models in the same year. Handle this case as well.
> 
> Signed-off-by: Matan Ziv-Av <matan@svgalib.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/lg-laptop.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index ae9293024c77..a91847a551a7 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -657,6 +657,18 @@ static int acpi_add(struct acpi_device *device)
>      if (product && strlen(product) > 4)
>          switch (product[4]) {
>          case '5':
> +            if (strlen(product) > 5)
> +                switch (product[5]) {
> +                case 'N':
> +                    year = 2021;
> +                    break;
> +                case '0':
> +                    year = 2016;
> +                    break;
> +                default:
> +                    year = 2022;
> +                }
> +            break;
>          case '6':
>              year = 2016;
>              break;
> 
> 
> 

