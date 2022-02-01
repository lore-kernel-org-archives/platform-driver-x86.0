Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F74C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Feb 2022 15:03:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239701AbiBAPDT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Feb 2022 10:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23819 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239695AbiBAPDS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Feb 2022 10:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643727798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rtI+17/g93ZHkydx3wVerkIz2lCilB6XCltFF3RHwWE=;
        b=WbW9al9M8LrDDkvxSlLxQbDLsAm1AtGuZRe8GEUjkAIJbwRE91YAwEmtt241Ivk4VTWGCT
        9O/oNIxHIGI6ZfujcEVmff1zaFijPaZ+P4HVPafLfgfk97nd4oYdPcrAIkkTQSGt6rk7tS
        334LCPNuyOr+3xVENW5VkuDz1FGR9Po=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-8hCVDQ7_NLuauVV7_f5XCw-1; Tue, 01 Feb 2022 10:03:17 -0500
X-MC-Unique: 8hCVDQ7_NLuauVV7_f5XCw-1
Received: by mail-ed1-f70.google.com with SMTP id w23-20020a50d797000000b00406d33c039dso8817930edi.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Feb 2022 07:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rtI+17/g93ZHkydx3wVerkIz2lCilB6XCltFF3RHwWE=;
        b=48gV3VLaKIaBLscN51iaiiA/mhVSbkhHAvZR6842o2k/kvWBdL7wAINH0ZeLrmOUIj
         e7Q24Pf14/FLDGwmQbk+IWCMiL3F4nTEia7PoLiCc6IL6v92W/Io5p0EzCaDCg8PAQVq
         sko3RQckeTFpHUV+F3hA+ctNWGefA+DTMmW3NPMjwonyc3BgZorhB3zgDR2Ta5KftMcR
         cDCrzH0sGnI1BWBN9DguEBLlmt4/KXzBY+sy3J+7SbeIMhKtDQ5rJt58EJiaMKsMWAF7
         bdzCg7nbR+aHLJl8x30qlgalI72WizlTIAkGxbFPVlvlNLZBnbecc/23QZoV5un/4LWA
         2Fsg==
X-Gm-Message-State: AOAM532LsZ7kB7Ujm5d8G0WqcFGLIvNcf0EvHg/MlQrXIxpKQCTCu9r7
        2dKiHMope10eWANWLK/nekCT99ErY70pGtib9bzzpElwi1YU7j/oRV7eS4YLGG6rOZ//sMOlfVE
        DwbUhRK3eAoO1KeYNxMo8yoo2B3OwjuAU+A==
X-Received: by 2002:a17:906:ae8a:: with SMTP id md10mr21791566ejb.726.1643727795753;
        Tue, 01 Feb 2022 07:03:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGrVV48N+FUq374nh8LyAIR4m925bx4g5hSDNAlEqbx1WtR+fT4wQbdk5cvNtKgnuH0jDmyw==
X-Received: by 2002:a17:906:ae8a:: with SMTP id md10mr21791538ejb.726.1643727795475;
        Tue, 01 Feb 2022 07:03:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id gz12sm14715067ejc.124.2022.02.01.07.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 07:03:15 -0800 (PST)
Message-ID: <c66b7faa-f289-ff93-0d73-d2955f9c5bf0@redhat.com>
Date:   Tue, 1 Feb 2022 16:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 9/9] ACPI / scan: Create platform device for CS35L41
Content-Language: en-US
To:     Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com,
        Lucas Tanure <tanureal@opensource.cirrus.com>
References: <20220121172431.6876-1-sbinding@opensource.cirrus.com>
 <20220121172431.6876-10-sbinding@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220121172431.6876-10-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/21/22 18:24, Stefan Binding wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> The ACPI device with CSC3551 or CLSA0100 are sound cards
> with multiple instances of CS35L41 connected by I2C or SPI
> to the main CPU.
> 
> We add an ID to the ignore_serial_bus_ids list to enumerate
> all I2C or SPI devices correctly.
> 
> The same IDs are also added into serial-multi-instantiate
> so that the driver can correctly enumerate the ACPI.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/acpi/scan.c                             |  3 +++
>  drivers/platform/x86/serial-multi-instantiate.c | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 48db5e80c2dc..ebd10af3ff7f 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1744,8 +1744,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  	 */
>  		{"BSG1160", },
>  		{"BSG2150", },
> +		{"CSC3551", },
>  		{"INT33FE", },
>  		{"INT3515", },
> +	/* Non-conforming _HID for Cirrus Logic already released */
> +		{"CLSA0100", },
>  	/*
>  	 * HIDs of device with an UartSerialBusV2 resource for which userspace
>  	 * expects a regular tty cdev to be created (instead of the in kernel
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 3f05385ca2cf..d09f11eac4f8 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -308,6 +308,17 @@ static const struct smi_node int3515_data = {
>  	.bus_type = SMI_I2C,
>  };
>  
> +static const struct smi_node cs35l41_hda = {
> +	.instances = {
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +		{}
> +	},
> +	.bus_type = SMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to serial_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -316,6 +327,9 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)&bsg1160_data },
>  	{ "BSG2150", (unsigned long)&bsg2150_data },
>  	{ "INT3515", (unsigned long)&int3515_data },
> +	{ "CSC3551", (unsigned long)&cs35l41_hda },
> +	/* Non-conforming _HID for Cirrus Logic already released */
> +	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, smi_acpi_ids);
> 

