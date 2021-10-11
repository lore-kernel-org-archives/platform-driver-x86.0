Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E82C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 14:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4FB361056
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 14:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242324AbhJKOKT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 10:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31173 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237686AbhJKOIL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 10:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633961170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ussR32xFKF2ITlAEAPR/6vAziEgzw+wzIh8gegh7UIU=;
        b=J5zvwwA7ljEdLeyfEACWeipfo9AfaT5fUNKZnDYXLc180j0MfFwos2crtSZUU7YXrGv3hC
        BqlN4z2WKVjjmXrJCTVc6Yw8/bICdKnqn3u/jhAI1lEXCKkUQGUXVfAlpU4kdKgeO3+WOi
        yV6Slv2EEVGK0sp1DpcjZpYi5FW1kT8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-yOds9ao3Msq5Adm2IIP1jg-1; Mon, 11 Oct 2021 10:06:09 -0400
X-MC-Unique: yOds9ao3Msq5Adm2IIP1jg-1
Received: by mail-ed1-f72.google.com with SMTP id i7-20020a50d747000000b003db0225d219so16068431edj.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 07:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ussR32xFKF2ITlAEAPR/6vAziEgzw+wzIh8gegh7UIU=;
        b=rq3ucg6bJ4EiAKx2qE4O+icasrMdr1zSOPYbbiaYnHx8d/wgJwrJgRmt/9nVBYXORS
         w8ayqoaDD3Z4lV25QxhUAlHggaIDwZtepsuLDZEHbVznafsV9cYVwkZ2wMp/L6VIdFZv
         BMHRCbgqFkmcSgZOpnoMiijTwvTqiy0VMyH9f0ffa6JeKVQhkjyycFcBAo9mAXrIo2QJ
         qpt3zWMwrociPN6F5G3iE6OjWhv/nv5I16/1Vb+ZX+OtP0H/i6pozYoE4fkBWsPQy5tP
         M5E0ozHPo4pwydC8Av3b33O52cY//5kbQ3SUOjxPTFwyCBfRT1UfjIGQDNDqHrTjIPM3
         m1mA==
X-Gm-Message-State: AOAM533dxsv8xgiJqCJL7S7jJzL3t5284CFx9U1sjpfjKqyB5G0P7uIu
        drVBmfqsr+0RnyYkPs+Buvs9eiP/1V0aWpB3EY8KsFxU954CMhHqqp3IMlyFQzWk7lD7MQvqSFz
        kLra33PWorvp8zJH7PGyR754AaMiPFkVp2w==
X-Received: by 2002:a17:906:7810:: with SMTP id u16mr25044488ejm.516.1633961168153;
        Mon, 11 Oct 2021 07:06:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNTqHf2qe1Ej7MK+KyTbhae7cu45v+Gs+KYWTyABa+jFKGSDe5qnwRm+ilHWu2oXO+ScL+kg==
X-Received: by 2002:a17:906:7810:: with SMTP id u16mr25044470ejm.516.1633961168012;
        Mon, 11 Oct 2021 07:06:08 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id j3sm3546884ejy.65.2021.10.11.07.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 07:06:07 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: gigabyte-wmi: add support for B550 AORUS
 ELITE AX V2
To:     "Zephaniah E. Loss-Cutler-Hull" <zephaniah@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20211005044855.1429724-1-zephaniah@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d9c3df7a-03e9-2cd6-6c62-dca1e8e13b6f@redhat.com>
Date:   Mon, 11 Oct 2021 16:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211005044855.1429724-1-zephaniah@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/5/21 6:48 AM, Zephaniah E. Loss-Cutler-Hull wrote:
> This works just fine on my system.
> 
> Signed-off-by: Zephaniah E. Loss-Cutler-Hull <zephaniah@gmail.com>
> Cc: <stable@vger.kernel.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

I will also include this in my upcoming pdx86-fixes pull-req for 5.15 .

Regards,

Hans

> ---
>  drivers/platform/x86/gigabyte-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
> index d53634c8a6e0..658bab4b7964 100644
> --- a/drivers/platform/x86/gigabyte-wmi.c
> +++ b/drivers/platform/x86/gigabyte-wmi.c
> @@ -141,6 +141,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
>  
>  static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
> +	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE AX V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE V2"),
>  	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 GAMING X V2"),
> 

