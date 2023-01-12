Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702CAC61DB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 17:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbjALRlF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 12:41:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbjALRkf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 12:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48ECA6D50B
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 08:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673542746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+r/hXDRD0/hcU6hWbPEHUg56pIsqoho5eKzvwcPaPp4=;
        b=h6QxG3rmB0s1RMv5TIjOxtBlbgk65D8ixSvoAQAMUZIT1zrLr382qVUMKpoWlRYotlNuzy
        7GyNJC6oK9G1Xxmqi6FdSy2RJAQ+uJCjiT3pomG8tIxkjFMDpjNpReWiweBDh4vMOJzQWj
        2Zey8VdO9J/6MYnSSXXO6PfEIGkR0io=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-3QHmsz5kMz6Sqx39OJFLtQ-1; Thu, 12 Jan 2023 11:45:41 -0500
X-MC-Unique: 3QHmsz5kMz6Sqx39OJFLtQ-1
Received: by mail-ej1-f69.google.com with SMTP id qf12-20020a1709077f0c00b008656383a970so2147741ejc.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 08:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+r/hXDRD0/hcU6hWbPEHUg56pIsqoho5eKzvwcPaPp4=;
        b=T324Di3/HyDoReTXSrO8pipMHNmQClsKaWd7xXIBD0CihjjAZzDYNmt71wcZ4KYoXk
         YJ9oMDDWe7tto/0FrTJu9RpcjFR9bLFBMWN5R78NvL7R7EBmHmRRSRNyb1TbvIfL82Fj
         XAcSlNO682V1uB8ajgNxtb+7KAJTihjP8q6TcfrpnnCm6vkJYUhSLR2v3v3zCrm5F8W2
         XRumyYsOHLQ+hGgaxaISS1JkqvTA+igld7NL8wKudsImC0g7uVfHLz1LFabz8QwFovyV
         OfWvjgR6amYGZE4+2E1LaFyHj6peZQZdzUGChwjVZHR/N6v/ZlyqnP1iH9jDdblNPy0e
         dshg==
X-Gm-Message-State: AFqh2kr+0Yh1TJbJX2KfSrAVlTvuaONKbs7S/4yYVK+e6Q1BH1AerVqc
        yer9EduWj4AMZDNRQs90jLU4zAJDuEi82/HR7EGHFuvAtLQJkIoKWKTMDlYiu/OS+Rr6NCbzWLo
        r/9zkYiEF7Ln4DwXt7AZywZEx/JWMvSkM8w==
X-Received: by 2002:a05:6402:550a:b0:47f:bc9b:46ec with SMTP id fi10-20020a056402550a00b0047fbc9b46ecmr58228728edb.7.1673541940728;
        Thu, 12 Jan 2023 08:45:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtRYPCHtPxgfBu2NjQVazdJUM1l0A2rkq+Yvs5GMxjRsWo61/WLz2yRlHT8LDFL0nFXshrMQQ==
X-Received: by 2002:a05:6402:550a:b0:47f:bc9b:46ec with SMTP id fi10-20020a056402550a00b0047fbc9b46ecmr58228716edb.7.1673541940564;
        Thu, 12 Jan 2023 08:45:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i12-20020aa7dd0c000000b0047021294426sm7301988edv.90.2023.01.12.08.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 08:45:39 -0800 (PST)
Message-ID: <9b4cea4f-46dd-86da-d54a-0aa43bd00b4d@redhat.com>
Date:   Thu, 12 Jan 2023 17:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the CSL
 Panther Tab HD
Content-Language: en-US, nl
To:     Michael Klein <m.klein@mvz-labor-lb.de>,
        Mark Gross <markgross@kernel.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221220121103.uiwn5l7fii2iggct@LLGMVZLB-0037>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221220121103.uiwn5l7fii2iggct@LLGMVZLB-0037>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/20/22 13:11, Michael Klein wrote:
> Add touchscreen info for the CSL Panther Tab HD.
> 
> Signed-off-by: Michael Klein <m.klein@mvz-labor-lb.de>

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
>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index baae3120efd0..f00995390fdf 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -264,6 +264,23 @@ static const struct ts_dmi_data connect_tablet9_data = {
>  	.properties     = connect_tablet9_props,
>  };
>  
> +static const struct property_entry csl_panther_tab_hd_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 20),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1526),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-csl-panther-tab-hd.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data csl_panther_tab_hd_data = {
> +	.acpi_name      = "MSSL1680:00",
> +	.properties     = csl_panther_tab_hd_props,
> +};
> +
>  static const struct property_entry cube_iwork8_air_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
>  	PROPERTY_ENTRY_U32("touchscreen-min-y", 3),
> @@ -1124,6 +1141,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Tablet 9"),
>  		},
>  	},
> +	{
> +		/* CSL Panther Tab HD */
> +		.driver_data = (void *)&csl_panther_tab_hd_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "CSL Computer GmbH & Co. KG"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CSL Panther Tab HD"),
> +		},
> +	},
>  	{
>  		/* CUBE iwork8 Air */
>  		.driver_data = (void *)&cube_iwork8_air_data,

