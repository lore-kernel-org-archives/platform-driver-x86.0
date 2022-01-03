Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EAEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Jan 2022 11:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbiACLaN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Jan 2022 06:30:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27150 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232970AbiACLaN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jan 2022 06:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641209412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ObfYtww4H9p0V6epgkeBPV/f71QrhOy9UXb+mpWg0e0=;
        b=an6ex4kyxY0kgQJfcqx5yUtwcGKrSCofu7tYJ460oLG5pQf9flQwFAunpmjilTHOoJUbCN
        +SncZw+twghAEV3XeiFDaNBYHdtaEZFpCcJQ06Qh7HvxpLxNRvK8ETK5KSK0oZATiJxG0w
        1iw5KwPV8AOe/bV2yJlBuBmhyX1kfZo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-Hqmojaa2O-Wh1RSp5rgEBg-1; Mon, 03 Jan 2022 06:30:11 -0500
X-MC-Unique: Hqmojaa2O-Wh1RSp5rgEBg-1
Received: by mail-ed1-f72.google.com with SMTP id dz8-20020a0564021d4800b003f897935eb3so22684372edb.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jan 2022 03:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ObfYtww4H9p0V6epgkeBPV/f71QrhOy9UXb+mpWg0e0=;
        b=4j18kVJ++NC40ZE3sv77iLY+i/+ruqlRNjjrC7xESstq80TV6Qkh7Bq4PzbyC5k+Oc
         j1UOBTwoAE9jeniq+d12KEJuH3g/KrrFUyeDSk78exOeyuSUqpTPqmWTBSBhlwMD6R12
         0LnnQn+1lqaGe38zt9F0K2XKntiKWSg0S0ETPb8o80FcKpDvr/JAqeDBbhOYkGP14lva
         NF+Jfx45R/AK3m946R6Ku57W6AVeAiPXsc6RTyv+KMjaBoBUUNI+8x3zLAWj/Am2IKoi
         vkltWfgJcmQgxiwi41herXdZmtS9FRgZMVLx6uBr7YCMXVB6FPXJEuOv/bFlG8RyQE+j
         WaJA==
X-Gm-Message-State: AOAM531DBkCXIBWmBCz2ExtEsZN2S6y8dkGOeGWRfMJVwNF4OMbrEura
        05xLj9g9SulyOn4Nlwg8vaa4BH7n18/xn9yJdx2ox3LQcSUVouJ2W8QmEDjQ+aL5JQn9LLdGyKZ
        5qwZa+7KZCpOuOwhgyAEwrCkeybzwx56g+w==
X-Received: by 2002:a17:906:4918:: with SMTP id b24mr34938257ejq.466.1641209410532;
        Mon, 03 Jan 2022 03:30:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIrLoUJrAWsDd20gNqfnDaVRPgRTkA1YxDfiTQhFe3mYwop/SjhgvdE7qIj6s7+UOsJhdmmg==
X-Received: by 2002:a17:906:4918:: with SMTP id b24mr34938245ejq.466.1641209410350;
        Mon, 03 Jan 2022 03:30:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id z18sm13594448edc.76.2022.01.03.03.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 03:30:10 -0800 (PST)
Message-ID: <babfa040-baea-2f4c-3931-1bc5055f3db4@redhat.com>
Date:   Mon, 3 Jan 2022 12:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Remove the Glavey
 TM800A550L entry
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220103112700.111414-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220103112700.111414-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 1/3/22 12:27, Hans de Goede wrote:
> The Glavey TM800A550L tablet is a tablet which ships with Android as
> factory OS. As such it has the typical broken DSDT which x86 Android
> tablets tend to have.
> 
> Specifically the touchscreen ACPI device node is missing the IRQ for
> the touchscreen. So far users were expected to fix this with a DSDT
> overlay, but support for the TM800A550L has been added to the new
> x86-android-modules kernel-module and that will now automatically
> instantiate a proper i2c-client with the IRQ set for the touchscreen,
> including the necessary device-properties for the firmware loading.
> 
> This means that the touchscreen_dmi entry for the TM800A550L is
> no longer necessary (and it no longer matches either since the
> touchcscreen is no longer enumerated through ACPI), remove it.

Typo, I've done a s/touchcscreen/touchscreen/ before applying this.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans




> ---
>  drivers/platform/x86/touchscreen_dmi.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 7acec7eaf4cb..494f23052678 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -361,18 +361,6 @@ static const struct ts_dmi_data gdix1001_01_upside_down_data = {
>  	.properties	= gdix1001_upside_down_props,
>  };
>  
> -static const struct property_entry glavey_tm800a550l_props[] = {
> -	PROPERTY_ENTRY_STRING("firmware-name", "gt912-glavey-tm800a550l.fw"),
> -	PROPERTY_ENTRY_STRING("goodix,config-name", "gt912-glavey-tm800a550l.cfg"),
> -	PROPERTY_ENTRY_U32("goodix,main-clk", 54),
> -	{ }
> -};
> -
> -static const struct ts_dmi_data glavey_tm800a550l_data = {
> -	.acpi_name	= "GDIX1001:00",
> -	.properties	= glavey_tm800a550l_props,
> -};
> -
>  static const struct property_entry gp_electronic_t701_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
> @@ -1149,15 +1137,6 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
>  		},
>  	},
> -	{	/* Glavey TM800A550L */
> -		.driver_data = (void *)&glavey_tm800a550l_data,
> -		.matches = {
> -			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
> -			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
> -			/* Above strings are too generic, also match on BIOS version */
> -			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
> -		},
> -	},
>  	{
>  		/* GP-electronic T701 */
>  		.driver_data = (void *)&gp_electronic_t701_data,
> 

