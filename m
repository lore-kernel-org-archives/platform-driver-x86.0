Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F8CC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 15:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D222611B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 15:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354738AbhESPVv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 11:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21325 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354743AbhESPVr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 11:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621437620;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y93IWRhBwP44/lcgrro8LL6lNPSXFpHf2RCpb0mg+xA=;
        b=i6BjXrKL/JCP0+B/9JI3H/kk8a3x3z+dMgDEAe8tqf9jnleau2phW+JESP/PsdwLoAILg7
        T6fS+xw3mwxNsOTyxFr85OGSHg3UZjaeYkHpu05UT8eEf1HltqG/voBeRS2qkOv02jeg+t
        oDuG6PcSTWQsEqgVCPAkMlxguw8iA+g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-fhQAlx03OqSF86_nd1bUBQ-1; Wed, 19 May 2021 11:20:14 -0400
X-MC-Unique: fhQAlx03OqSF86_nd1bUBQ-1
Received: by mail-ed1-f71.google.com with SMTP id cy15-20020a0564021c8fb029038d26976787so6460571edb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 08:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y93IWRhBwP44/lcgrro8LL6lNPSXFpHf2RCpb0mg+xA=;
        b=l0/YpmKa908ibpYcqo/tytn8IpRwmFXWw09zB94jg7+1if9JGPxKgx3awLrMboIP6j
         e3ZTlq3i3WxHlsVhHvKAmn9rbOUbHgWBWde0ob6xnKJJpTV9Jt6h61zBoDKntEylMift
         LX+PAndUHLr5o2RAZZHr62oL8ZfY0y2E1IHAksfJRTHGf0sSkSgMwwB8HewqYDqCeovi
         m5we66V+Dkn8013dbPiAoCqakNXs1XV3AzcDBeY/5yqpXFNhMt7mRMhapAWOkKVZXO9r
         xhrvPA3dAtu9nG+HhBMmQImE087Cg/ckz2xucZ1RRGXSWZdoH+hXFo9edWQKaZ+Lnabm
         hYGw==
X-Gm-Message-State: AOAM531MuCSk3ec+prv57pIyr42IiTNhitqS8qwZtSVIWK8eXVEXmi4S
        2LWiAvkU2L9naWjvSwVby9x+BUoYHmloDJ2YwMp0lBo1JwGZkbUKjuH+DMW6M4ueATD34R5aGvg
        F6dcDXe48gQoPOgPDKdvpQRSJ7g5A4WoFnw==
X-Received: by 2002:a17:907:781a:: with SMTP id la26mr13172865ejc.435.1621437613772;
        Wed, 19 May 2021 08:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQdT9Vi79t817uASNBRH2GEzjjkHRfBbiYCHaGp6pd7vRMck5GNhzf70pambZQq4h8Mxy49g==
X-Received: by 2002:a17:907:781a:: with SMTP id la26mr13172847ejc.435.1621437613617;
        Wed, 19 May 2021 08:20:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bw26sm12834760ejb.119.2021.05.19.08.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 08:20:13 -0700 (PDT)
Subject: Re: [RFC v2 5/5] platform/x86: touchscreen_dmi: Add info for the
 Mediacom Winpad 7.0 W700 tablet
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Teava Radu <rateava@gmail.com>
References: <20210504185746.175461-1-hdegoede@redhat.com>
 <20210504185746.175461-6-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <387369c5-ea35-c7a8-c0e0-cd52e706e187@redhat.com>
Date:   Wed, 19 May 2021 17:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210504185746.175461-6-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/4/21 8:57 PM, Hans de Goede wrote:
> From: Teava Radu <rateava@gmail.com>
> 
> Add touchscreen info for the Mediacom Winpad 7.0 W700 tablet.
> Tested on 5.11 hirsute.
> Note: it's hw clone to Wintron surftab 7.
> 
> Signed-off-by: Teava Radu <rateava@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm going to prepare an immutable branch for patches 1-4 of this series
(with patch 2 dropped since I haven't gotten any testing feedback for it).

Since this is an unrelated touchscreen quirk and I want to send it out in the
next pdx86-fixes pullreq for 5.13, I've added this to the pdx86 review-hans
and fixes branches now.

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index f63d2110e224..40c970908a99 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1153,6 +1153,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "jumperx.T87.KFBNEEA"),
>  		},
>  	},
> +	{
> +		/* Mediacom WinPad 7.0 W700 (same hw as Wintron surftab 7") */
> +		.driver_data = (void *)&trekstor_surftab_wintron70_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MEDIACOM"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "WinPad 7 W10 - WPW700"),
> +		},
> +	},
>  	{
>  		/* Mediacom Flexbook Edge 11 (same hw as TS Primebook C11) */
>  		.driver_data = (void *)&trekstor_primebook_c11_data,
> 

