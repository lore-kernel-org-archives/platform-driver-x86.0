Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88DBC001DC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Jul 2023 14:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbjGaOKV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Jul 2023 10:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjGaOKP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jul 2023 10:10:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C38E8
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690812568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WD2g6uj+bczangBD0M6t4+N3tf+625pl7skoKavki5M=;
        b=Y84A6mWPWtvvUcZ2pGjEdrM7DMoJB5bX57excPX1Nkirrx7SOBWBnbKAym3/nRg0z7ByrR
        Nr6kWKuoROJOI48oaEmVYjVPlCRC9Y8iEyIN2zOeq+2+PpZ0luhvBtY7pGNRnALJ0Rl6Ci
        /n1z3AmBR1JjvxH3TamiO5SFbH/+DQA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-nuwsWcf1Oy6_Cf-5UE6udA-1; Mon, 31 Jul 2023 10:09:27 -0400
X-MC-Unique: nuwsWcf1Oy6_Cf-5UE6udA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b934194964so40857261fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 07:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812565; x=1691417365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD2g6uj+bczangBD0M6t4+N3tf+625pl7skoKavki5M=;
        b=Y2ve7WzMyBUV98r9PIqWMbBVu112jqlBD7+nNyTf8E5ZkHEA+MKETycK6KKyKpYwfc
         RChS+kz1uxB7cz5FY5wit58C6mYzQ7yrBai2gJyZIunk9yFntQra319PPy2q3hZ9JgME
         F4LCXL9/xEow5bH/WRroeKJ1bTyTDFOnvogsFT/XooNpSdfWYAji6I3HCGr8VPiS7QAs
         vtmfPaZuc5KfG7b6cMGsJY+i3LdhJUZPPpQcCM18z+y4wuvV57/hJpFPvz2mT4qij3Oc
         iGmAfWWzV2n1tp67IYiWzCANhryHTRMf5LgdikwQIL+K6v2xQIA5q6d0jiRXwXs0MBNO
         hVXQ==
X-Gm-Message-State: ABy/qLbwczI8GE4zLdnEQieaVGPZjvnxaH2Qd95a+A/AGZi/Tr4sMia4
        45wbMtCQ+cafC06vM5wOw6jSMO6FS4z0ARFaUCwql7o8a3eOuMW2y3nD0hVTqw2b5E3eKNEypTj
        aSnJL0g9ij1GXTY09KK2UNcRWdGaam851eyaSQzE15A==
X-Received: by 2002:a2e:3e07:0:b0:2b9:dd5d:5d0c with SMTP id l7-20020a2e3e07000000b002b9dd5d5d0cmr35014lja.52.1690812565533;
        Mon, 31 Jul 2023 07:09:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF97yOz7HL49mkqe4euZC2DWJ1w3zEkXD2P098ai/agoHgCZ9grdbaWYw8ZmQ8KTF5KXSvw7A==
X-Received: by 2002:a2e:3e07:0:b0:2b9:dd5d:5d0c with SMTP id l7-20020a2e3e07000000b002b9dd5d5d0cmr35001lja.52.1690812565150;
        Mon, 31 Jul 2023 07:09:25 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m17-20020a170906849100b00992d70f8078sm6206032ejx.106.2023.07.31.07.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 07:09:23 -0700 (PDT)
Message-ID: <f4497997-83eb-3739-f3b9-e674aec97e08@redhat.com>
Date:   Mon, 31 Jul 2023 16:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] ACPI: scan: Create platform device for CS35L56
Content-Language: en-US
To:     Richard Fitzgerald <rf@opensource.cirrus.com>, rafael@kernel.org
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com,
        Simon Trimmer <simont@opensource.cirrus.com>
References: <20230728111345.7224-1-rf@opensource.cirrus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230728111345.7224-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/23 13:13, Richard Fitzgerald wrote:
> From: Simon Trimmer <simont@opensource.cirrus.com>
> 
> The ACPI device CSC3556 is a Cirrus Logic CS35L56 mono amplifier which
> is used in multiples, and can be connected either to I2C or SPI.
> 
> There will be multiple instances under the same Device() node. Add it
> to ignore_serial_bus_ids and handle it in the serial-multi-instantiate
> driver.
> 
> There can be a 5th I2cSerialBusV2, but this is an alias address and doesn't
> represent a real device. Ignore this by having a dummy 5th entry in the
> serial-multi-instantiate instance list with the name of a non-existent
> driver, on the same pattern as done for bsg2150.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/acpi/scan.c                             |  1 +
>  drivers/platform/x86/serial-multi-instantiate.c | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 5b145f1aaa1b..87e385542576 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1714,6 +1714,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  		{"BSG1160", },
>  		{"BSG2150", },
>  		{"CSC3551", },
> +		{"CSC3556", },
>  		{"INT33FE", },
>  		{"INT3515", },
>  		/* Non-conforming _HID for Cirrus Logic already released */
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index 2c2abf69f049..8158e3cf5d6d 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -329,6 +329,19 @@ static const struct smi_node cs35l41_hda = {
>  	.bus_type = SMI_AUTO_DETECT,
>  };
>  
> +static const struct smi_node cs35l56_hda = {
> +	.instances = {
> +		{ "cs35l56-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l56-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l56-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "cs35l56-hda", IRQ_RESOURCE_AUTO, 0 },
> +		/* a 5th entry is an alias address, not a real device */
> +		{ "cs35l56-hda_dummy_dev" },
> +		{}
> +	},
> +	.bus_type = SMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to ignore_serial_bus_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -337,6 +350,7 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)&bsg1160_data },
>  	{ "BSG2150", (unsigned long)&bsg2150_data },
>  	{ "CSC3551", (unsigned long)&cs35l41_hda },
> +	{ "CSC3556", (unsigned long)&cs35l56_hda },
>  	{ "INT3515", (unsigned long)&int3515_data },
>  	/* Non-conforming _HID for Cirrus Logic already released */
>  	{ "CLSA0100", (unsigned long)&cs35l41_hda },

