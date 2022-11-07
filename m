Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88E9C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 10:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiKGKUl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 05:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiKGKUi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 05:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1936014034
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 02:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667816384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lh1sC243mXj1nwA8olLZDbB3dZ9ipyfDquCTdrqXUWQ=;
        b=EMoJLxZ5lD/tkXo7INsyhVZHVFp3vJXvdoQ6pDCxV3jffVbmUDbk6kqx4ePTuV9t6++g99
        iGo8jboRxL1Jh4LRjT/J/lONFIvWSt+qeFoote/2kh3yGkBO/V0AFKDiAXtwZVT4ge7Sud
        +9N5NR76Pl7yDjkBFj02MMUayPVR2DI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-Xeyd37jQOpK75p061e-JQg-1; Mon, 07 Nov 2022 05:19:43 -0500
X-MC-Unique: Xeyd37jQOpK75p061e-JQg-1
Received: by mail-ej1-f71.google.com with SMTP id hp16-20020a1709073e1000b007adf5a83df7so6063787ejc.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 02:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lh1sC243mXj1nwA8olLZDbB3dZ9ipyfDquCTdrqXUWQ=;
        b=bX6ZZK4YYbCYSGhq0ehhaA+0iirurHU5fedHqf15TOZXOYTo0qQtdxzozvErFGBiQB
         98Gv/CEonWetlun9DL3G/418HFz+GSBoXBYKkgXOUcJ3xychK/YJgy8hQI892n9jgLjQ
         4csIfe8DyzjH+DwGzAOkVKvE4ZxtDS406x5SvIOl//BqbGoF5ekfmqvb7RHV/6SL5R2p
         Ie7ZlhGYa8g/aVonhoanEAHuPoHTnKrqnuZdVtvhbFS9VbxfL7k2ZiT2SJZVvLJGF1CH
         peEkuWVWk5iyl/2iYZOo55/U8DDFaxr/3FG9BM3BxWkPnxv2vjCccxfHyVc4VYyvaGvv
         8oLA==
X-Gm-Message-State: ACrzQf2dF9SGaHU10wagYB7oQiugSNCJCjAaC7yHeIFrOBnED2CqDvJq
        dnoFro4Eop/Zat+YLrzF5Y/vAVPaqaedegTQQz/2/oMcv0Tq4g0dXNL2paxKQdxlk2i/rC15yzu
        PYia7YqOn0fqA65K0F6SaHJBjr6uSXn2dFA==
X-Received: by 2002:a17:906:9be5:b0:7ad:d0be:3467 with SMTP id de37-20020a1709069be500b007add0be3467mr39931620ejc.208.1667816381832;
        Mon, 07 Nov 2022 02:19:41 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4JV8GPN9jWyN1U78o0cZ72nLOAyezoXXndfdnBh7xRUWr7UpSRgRmwA6zyFlSp6DaLuzIaJA==
X-Received: by 2002:a17:906:9be5:b0:7ad:d0be:3467 with SMTP id de37-20020a1709069be500b007add0be3467mr39931604ejc.208.1667816381570;
        Mon, 07 Nov 2022 02:19:41 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id la20-20020a170907781400b00741a251d9e8sm3238210ejc.171.2022.11.07.02.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:19:41 -0800 (PST)
Message-ID: <fc829cf7-09a1-0ef8-f4c9-6eaa43e6be7b@redhat.com>
Date:   Mon, 7 Nov 2022 11:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the RCA
 Cambio W101 v2 2-in-1
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221025141131.509211-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221025141131.509211-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/25/22 16:11, Hans de Goede wrote:
> Add touchscreen info for the RCA Cambio W101 v2 2-in-1.
> 
> Link: https://github.com/onitake/gsl-firmware/discussions/193
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I have added this to my review-hans branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index bc97bfa8e8a6..baae3120efd0 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -770,6 +770,22 @@ static const struct ts_dmi_data predia_basic_data = {
>  	.properties	= predia_basic_props,
>  };
>  
> +static const struct property_entry rca_cambio_w101_v2_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 20),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1644),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 874),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rca-cambio-w101-v2.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data rca_cambio_w101_v2_data = {
> +	.acpi_name = "MSSL1680:00",
> +	.properties = rca_cambio_w101_v2_props,
> +};
> +
>  static const struct property_entry rwc_nanote_p8_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-min-y", 46),
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
> @@ -1409,6 +1425,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>  		},
>  	},
> +	{
> +		/* RCA Cambio W101 v2 */
> +		/* https://github.com/onitake/gsl-firmware/discussions/193 */
> +		.driver_data = (void *)&rca_cambio_w101_v2_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "RCA"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "W101SA23T1"),
> +		},
> +	},
>  	{
>  		/* RWC NANOTE P8 */
>  		.driver_data = (void *)&rwc_nanote_p8_data,

