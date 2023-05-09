Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFB9C77B7C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 08:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbjEIIw1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 04:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234741AbjEIIwZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 04:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B31D06B
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 01:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683622296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cET/oL3pME8pqlDonQ72QqAZ0pStE5yIdYuOPHHbSYM=;
        b=cUwJkjIEIvvhGSlVdIxO/cdnrNJ09FU4oj6FwYL5xaDOk1Nj6CBC9sjxCL+TlLogMbjwzh
        +bmJS5zcisSLZkRkTKQzrlg/cvpNXff+eS5dK7oNAIxsdZ87yr59cdVF1a9N6zSPiQJDVr
        ppIY8RCTi3/KK/elcElBJ/MKfDiYcL4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-mRotzIQgN8mgJXCsNYTvKA-1; Tue, 09 May 2023 04:51:35 -0400
X-MC-Unique: mRotzIQgN8mgJXCsNYTvKA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-95847b4b4e7so644496066b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 May 2023 01:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622294; x=1686214294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cET/oL3pME8pqlDonQ72QqAZ0pStE5yIdYuOPHHbSYM=;
        b=Unt2zW8/D/rg9u2uJfhpnT7zz73VSLPZIjmnd4zKVT/ZiXIlKRprzIWDKoQvOBF7Uc
         YZpeBRQxzlL1koGTB2GPwvnKYb70V0TGm51esrYvlh0r7KK1eDoQOBRYtZuGpg9wv6X7
         R/goc3yy+rQqF5sqJKN4CDY+KEnaC/tZA4/D1m9+9zmVNVIs7ya+EF3DrSGnthWLabtG
         bRRB3+t37UhBViEnfF8Skmf06H1sTWUIdH0FD+a9ue61sbQtIXib52SyflYSuOLua71e
         n+2Fc/7O3N+ysfFZhZ4dYPl23DRLycMVejjHdFGQA0aXgivMJyr/CBxXSSqiiqIK9BAH
         vHyA==
X-Gm-Message-State: AC+VfDwAD/R4OswjT3JSkFsdzD6fBYDbB9jwfpJ9PDld3dBvvXl/rVOy
        zbtZjxOQaK4pNJsutDJcxOu9s5iDOjx2VGXEGzB4aFNkRgtkvAcc5t4kF7D77dnOPzoqgHTTQOP
        ghstPMy4hFk/XvT6CgucO8cFiphjZT76XwA==
X-Received: by 2002:a17:907:60cb:b0:959:919:963d with SMTP id hv11-20020a17090760cb00b009590919963dmr13893003ejc.50.1683622294116;
        Tue, 09 May 2023 01:51:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7r2z1g0iUrnMkrLUL2lxbnoZaMjes1FZQ1h4u7wRfW6ib1xykcRU9KjZCwDaQNZOAmd9beYA==
X-Received: by 2002:a17:907:60cb:b0:959:919:963d with SMTP id hv11-20020a17090760cb00b009590919963dmr13892990ejc.50.1683622293842;
        Tue, 09 May 2023 01:51:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906845a00b00965cd15c9bbsm1063982ejy.62.2023.05.09.01.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:51:33 -0700 (PDT)
Message-ID: <47103deb-ec7c-6efc-ba99-b780529d13bc@redhat.com>
Date:   Tue, 9 May 2023 10:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add upside-down quirk for
 GDIX1002 ts on the Juno Tablet
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230505210323.43177-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230505210323.43177-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/23 23:03, Hans de Goede wrote:
> The Juno Computers Juno Tablet has an upside-down mounted Goodix
> touchscreen. Add a quirk to invert both axis to correct for this.
> 
> Link: https://junocomputers.com/us/product/juno-tablet/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/touchscreen_dmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 13802a3c3591..3b32c3346a45 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -378,6 +378,11 @@ static const struct ts_dmi_data gdix1001_01_upside_down_data = {
>  	.properties	= gdix1001_upside_down_props,
>  };
>  
> +static const struct ts_dmi_data gdix1002_00_upside_down_data = {
> +	.acpi_name	= "GDIX1002:00",
> +	.properties	= gdix1001_upside_down_props,
> +};
> +
>  static const struct property_entry gp_electronic_t701_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
> @@ -1295,6 +1300,18 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "jumperx.T87.KFBNEEA"),
>  		},
>  	},
> +	{
> +		/* Juno Tablet */
> +		.driver_data = (void *)&gdix1002_00_upside_down_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
> +			/* Both product- and board-name being "Default string" is somewhat rare */
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Default string"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Default string"),
> +			/* Above matches are too generic, add partial bios-version match */
> +			DMI_MATCH(DMI_BIOS_VERSION, "JP2V1."),
> +		},
> +	},
>  	{
>  		/* Mediacom WinPad 7.0 W700 (same hw as Wintron surftab 7") */
>  		.driver_data = (void *)&trekstor_surftab_wintron70_data,

