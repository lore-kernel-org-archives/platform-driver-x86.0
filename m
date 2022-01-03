Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44441C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Jan 2022 11:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiACL27 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Jan 2022 06:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38063 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232983AbiACL26 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jan 2022 06:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641209338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MNOJdKxohrxmDAI9pv+DrzG+Tr0WcyqGMnmDpAZ0aug=;
        b=CcmYobM7rNwbW85ZmFrYaXSiXQ+QfZIM/hzidoZ9hKcX9IpR6XtqXxc2EPAd+/MPgkdCi1
        GYru0FugdEZcOfiFAg50KwMM2d9fYiKCdZSU6LG82HAc6fU7xYcfu6WrBvkxlFBTjp7liJ
        9skf8xGDyh5dM3ITKcEb4Snmja033qo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-pbsOFVUmPaKMbBIRngPFyg-1; Mon, 03 Jan 2022 06:28:57 -0500
X-MC-Unique: pbsOFVUmPaKMbBIRngPFyg-1
Received: by mail-ed1-f70.google.com with SMTP id o20-20020a056402439400b003f83cf1e472so22661888edc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jan 2022 03:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MNOJdKxohrxmDAI9pv+DrzG+Tr0WcyqGMnmDpAZ0aug=;
        b=4HiTi0dtY849ZDWzN+abMQ245QN1Y2hSgKS4Ic48Zqf6SvZg1DR2/tSOYENtU2xglv
         3q/L53ciEWggNYAjxhkpoR3F+Bd/fFq7GCU7iPw1FKrz1S86cxIsXDmH7sFgrhPuVbhm
         3qADhQgfFUFOgbNboq7tvpAaBrVds9yTzKOeyVNQ/rpsxTsLpF698ZQcPTSVQ/0qdLdN
         8X1HGNEh55tzuY/Ceb868FuPv69iX6XvL1lKdHDMo1CUABWIGV5NwM/Xd1A1DLivngWu
         yynGFmfwPQL8+iK1knG+7Xx5lI2fIVtHW4TlTUaqnO/QVrKqaQ1setq8W7SO5oN7/XJr
         lfXA==
X-Gm-Message-State: AOAM533dpWN5vhBZMskDIt6iQ66s5fC47QDGcFW8sKkp9mHmIF01kk6g
        PcCvHnVPMp0pSBhh31GGq1x0HdiZE2lh+HYRx2aCGzcTqWg3O2CSUs0nDMNrCeJS8IqnaSyLoCh
        l3wW8HqylTcm2bCw9a1bY7md7vgBJoU9YxQ==
X-Received: by 2002:a17:907:9488:: with SMTP id dm8mr35847870ejc.571.1641209335928;
        Mon, 03 Jan 2022 03:28:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJhJITkcLypPzjJMWQpjn+ydK1Pf4Jw8uDExg291QMmNpmH9+bZQhaG/NHShXMQXbICXsgpg==
X-Received: by 2002:a17:907:9488:: with SMTP id dm8mr35847854ejc.571.1641209335673;
        Mon, 03 Jan 2022 03:28:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b5sm131746edz.14.2022.01.03.03.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 03:28:55 -0800 (PST)
Message-ID: <d37376b6-dd95-6caa-73c4-dae8dd19247f@redhat.com>
Date:   Mon, 3 Jan 2022 12:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Correct min/max values
 for Chuwi Hi10 Pro (CWI529) tablet
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20211225120247.95380-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211225120247.95380-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 12/25/21 13:02, Hans de Goede wrote:
> The firmware distributed as part of the Windows and Android drivers uses
> significantly different min and max values for the x- and y-axis,
> compared to the EFI's embedded touchscreen firmware.
> 
> The difference is large enough that e.g. typing on an onscreen keyboard
> results in the wrong "keys" getting pressed.
> 
> Adjust the values to match those of the firmware distributed with the
> Windows and Android drivers (which is necessary for pen support) and
> put the EFI-fw version's min/max values in the new "silead,efi-fw-min-max"
> property. The silead driver will use these when it is using the
> EFI embedded firmware, so as to not regress functionality in that case.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/touchscreen_dmi.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 17dd54d4b783..92d274eb9dbe 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -124,13 +124,16 @@ static const struct ts_dmi_data chuwi_hi10_plus_data = {
>  	.properties     = chuwi_hi10_plus_props,
>  };
>  
> +static const u32 chuwi_hi10_pro_efi_min_max[] = { 8, 1911, 8, 1271 };
> +
>  static const struct property_entry chuwi_hi10_pro_props[] = {
> -	PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
> -	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
> -	PROPERTY_ENTRY_U32("touchscreen-size-x", 1912),
> -	PROPERTY_ENTRY_U32("touchscreen-size-y", 1272),
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 80),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 26),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1962),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1254),
>  	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>  	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
> +	PROPERTY_ENTRY_U32_ARRAY("silead,efi-fw-min-max", chuwi_hi10_pro_efi_min_max),
>  	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>  	PROPERTY_ENTRY_BOOL("silead,home-button"),
>  	{ }
> 

