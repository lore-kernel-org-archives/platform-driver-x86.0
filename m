Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EE0C43381
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 12:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4518F21D93
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 12:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbhADMCI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 07:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58694 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726419AbhADMCI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 07:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609761641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iPcN1/R/XYG/gfaOrpnk4vK5+vqEpAMklYQvlCVjfFE=;
        b=LnQVqw9i3PU4eC3Jh0avL+4twr3M1kyay6u+BD6IaZCO3ixWnPXw++fJY5fFKQctuXwY4b
        LlBHc9S0L2pjM1bVMjUb8S9NP7JuFikEhfPyVJQoMVNCS6nx/9iyyZCEkVuvzq0s7usSzZ
        j3sVsc/KgrXokZoKnyPaUm5ROnIXZv4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-l9fSBMo_OrCwPDB3aXD9Sw-1; Mon, 04 Jan 2021 07:00:36 -0500
X-MC-Unique: l9fSBMo_OrCwPDB3aXD9Sw-1
Received: by mail-ed1-f72.google.com with SMTP id e11so12104406edn.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 04:00:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iPcN1/R/XYG/gfaOrpnk4vK5+vqEpAMklYQvlCVjfFE=;
        b=LrPb7KVHQ2MfzFfGiuGNq5XbhLWL6SOkNJIx7XSJhrhrfcG1qSH1EPWsWjD/VTf0hu
         WhRQM4WZfQnAzVjl40Np35DHWBl1JSMBdooBbfTR2mNKFBCQmY6waDoHSj60nu2WfbC1
         49LpssrrJHs0GHLjhey2pYju0Zu3PHapQFwSP8i9ghOFW3T0ml1DNsxihPec7oct+ogz
         9hzt42iqBq9JHcHQdX6YOUCFFbWk/N1SEMpKTldic7WHXSDv0wZjOi+/fSw8fiEeh8I7
         XSQyMeeAPRUmwDR/X5pB+zSFlOkxP14GQ1tLa6xSfUloitQ1DQc88248c08s2199T7zX
         lBEw==
X-Gm-Message-State: AOAM530hIaonIDZnG5rCGjlW0+FDjgYgeTtDYcQLEB/tXHImr4AHzFkP
        JAB55vsjgJS/wN98kUv2RSAXk0Di3PuW159whwVD6IUMPmvsne2qAAXpnApzSiqWnfGPjohCS1u
        tcH+cNMIeaPlt4iSxGEjBWtAOixnWZl0YGw==
X-Received: by 2002:a05:6402:1592:: with SMTP id c18mr16976642edv.181.1609761634949;
        Mon, 04 Jan 2021 04:00:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuEmY5C8c7ftYmZRYYEMIdFvp8FhKA0fFd2btQTmum1/6Gg8hA/IcB0zINAdK1k8hkJGb5kA==
X-Received: by 2002:a05:6402:1592:: with SMTP id c18mr16976614edv.181.1609761634708;
        Mon, 04 Jan 2021 04:00:34 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id y14sm23212597eju.115.2021.01.04.04.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 04:00:34 -0800 (PST)
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add swap-x-y quirk for
 Goodix touchscreen on Estar Beauty HD tablet
To:     Mark Gross <mgross@linux.intel.com>
Cc:     linux-input@vger.kernel.org, Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20201224135158.10976-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <99d3da8d-3319-3904-25d1-a9ff34be653f@redhat.com>
Date:   Mon, 4 Jan 2021 13:00:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201224135158.10976-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/24/20 2:51 PM, Hans de Goede wrote:
> The Estar Beauty HD (MID 7316R) tablet uses a Goodix touchscreen,
> with the X and Y coordinates swapped compared to the LCD panel.
> 
> Add a touchscreen_dmi entry for this adding a "touchscreen-swapped-x-y"
> device-property to the i2c-client instantiated for this device before
> the driver binds.
> 
> This is the first entry of a Goodix touchscreen to touchscreen_dmi.c,
> so far DMI quirks for Goodix touchscreen's have been added directly
> to drivers/input/touchscreen/goodix.c. Currently there are 3
> DMI tables in goodix.c:
> 1. rotated_screen[] for devices where the touchscreen is rotated
>    180 degrees vs the LCD panel
> 2. inverted_x_screen[] for devices where the X axis is inverted
> 3. nine_bytes_report[] for devices which use a non standard touch
>    report size
> 
> Arguably only 3. really needs to be inside the driver and the other
> 2 cases are better handled through the generic touchscreen DMI quirk
> mechanism from touchscreen_dmi.c, which allows adding device-props to
> any i2c-client. Esp. now that goodix.c is using the generic
> touchscreen_properties code.
> 
> Alternative to the approach from this patch we could add a 4th
> dmi_system_id table for devices with swapped-x-y axis to goodix.c,
> but that seems undesirable.
> 
> Cc: Bastien Nocera <hadess@hadess.net>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

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
>  drivers/platform/x86/touchscreen_dmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 5783139d0a11..c4de932302d6 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -263,6 +263,16 @@ static const struct ts_dmi_data digma_citi_e200_data = {
>  	.properties	= digma_citi_e200_props,
>  };
>  
> +static const struct property_entry estar_beauty_hd_props[] = {
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data estar_beauty_hd_data = {
> +	.acpi_name	= "GDIX1001:00",
> +	.properties	= estar_beauty_hd_props,
> +};
> +
>  static const struct property_entry gp_electronic_t701_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
> @@ -942,6 +952,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
>  		},
>  	},
> +	{
> +		/* Estar Beauty HD (MID 7316R) */
> +		.driver_data = (void *)&estar_beauty_hd_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Estar"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
> +		},
> +	},
>  	{
>  		/* GP-electronic T701 */
>  		.driver_data = (void *)&gp_electronic_t701_data,
> 

