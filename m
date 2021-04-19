Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0232DC433ED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 08:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6D6361029
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Apr 2021 08:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238307AbhDSIsn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26743 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238290AbhDSIsm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Apr 2021 04:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618822092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/rSewSfvjrchdywCaH+hDeVRroQpo1Kuqx+iGYpfdSU=;
        b=ZD6fRqqUf9r/wcs2E02NsXSglVlCLqiryzlB6dR802jOy/+UucD9nHBisEwtH+nF/UYaCG
        eKtwcb/e9Qf1oaCV/GpJKHYurI+QmpNIAoE2U13ZWr9cZKZHZcmoEf7Otx8YqLXPvx2Hzh
        oudMKscSz7NAjqp9J6wGu7bVS9N3ZvQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-mdW103nPObS38manZxpf0w-1; Mon, 19 Apr 2021 04:48:11 -0400
X-MC-Unique: mdW103nPObS38manZxpf0w-1
Received: by mail-ed1-f72.google.com with SMTP id o4-20020a0564024384b0290378d45ecf57so10889308edc.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Apr 2021 01:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/rSewSfvjrchdywCaH+hDeVRroQpo1Kuqx+iGYpfdSU=;
        b=hReBVfzrkhbrTeB59lzQj4PUKpBT5NZNaDK851ZfYy0EGxMnUV88a/pDK3kM/LsbOr
         kV5dCCaX6NAVFMC39MKCMdJnXSiuQ9IBn38aXXKbkX4APIIz+tOmnTUtUBcrewf8Nx9o
         gfyvjk05eoEC2IgwhvqzVcueo2xKiELFLddElVW2/FSbAkMaJ4JOGMCUMDIL+nJkGqcp
         rbGaiB6oZn4luq4Rn4xqk1kCvoXAzKBOwfI8kCbTpd5t1YJR8/9qYHYTVM2lBmcehcoZ
         LnVpLmVBlx5kSCbUvEsGq0t2wKguCU0opndj62SY+eZfYbft+NMj17joXLMNUgQAOkE2
         I7Ig==
X-Gm-Message-State: AOAM532DUkwQ592cTgeniYIMHkiKOaket65AD6I2lDRhlZriJEAcvmuf
        lrMsSaUzYh0Xmd+UoJSSBWS24u0ngdo/sG3ecZ/BJxkmzsa4X21y/dp5ZbIy0HRA8hBjhqfAjQB
        m+FqivarWp6NMd9szkuPhk7ds9fRAbTJbWKEQ0DeBQiUh4D/P0TT0jLBbe55n/MPWYbZXQcc3wm
        KuGbZIOALinw==
X-Received: by 2002:a17:906:3e97:: with SMTP id a23mr21256446ejj.440.1618822089677;
        Mon, 19 Apr 2021 01:48:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQezp8ZLE7UxHWN8D7YUW7yR2/+xfOBnN/EIt5F6G/lSF7EK5Ut15k2c4RoekqbZRYh8OJyg==
X-Received: by 2002:a17:906:3e97:: with SMTP id a23mr21256434ejj.440.1618822089405;
        Mon, 19 Apr 2021 01:48:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id go38sm9719396ejc.40.2021.04.19.01.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 01:48:09 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Teclast
 Tbook 11 tablet
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210417173105.4134-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bfe22d61-fb97-f703-7066-4ed67376ae50@redhat.com>
Date:   Mon, 19 Apr 2021 10:48:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210417173105.4134-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/17/21 7:31 PM, Hans de Goede wrote:
> Add touchscreen info for the Teclast Tbook 11 tablet. This includes info
> for getting the firmware directly from the UEFI, so that the user does
> not need to manually install the firmware in /lib/firmware/silead.
> 
> This change will make the touchscreen on these devices work OOTB,
> without requiring any manual setup.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've merged this into my review-hans branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 45203e333f57..90fe4f8f3c2c 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -715,6 +715,32 @@ static const struct ts_dmi_data techbite_arc_11_6_data = {
>  	.properties	= techbite_arc_11_6_props,
>  };
>  
> +static const struct property_entry teclast_tbook11_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 14),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1916),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1264),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-teclast-tbook11.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data teclast_tbook11_data = {
> +	.embedded_fw = {
> +		.name	= "silead/gsl3692-teclast-tbook11.fw",
> +		.prefix = { 0xf0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00 },
> +		.length	= 43560,
> +		.sha256	= { 0x9d, 0xb0, 0x3d, 0xf1, 0x00, 0x3c, 0xb5, 0x25,
> +			    0x62, 0x8a, 0xa0, 0x93, 0x4b, 0xe0, 0x4e, 0x75,
> +			    0xd1, 0x27, 0xb1, 0x65, 0x3c, 0xba, 0xa5, 0x0f,
> +			    0xcd, 0xb4, 0xbe, 0x00, 0xbb, 0xf6, 0x43, 0x29 },
> +	},
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= teclast_tbook11_props,
> +};
> +
>  static const struct property_entry teclast_x3_plus_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -1243,6 +1269,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
>  		},
>  	},
> +	{
> +		/* Teclast Tbook 11 */
> +		.driver_data = (void *)&teclast_tbook11_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TECLAST"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "TbooK 11"),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "E5A6_A1"),
> +		},
> +	},
>  	{
>  		/* Teclast X3 Plus */
>  		.driver_data = (void *)&teclast_x3_plus_data,
> 

