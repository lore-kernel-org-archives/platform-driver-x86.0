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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305EAC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 12:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09C3A601FA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 12:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236239AbhETMNh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 May 2021 08:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53278 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238589AbhETMMN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 May 2021 08:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621512651;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wTfMU2u/Caz6xoNpNPkUrpNnQ0+rzfh1Ay4ToScMvEo=;
        b=Z0O0Upr/UYSb2ZMzVb3FnibW/WvLmSyi4I1MZpLO/nz3vnGedQjz5BsxFgz+UDtRBuHQL7
        kTKBFoJQpWkJ9xYnKKbEWB+LKczHpNYXIRZPyhF3euQIB+NkpWP7lWgatZGbBKKo909+tA
        +cqc6gAWRLGczMrflstwFbEPQuDNc2s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-eQlciZqEPuCH-efKoI0u6Q-1; Thu, 20 May 2021 08:10:50 -0400
X-MC-Unique: eQlciZqEPuCH-efKoI0u6Q-1
Received: by mail-ed1-f70.google.com with SMTP id b8-20020a05640202c8b029038f1782a77eso943504edx.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 May 2021 05:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wTfMU2u/Caz6xoNpNPkUrpNnQ0+rzfh1Ay4ToScMvEo=;
        b=aCyA5SW1+KGCT/DS+HkUEoV/MCnaCNeFl2cAG86ulV4KLM/i2iNCrW/3wYXfu1WKYA
         bzVg3+/liNeuVumEzsxjh1zHVAB8K1SK5wlr8ZZVPjm3Syor3p7owjR4kPoZUiqYH266
         cuT9wg9EC3nmmkmxD87h2e7hn83W6JwfKk0reNebJPlqtz+nuU3jQK1srX6GmI11YC/4
         lNaILP2TxL8jRePpACAYXiRhvlJfDw4iMsekO34I83H9Bx/HErKs8J3kbfJWGYu7bZ43
         nNS6GSzYIFr5M0inBjACTlfZ9vKCEcII3/Qb0926+zzOcy+GMMfxI4rIYRw1ZyAaLKNh
         ibww==
X-Gm-Message-State: AOAM531U0uvsSfeahulRbz/3x4lmNJxAi2KfuWV7Wjtg2jE/o/SHNS5A
        Sn2wj6kv8lipcTuvo8J8RgqlttH13I4MBy5h44rvL7M2Z2Lj6SdFIBjGzInlg7wliWKs7+tDjsl
        N85c4r0hxhoEe5rtMgCdmZUZ3XM4GXHfuD/jZit+eFQ2BWfHQCnj+/jXPd3/3zQjOQzV/Y2CBN2
        qW1Lu2UuXMdg==
X-Received: by 2002:a17:906:456:: with SMTP id e22mr4288239eja.427.1621512648630;
        Thu, 20 May 2021 05:10:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeh00GEZBMqUgo+rGXh7vBK9V09k+OMpWXWJcyTOynx0lfgilIlg3xGk9CqREjcNZy6ZCjRA==
X-Received: by 2002:a17:906:456:: with SMTP id e22mr4288214eja.427.1621512648435;
        Thu, 20 May 2021 05:10:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g1sm1299390ejf.29.2021.05.20.05.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 05:10:48 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Chuwi
 Hi10 Pro (CWI529) tablet
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210520093228.7439-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4d1824ce-e1ca-33b6-47ce-d9ee0d05d05f@redhat.com>
Date:   Thu, 20 May 2021 14:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520093228.7439-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/20/21 11:32 AM, Hans de Goede wrote:
> Add touchscreen info for the Chuwi Hi10 Pro (CWI529) tablet. This includes
> info for getting the firmware directly from the UEFI, so that the user does
> not need to manually install the firmware in /lib/firmware/silead.
> 
> This change will make the touchscreen on these devices work OOTB,
> without requiring any manual setup.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to the pdx86 review-hans
and fixes branches now.

Regards,

Hans




> ---
>  drivers/platform/x86/touchscreen_dmi.c | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 40c970908a99..a626891f3ec8 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -115,6 +115,32 @@ static const struct ts_dmi_data chuwi_hi10_plus_data = {
>  	.properties     = chuwi_hi10_plus_props,
>  };
>  
> +static const struct property_entry chuwi_hi10_pro_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1912),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1272),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data chuwi_hi10_pro_data = {
> +	.embedded_fw = {
> +		.name	= "silead/gsl1680-chuwi-hi10-pro.fw",
> +		.prefix = { 0xf0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00 },
> +		.length	= 42504,
> +		.sha256	= { 0xdb, 0x92, 0x68, 0xa8, 0xdb, 0x81, 0x31, 0x00,
> +			    0x1f, 0x58, 0x89, 0xdb, 0x19, 0x1b, 0x15, 0x8c,
> +			    0x05, 0x14, 0xf4, 0x95, 0xba, 0x15, 0x45, 0x98,
> +			    0x42, 0xa3, 0xbb, 0x65, 0xe3, 0x30, 0xa5, 0x93 },
> +	},
> +	.acpi_name      = "MSSL1680:00",
> +	.properties     = chuwi_hi10_pro_props,
> +};
> +
>  static const struct property_entry chuwi_vi8_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
>  	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
> @@ -955,6 +981,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
>  		},
>  	},
> +	{
> +		/* Chuwi Hi10 Prus (CWI597) */
> +		.driver_data = (void *)&chuwi_hi10_pro_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
> +		},
> +	},
>  	{
>  		/* Chuwi Vi8 (CWI506) */
>  		.driver_data = (void *)&chuwi_vi8_data,
> 

