Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64333C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 11:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237928AbiAKLBD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 06:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49135 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235439AbiAKLBC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 06:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641898862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kIK5nVjJ2vQi6tifrNqLLtdq4X64gcBvU0nnakHAM/c=;
        b=LTIvqmfbzSa6bQo3A8xqR8QpXckAqjLn3C2P7VljY4tXPgRYVBf8VgDdgFpbpi0vVGYeCz
        5Bu7u3NOQx5H7bMtRnv9zy4IjWIZDyGpCojP+UVPHnvyccCZNHvehUXpAVBrETXT/Nwu9f
        kjhO5S68l88tekeZtOIHeBYPGdlZ0yQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-XnFKh5AYMF6APSZam3rvHA-1; Tue, 11 Jan 2022 06:01:00 -0500
X-MC-Unique: XnFKh5AYMF6APSZam3rvHA-1
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso316383edw.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 03:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kIK5nVjJ2vQi6tifrNqLLtdq4X64gcBvU0nnakHAM/c=;
        b=x33E5fiomTTQIn6YfkTN55FpG3NFXzc0iEk5+CS2hlcR6S191iZaozVrYlz0ZJjf//
         HroULZJ+syRNDiPq7n9bLVcv3lMuqJ6q1602XOHAFIIWUsLQqh4cZAozmQWXjNTKOmNH
         DYfzoIm3ICZ81WGvEoh0erkRJ6ZVoKPVARWUrJ7jmm5+lm9MK+Z2hJtHDW0O2U+nYYkp
         KENbdRxMGikd8DqBtgRIWCENc1sbwm0Zxcfwito/96FWQHajcpO/rFDncID4Ywz5naSY
         SjGxMrYglogukcuFbLwDoXEPx31P9ujNTaEZFMZj3G/DypfQGzTRqSXjotEjoNwkTWbL
         MNKA==
X-Gm-Message-State: AOAM532GyknIkSaCybNBWkIOf/NVi003pPOTKD5ZSSdB4lovuJG+AVqR
        WhRZ80RXhoQv4+IzTGlJkOwkEi//d3wKmHjoS5uybZv48ovEh2GN8ZZALwFe5qVoNcYZMS84cbd
        bGZ7wi6aQ2YokCDSvwZh3zW6wRfZbTn9iBA==
X-Received: by 2002:a17:906:86c4:: with SMTP id j4mr3236596ejy.753.1641898859494;
        Tue, 11 Jan 2022 03:00:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypwmD27eJi/pXsJMeDq0LT+DoP9nLW9+yEk6c+dLdlIO9fODwWvJGZwT1lFGDdwTTMa+sK7A==
X-Received: by 2002:a17:906:86c4:: with SMTP id j4mr3236588ejy.753.1641898859335;
        Tue, 11 Jan 2022 03:00:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id l18sm3478646ejf.7.2022.01.11.03.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 03:00:59 -0800 (PST)
Message-ID: <54656fd1-3912-a6e6-5c66-12744073ab10@redhat.com>
Date:   Tue, 11 Jan 2022 12:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the RWC
 NANOTE P8 AY07J 2-in-1
Content-Language: en-US
To:     yuk7 <yukx00@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220104081920.1794275-1-yukx00@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220104081920.1794275-1-yukx00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/4/22 09:19, yuk7 wrote:
> Add touchscreen info for RWC NANOTE P8 (AY07J) 2-in-1.
> 
> Signed-off-by: yuk7 <yukx00@gmail.com>

Thank you for your patch.

I'm afraid that the kernel rules do not allow accepting patches submitted
under a nickname.

Given that this patch is mostly data, not code, I can set
myself as author, crediting you like this:

Reported-and-tested-by: yuk7 <yukx00@gmail.com>

And then merge it with me as the author, or you can resubmit
it using "realname - real-last-name" in the author and
signed-off-by fields (using the yukx00@gmail.com email address
is fine).

Please let me know how you want to proceed with this.

Regards,

Hans



> ---
>  drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 17dd54d4b..e318b4094 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -773,6 +773,21 @@ static const struct ts_dmi_data predia_basic_data = {
>  	.properties	= predia_basic_props,
>  };
>  
> +static const struct property_entry rwc_nanote_p8_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 46),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rwc-nanote-p8.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data rwc_nanote_p8_data = {
> +	.acpi_name = "MSSL1680:00",
> +	.properties = rwc_nanote_p8_props,
> +};
> +
>  static const struct property_entry schneider_sct101ctm_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> @@ -1406,6 +1421,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>  		},
>  	},
> +	{
> +		/* RWC NANOTE P8 */
> +		.driver_data = (void *)&rwc_nanote_p8_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Default string"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "AY07J"),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "0001")
> +		},
> +	},
>  	{
>  		/* Schneider SCT101CTM */
>  		.driver_data = (void *)&schneider_sct101ctm_data,
> 

